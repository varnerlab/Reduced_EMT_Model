# Julia script to compute robsutness coefficients -
include("Sample.jl")
using PyCall
@pyimport numpy as np

const data_plasma = readdlm("../data/Average_Plasma_05.csv")
const dilution_factor = 0.79
const mixing_delay_time = 490.0
const tpa_level = 4.0
const experimental_data_array = [data_plasma[:,1] data_plasma[:,round(Int,tpa_level)+2]]
const rank_threshold = 1
const percentage_coverage = 0.60
const SMALL = 1e-6


# main: calculates the ratio of the AUC in the perturbed state, to the base state
function main()

  # Calculate the base AUC -
  base_auc_array = calculate_auc_base()
  idx_small = find(base_auc_array.< SMALL)
  base_auc_array[idx_small] = SMALL

  # how many sets did we sample?
  number_of_samples = length(base_auc_array)

  # Calculate the perturbed case -
  number_of_divisions = 50
  plasminogen_array = collect(linspace(0,3,number_of_divisions))
  tafi_array = collect(linspace(0,100,number_of_divisions))

  # Calculate the perturbed cases -
  mean_robsutness_array = -1.0*ones(number_of_divisions,number_of_divisions)
  std_robustness_array = -1.0*ones(number_of_divisions,number_of_divisions)
  for (plasminogen_array_index,plasminogen_value) in enumerate(plasminogen_array)
    for (tafi_array_index,tafi_value) in enumerate(tafi_array)

      # Solves the model over the ensemble, calculates the AUC and returns back the array -
      pertubed_auc_array = calculate_auc_perturbed(plasminogen_value,tafi_value)

      # calculate the robsutness coeffcients -
      tmp_array = zeros(number_of_samples)
      for sample_index = 1:number_of_samples

        base_value = base_auc_array[sample_index]
        perturbed_value = pertubed_auc_array[sample_index]
        tmp_array[sample_index] = perturbed_value/base_value # calculate robustness
      end

      # calc the mean and std -
      mean_robustness_value = mean(tmp_array)
      std_robustness_value = std(tmp_array)

      # cache -
      mean_robsutness_array[plasminogen_array_index,tafi_array_index] = mean_robustness_value
      std_robustness_array[plasminogen_array_index,tafi_array_index] = std_robustness_value

      println("Plasminogen index: "*string(plasminogen_array_index)*" and TAFI index: "*string(tafi_array_index))
    end

    # save tmp results to disk -
    tmp_mean_file_path = "./robustness/tmp-mean.dat"
    writedlm(tmp_mean_file_path,mean_robsutness_array)
    tmp_std_file_path = "./robustness/tmp-std.dat"
    writedlm(tmp_std_file_path,std_robustness_array)
  end

  return (mean_robsutness_array,std_robustness_array,plasminogen_array,tafi_array)
end

function calculate_auc_base()

  # Calculate the base AUC -

  # setup plasma specific constants -
  plasminogen_mean_level = 1.5
  tafi_mean_level = 50.0

  # Run the model -
  (T,A,mean_array,std_array,sample_idx_vec) = sample_ensemble(dilution_factor::Float64,tpa_level::Float64,
                                                                plasminogen_mean_level::Float64,
                                                                tafi_mean_level::Float64,
                                                                rank_threshold::Int,
                                                                percentage_coverage::Float64,
                                                                mixing_delay_time::Float64,
                                                                experimental_data_array::Array{Float64,2})

  # Calculate the AUC for the simulation archive A -
  (number_of_rows,number_of_cols) = size(A)
  auc_array = zeros(number_of_cols)
  for col_index = 1:number_of_cols
    auc_array[col_index] = trapz(T,A[:,col_index]) # integration 
  end

  return (auc_array)
end

function calculate_auc_perturbed(plasminogen_mean_level,tafi_mean_level)

  # Run the model -
  (T,A,mean_array,std_array,sample_idx_vec) = sample_ensemble(dilution_factor::Float64,tpa_level::Float64,
                                                                plasminogen_mean_level::Float64,
                                                                tafi_mean_level::Float64,
                                                                rank_threshold::Int,
                                                                percentage_coverage::Float64,
                                                                mixing_delay_time::Float64,
                                                                experimental_data_array::Array{Float64,2})

  # Calculate the AUC for the simulation archive A -
  (number_of_rows,number_of_cols) = size(A)
  auc_array = zeros(number_of_cols)
  for col_index = 1:number_of_cols
    auc_array[col_index] = trapz(T,A[:,col_index])
  end

  return (auc_array)
end

function trapz{Tx<:Number, Ty<:Number}(x::Vector{Tx}, y::Vector{Ty})
    # Trapezoidal integration rule
    local n = length(x)
    if (length(y) != n)
        error("Vectors 'x', 'y' must be of same length")
    end
    r = zero(zero(Tx) + zero(Ty))
    if n == 1; return r; end
    for i in 2:n
        r += (x[i] - x[i-1]) * (y[i] + y[i-1])
    end
    #= correction -h^2/12 * (f'(b) - f'(a))
    ha = x[2] - x[1]
    he = x[end] - x[end-1]
    ra = (y[2] - y[1]) / ha
    re = (y[end] - y[end-1]) / he
    r/2 - ha*he/12 * (re - ra)
    =#
    return r/2
end
