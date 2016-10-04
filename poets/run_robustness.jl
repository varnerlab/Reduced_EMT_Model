


# for each parameter sim_select

# generate


println(now())
using Debug
# Initialize simulation functions
fpath="../src/new_SimulationFunctions.jl" # Loads up DataFile , SolveBalances , Balances, Kinetics, Control
include(fpath)

# Establish simulation parameters
TSTART = 0.0;
Ts = 1.0; # 0.1
TSTOP = 250.0; # 250

# Initialize intial data dictionary
data_dictionary = DataFile(TSTART,TSTOP,Ts)
len_cpa = length(data_dictionary["CONTROL_PARAMETER_ARRAY"])
len_rca = length(data_dictionary["RATE_CONSTANT_ARRAY"])
len_sca = length(data_dictionary["SATURATION_CONSTANT_ARRAY"])
sca_indices,sca_values = [],[]
for i in 1:len_sca
  val = data_dictionary["SATURATION_CONSTANT_ARRAY"][i]
if val !=0
  push!(sca_indices,i)
  push!(sca_values,val)
end
end

sca_pack = zip(sca_indices,sca_values)

 # CPA, let's give access to gain AND power
 cpa_gain = data_dictionary["CONTROL_PARAMETER_ARRAY"][:,1] # Gain
 cpa_order= data_dictionary["CONTROL_PARAMETER_ARRAY"][:,2] # Power

 # get lengths of new arrays
 len_cpa_gain = length(cpa_gain)
 len_cpa_order = length(cpa_order)
 len_sca_values = length(sca_values)

 len_sca_prime = length(sca_values)
   A = len_rca + len_cpa_gain
   B = A + len_cpa_order
   C = B + len_sca_prime

# read parameter arrays resulting from POETs

PC = readdlm("PC.dat")

# PC is an array of parameter arrays
PC_results =[]
fraction = 1
popsize = Int(length(PC[1,:])*fraction)
# popsize = 2 # to debug
println("Model Population Size ", popsize)
for i in 1:popsize
  println("Regen ",i," of ",popsize)
  # Refactor data dictionary for model execution
  # need to specify implicit strucutre of parameter_array
  P = PC[:,i]
  data_dictionary["RATE_CONSTANT_ARRAY"] = P[1:len_rca]
  data_dictionary["CONTROL_PARAMETER_ARRAY"][:,1] = P[len_rca+1:A]
  data_dictionary["CONTROL_PARAMETER_ARRAY"][:,2] = P[A+1:B]
# tune VEGF/NFATc1 parameters
  control_parameter_array=data_dictionary["CONTROL_PARAMETER_ARRAY"]
  control_parameter_array[6,1]=0.001 # GAIN NFATc1 -> Ecadherin_Bcatenin
  control_parameter_array[6,2]=1.5 # ORDER
  data_dictionary["CONTROL_PARAMETER_ARRAY"]=control_parameter_array
  rate_constant_array=data_dictionary["RATE_CONSTANT_ARRAY"]
# degradation rates
  rate_constant_array[34]=25.0
  rate_constant_array[36]=100.0
  rate_constant_array[37]=100.0
# PKC->RAF activation rate
  rate_constant_array[11]=0.0
  data_dictionary["RATE_CONSTANT_ARRAY"]=rate_constant_array

  # Rebuild SCA
  sca_pack = zip(sca_indices,P[B+1:C]) # new values
  for (i,val) in sca_pack
  data_dictionary["SATURATION_CONSTANT_ARRAY"][i]=val
  end

  # Run to Steady State
 #println("running to SS")
  XSS = EstimateSteadyState(data_dictionary)
  initial_condition_array = vec(XSS);
  data_dictionary["INITIAL_CONDITION_ARRAY"] = initial_condition_array;
  xss_data_dict = deepcopy(data_dictionary)

  simulations = ["edit_file_none.jl","edit_file_tgfb.jl","edit_file_mapkin.jl","edit_file_ss.jl","edit_file_ssecad.jl","edit_file_ss_tgfb3ab.jl","edit_file_ss_dnlef1.jl","edit_file_tgfb3.jl","edit_file_dnsmad.jl","edit_file_tgfb3_dnlef1.jl","edit_file_tgfb_tgfb3ab.jl"]
# Need new simulations for TGFB, VEGF, TGFB+VEGF, VEGF+VIVIT, TGFB+VIVIT,
  simulations = ["edit_file_none.jl","edit_file_tgfb.jl","edit_file_vegf.jl","edit_file_tgfb_vegf.jl",
  "edit_file_tgfb_vegf_vi.jl","edit_file_tgfb_vi.jl","edit_file_vegf_vi.jl"]
  sim_data = [] # Keep data in RAM
  for sim in simulations
    ##### What data_dictionary should be loaded here??? clearly the active one
    active_data_dictionary = deepcopy(xss_data_dict)
    (TSIM,X) =  SolveModelGenericPOETS(TSTART,TSTOP,Ts,active_data_dictionary,string("../src/",sim))
    push!(sim_data,X)
    # now reset the data dictionary
  end
  push!(PC_results,sim_data)

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
#@show "BYPASS ROBUSTNESS CALC"
function compute_robustness(BASE,PERT,TIME_B,TIME_P,K=0)

#base_auc = trapz(TIME_B,BASE)
#pert_auc = trapz(TIME_P,PERT)
#ROBUSTNESS = (pert_auc)/(K+base_auc)

return PERT[t48]
#return ROBUSTNESS
end

# # ok we will overwrite these indices to plot nfat and sp1

# ecadherin protein (unbound)
index_ecad = 51
#index_ecad = 16 # MRNA!!
# ecad_bcat index
index_ecad_bcat = 53
# vimentin protein
index_vim = 63
#index_vim = 85 # MRNA
t0  = 1
t24 = 74
t48 = 149
t72 = 224
t96 = 298
ti = t0
tf = t48
TIME = collect(ti:tf)


# sim indices
# 1 edit_file_none.jl
# 2 edit_file_tgfb.jl
# 3 edit_file_vegf.jl
# 4 edit_file_tgfb_vegf.jl
# 5 edit_file_tgfb_vegf_vi.jl
# 6 edit_file_tgfb_vi.jl
# 7 edit_file_vegf_vi.jl

robustness_array = []

const K = 0 # offset for robustness calc
for state in PC_results # iterate over parameter sets

state_robustness_values = []

# calculate tgfb robustness
# sample from 0 to 48 hrs and integrate
# get time series for simulation
base_ = state[1]
pert_ = state[2]

# select species and time range from simulation
base_ecad = base_[ti:tf,index_ecad] #+ base_[ti:tf,index_ecad_bcat]
pert_ecad = pert_[ti:tf,index_ecad] #+ pert_[ti:tf,index_ecad_bcat]
base_vim  = base_[ti:tf,index_vim]
pert_vim  = pert_[ti:tf,index_vim]

# compute robustness
robustness_ecad = compute_robustness(base_ecad,pert_ecad,TIME,TIME,K)
robustness_vim  = compute_robustness(base_vim,pert_vim,TIME,TIME,K)
push!(state_robustness_values, robustness_ecad)
push!(state_robustness_values, robustness_vim)

# calculate vegf robustness
# sample from 0 to 48 hrs and integrate
base_ = state[1]
pert_ = state[3]

base_ecad = base_[ti:tf,index_ecad] #+ base_[ti:tf,index_ecad_bcat]
pert_ecad = pert_[ti:tf,index_ecad] #+ pert_[ti:tf,index_ecad_bcat]
base_vim  = base_[ti:tf,index_vim]
pert_vim  = pert_[ti:tf,index_vim]

robustness_ecad = compute_robustness(base_ecad,pert_ecad,TIME,TIME,K)
robustness_vim  = compute_robustness(base_vim,pert_vim,TIME,TIME,K)
push!(state_robustness_values, robustness_ecad)
push!(state_robustness_values, robustness_vim)

# calculate tgfb vegf robustness
# sample from 0 to 48 hrs and integrate
base_ = state[1]
pert_ = state[4]

base_ecad = base_[ti:tf,index_ecad] #+ base_[ti:tf,index_ecad_bcat]
pert_ecad = pert_[ti:tf,index_ecad] #+ pert_[ti:tf,index_ecad_bcat]
base_vim  = base_[ti:tf,index_vim]
pert_vim  = pert_[ti:tf,index_vim]

robustness_ecad = compute_robustness(base_ecad,pert_ecad,TIME,TIME,K)
robustness_vim  = compute_robustness(base_vim,pert_vim,TIME,TIME,K)
push!(state_robustness_values, robustness_ecad)
push!(state_robustness_values, robustness_vim)

# calculate tgfb vegf vi robustness
# sample from 0 to 48 hrs and integrate
base_ = state[1]
pert_ = state[5]

base_ecad = base_[ti:tf,index_ecad] #+ base_[ti:tf,index_ecad_bcat]
pert_ecad = pert_[ti:tf,index_ecad] #+ pert_[ti:tf,index_ecad_bcat]
base_vim  = base_[ti:tf,index_vim]
pert_vim  = pert_[ti:tf,index_vim]

robustness_ecad = compute_robustness(base_ecad,pert_ecad,TIME,TIME,K)
robustness_vim  = compute_robustness(base_vim,pert_vim,TIME,TIME,K)
push!(state_robustness_values, robustness_ecad)
push!(state_robustness_values, robustness_vim)

# calculate tgfb vi robustness
# sample from 0 to 48 hrs and integrate
base_ = state[1]
pert_ = state[6]

base_ecad = base_[ti:tf,index_ecad] #+ base_[ti:tf,index_ecad_bcat]
pert_ecad = pert_[ti:tf,index_ecad] #+ pert_[ti:tf,index_ecad_bcat]
base_vim  = base_[ti:tf,index_vim]
pert_vim  = pert_[ti:tf,index_vim]

robustness_ecad = compute_robustness(base_ecad,pert_ecad,TIME,TIME,K)
robustness_vim  = compute_robustness(base_vim,pert_vim,TIME,TIME,K)
push!(state_robustness_values, robustness_ecad)
push!(state_robustness_values, robustness_vim)

# calculate vegf vi robustness
# sample from 0 to 48 hrs and integrate
base_ = state[1]
pert_ = state[7]
# base_ = state[2]# test
# pert_ = state[2]

base_ecad = base_[ti:tf,index_ecad] #+ base_[ti:tf,index_ecad_bcat]
pert_ecad = pert_[ti:tf,index_ecad] #+ pert_[ti:tf,index_ecad_bcat]
base_vim  = base_[ti:tf,index_vim]
pert_vim  = pert_[ti:tf,index_vim]

robustness_ecad = compute_robustness(base_ecad,pert_ecad,TIME,TIME,K)
robustness_vim  = compute_robustness(base_vim,pert_vim,TIME,TIME,K)
push!(state_robustness_values, robustness_ecad)
push!(state_robustness_values, robustness_vim)

# let's report the base case
push!(state_robustness_values, base_ecad[t48])
push!(state_robustness_values, base_vim[t48])

push!(robustness_array, state_robustness_values)


end


out_dir = "../poets/results_poets/"

writedlm(string(out_dir,"Robustness_training_set",".dat"),robustness_array,',')
# execfile('/home/dbassen/Dropbox/pyprgs/in_out_line.py')
# execfile('/home/dbassen/Dropbox/pyprgs/in_out_csv.py')
# b = lin.reader("results_poets/Robustness_training_set.dat")
# csv.nestedToFlt([( str.replace('Any[' ,'').replace(']','')).split(',') for str in b]) # python



### END ###

# # TGFB
# robustness_tgfb_ecad = []
# robustness_tgfb_vim = []
# # VEGF
# robustness_vegf_ecad = []
# robustness_vegf_vim = []
# # VEGF + TGFB
# robustness_tgfbvegf_ecad = []
# robustness_tgfbvegf_vim = []
# # VEGF + TGFB + VIVIT
# robustness_tgfbvegfviv_ecad = []
# robustness_tgfbvegfviv_vim = []
# # TGFB + VI
# robustness_tgfbviv_ecad = []
# robustness_tgfbviv_vim = []
# # VEGF + VI
# robustness_vegfviv_ecad = []
# robustness_vegfviv_vim = []
