# Regenerate results using the parameter array
println(now())
using Debug
# Initialize simulation functions
fpath="../src/new_SimulationFunctions.jl" # Loads up DataFile , SolveBalances , Balances, Kinetics, Control
include(fpath)

# Establish simulation parameters
TSTART = 0.0;
Ts = 1.0; # 0.1
TSTOP = 250.0; # 100 ; 500

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
println("Model Population Size ", popsize)
for i in 1:popsize
  println("Regen ",i," of ",popsize)
  # Refactor data dictionary for model execution
  # need to specify implicit strucutre of parameter_array
  P = PC[:,i]
  data_dictionary["RATE_CONSTANT_ARRAY"] = P[1:len_rca]
  data_dictionary["CONTROL_PARAMETER_ARRAY"][:,1] = P[len_rca+1:A]
  data_dictionary["CONTROL_PARAMETER_ARRAY"][:,2] = P[A+1:B]
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

# now get mean and std

# indices for simulation data array sim_data
# 1 "edit_file_none.jl"
# 2 "edit_file_tgfb.jl"
# 3 "edit_file_mapkin.jl"
# 4 "edit_file_ss.jl"
# 5 "edit_file_ssecad.jl"
# 6 "edit_file_ss_tgfb3ab.jl"
# 7 "edit_file_ss_dnlef1.jl"
# 8 "edit_file_tgfb3.jl"
# 9 "edit_file_dnsmad.jl"
# 10 "edit_file_tgfb3_dnlef1.jl"

# LEF 1 protein (technically this not not total, due to active amt)
index_lef = 58
# LEF 1 active
index_lef_act = 59
# Snail_slug total protein
index_ss = 62
# ecadherin protein (unbound)
index_ecad = 51
# ecad_bcat index
index_ecad_bcat = 53
# vimentin protein
index_vim = 63
# tgfb3 protein
index_tgfb3 = 92
# This is fit to ACTIVE_TCF4, data is IP from bcat and tcf-4
index_bcat_tcf = 57 # i.e. this index is for Active_TCF4
# Should probably be total protein, so sum index_bcat with index_tcf
index_tcf = 56

index_psmad = 40
index_lef_mrna = 84
index_ecad_mrna = 16

index_gsk3_p = 44

## Designate arrays for each figure

F2A = Array{Float64,1}([])
F2B = Array{Float64,1}([])
F2C = Array{Float64,1}([])
F2D = Array{Float64,1}([])
F2E = Array{Float64,1}([])
F2F = Array{Float64,1}([])
F2G = Array{Float64,1}([])
F2H = Array{Float64,1}([])
F2I = Array{Float64,1}([])
F2J = Array{Float64,1}([])
F2K = Array{Float64,1}([])
F2L = Array{Float64,1}([])

F3B = Array{Float64,1}([])

t0  = 1
t24 = 74
t48 = 149
t72 = 224
# loop over results and build each figure

function norm_dat(data)
  min = minimum(data)
  max = maximum(data)

#  if max == 0
  #  max = 1
#  end
SMALL = 1e-3
if sum(data) > SMALL
  normalized_data = (data-min)/(max-min)
else
  normalized_data = zeros(data)
end
end

#
#out_dir = "../poets/results_poets/"
#writedlm(string(out_dir,"ensemble_dynamics.dat"),PC_results)

for state in PC_results

# PANEL A
bar1 = state[1][t48,index_ss]
bar2 = state[2][t48,index_ss]
bar3 = state[3][t48,index_ss]
bar1,bar2,bar3=norm_dat([bar1,bar2,bar3])
push!(F2A,bar1)
push!(F2A,bar2)
push!(F2A,bar3)

# PANEL B
bar1 = state[1][t48,index_lef] + state[1][t48,index_lef_act]
bar2 = state[2][t48,index_lef] + state[2][t48,index_lef_act]
bar3 = state[3][t48,index_lef] + state[3][t48,index_lef_act]
bar1,bar2,bar3=norm_dat([bar1,bar2,bar3])
push!(F2B,bar1)
push!(F2B,bar2)
push!(F2B,bar3)
# PANEL C
bar1 = state[1][t48,index_tgfb3]
bar2 = state[4][t48,index_tgfb3]
bar3 = state[5][t48,index_tgfb3]
bar1,bar2,bar3=norm_dat([bar1,bar2,bar3])
push!(F2C,bar1)
push!(F2C,bar2)
push!(F2C,bar3)
# PANEL D
bar1 = state[1][t48,index_vim]
bar2 = state[4][t48,index_vim]
bar3 = state[5][t48,index_vim]
bar1,bar2,bar3=norm_dat([bar1,bar2,bar3])
push!(F2D,bar1)
push!(F2D,bar2)
push!(F2D,bar3)
# PANEL E
bar1 = state[1][t48,index_lef] + state[1][t48,index_lef_act]
bar2 = state[4][t48,index_lef] + state[4][t48,index_lef_act]
bar3 = state[6][t48,index_lef] + state[6][t48,index_lef_act]
bar1,bar2,bar3=norm_dat([bar1,bar2,bar3])
push!(F2E,bar1)
push!(F2E,bar2)
push!(F2E,bar3)
# PANEL F # index_ecad_bcat
bar1 = state[1][t48,index_ecad] + state[1][t48,index_ecad_bcat]
bar2 = state[4][t48,index_ecad] + state[4][t48,index_ecad_bcat]
bar3 = state[7][t48,index_ecad] + state[7][t48,index_ecad_bcat]
bar1,bar2,bar3=norm_dat([bar1,bar2,bar3])
push!(F2F,bar1)
push!(F2F,bar2)
push!(F2F,bar3)
# PANEL G
bar1 = state[1][t48,index_lef] + state[1][t48,index_lef_act]
bar2 = state[8][t48,index_lef] + state[8][t48,index_lef_act]
bar3 = state[9][t48,index_lef] + state[9][t48,index_lef_act]
bar1,bar2,bar3=norm_dat([bar1,bar2,bar3])
push!(F2G,bar1)
push!(F2G,bar2)
push!(F2G,bar3)
# PANEL H
bar1 = state[1][t48,index_vim]
bar2 = state[8][t48,index_vim]
bar3 = state[9][t48,index_vim]
bar4 = state[10][t48,index_vim]
bar1,bar2,bar3,bar4=norm_dat([bar1,bar2,bar3,bar4])
push!(F2H,bar1)
push!(F2H,bar2)
push!(F2H,bar3)
push!(F2H,bar4)
# PANEL I
bar1 = state[1][t48,index_ecad] + state[1][t48,index_ecad_bcat]
bar2 = state[8][t48,index_ecad] + state[8][t48,index_ecad_bcat]
bar3 = state[9][t48,index_ecad] + state[9][t48,index_ecad_bcat]
bar4 = state[10][t48,index_ecad]+ state[10][t48,index_ecad_bcat]
bar1,bar2,bar3,bar4=norm_dat([bar1,bar2,bar3,bar4])
push!(F2I,bar1)
push!(F2I,bar2)
push!(F2I,bar3)
push!(F2I,bar4)

# PANEL J

bar1 = state[2][t0,index_ecad_mrna]
bar2 = state[2][t24,index_ecad_mrna]
bar3 = state[2][t48,index_ecad_mrna]
bar4 = state[2][t72,index_ecad_mrna]
bar1,bar2,bar3,bar4=norm_dat([bar1,bar2,bar3,bar4])
push!(F2J,bar1)
push!(F2J,bar2)
push!(F2J,bar3)
push!(F2J,bar4)

# PANEL K
bar1 = state[2][t0,index_psmad]
bar2 = state[2][t24,index_psmad]
bar3 = state[2][t48,index_psmad]
bar4 = state[2][t72,index_psmad]
bar1,bar2,bar3,bar4=norm_dat([bar1,bar2,bar3,bar4])
push!(F2K,bar1)
push!(F2K,bar2)
push!(F2K,bar3)
push!(F2K,bar4)

# PANEL L

bar1 = state[2][t0,index_lef_mrna]
bar2 = state[2][t24,index_lef_mrna]
bar3 = state[2][t48,index_lef_mrna]
bar4 = state[2][t72,index_lef_mrna]
bar1,bar2,bar3,bar4=norm_dat([bar1,bar2,bar3,bar4])
push!(F2L,bar1)
push!(F2L,bar2)
push!(F2L,bar3)
push!(F2L,bar4)

# Figure 3B

bar1 = state[1][t48,index_gsk3_p]
bar2 = state[8][t48,index_gsk3_p]
bar3 = state[11][t48,index_gsk3_p]
bar1,bar2,bar3=norm_dat([bar1,bar2,bar3])
push!(F3B,bar1)
push!(F3B,bar2)
push!(F3B,bar3)

# indices for simulation data array sim_data
# 1 "edit_file_none.jl"
# 2 "edit_file_tgfb.jl"
# 3 "edit_file_mapkin.jl"
# 4 "edit_file_ss.jl"
# 5 "edit_file_ssecad.jl"
# 6 "edit_file_ss_tgfb3ab.jl"
# 7 "edit_file_ss_dnlef1.jl"
# 8 "edit_file_tgfb3.jl"
# 9 "edit_file_dnsmad.jl"
# 10 "edit_file_tgfb3_dnlef1.jl"
end

# get mean and standard deviation
N = length(PC_results)
# bar1=sum(F2A[1:3:end])/N
# bar2=sum(F2A[2:3:end])/N
# bar3=sum(F2A[3:3:end])/N

# println(F2A[3:3:end])
#std(Array{Float64,1}(F2A[3:3:end]))

F2A = [sum(F2A[1:3:end])/N,sum(F2A[2:3:end])/N,sum(F2A[3:3:end])/N,std(F2A[1:3:end]),std(F2A[2:3:end]),std(F2A[3:3:end])]
F2B = [sum(F2B[1:3:end])/N,sum(F2B[2:3:end])/N,sum(F2B[3:3:end])/N,std(F2B[1:3:end]),std(F2B[2:3:end]),std(F2B[3:3:end])]
F2C = [sum(F2C[1:3:end])/N,sum(F2C[2:3:end])/N,sum(F2C[3:3:end])/N,std(F2C[1:3:end]),std(F2C[2:3:end]),std(F2C[3:3:end])]
F2D = [sum(F2D[1:3:end])/N,sum(F2D[2:3:end])/N,sum(F2D[3:3:end])/N,std(F2D[1:3:end]),std(F2D[2:3:end]),std(F2D[3:3:end])]
F2E = [sum(F2E[1:3:end])/N,sum(F2E[2:3:end])/N,sum(F2E[3:3:end])/N,std(F2E[1:3:end]),std(F2E[2:3:end]),std(F2E[3:3:end])]
F2F = [sum(F2F[1:3:end])/N,sum(F2F[2:3:end])/N,sum(F2F[3:3:end])/N,std(F2F[1:3:end]),std(F2F[2:3:end]),std(F2F[3:3:end])]
F2G = [sum(F2G[1:3:end])/N,sum(F2G[2:3:end])/N,sum(F2G[3:3:end])/N,std(F2G[1:3:end]),std(F2G[2:3:end]),std(F2G[3:3:end])]
F2H = [sum(F2H[1:4:end])/N,sum(F2H[2:4:end])/N,sum(F2H[3:4:end])/N,sum(F2H[4:4:end])/N,std(F2H[1:4:end]),std(F2H[2:4:end]),std(F2H[3:4:end]),std(F2H[4:4:end])]
F2I = [sum(F2I[1:4:end])/N,sum(F2I[2:4:end])/N,sum(F2I[3:4:end])/N,sum(F2I[4:4:end])/N,std(F2I[1:4:end]),std(F2I[2:4:end]),std(F2I[3:4:end]),std(F2I[4:4:end])]
F2J = [sum(F2J[1:4:end])/N,sum(F2J[2:4:end])/N,sum(F2J[3:4:end])/N,sum(F2J[4:4:end])/N,std(F2J[1:4:end]),std(F2J[2:4:end]),std(F2J[3:4:end]),std(F2J[4:4:end])]
F2K = [sum(F2K[1:4:end])/N,sum(F2K[2:4:end])/N,sum(F2K[3:4:end])/N,sum(F2K[4:4:end])/N,std(F2K[1:4:end]),std(F2K[2:4:end]),std(F2K[3:4:end]),std(F2K[4:4:end])]
F2L = [sum(F2L[1:4:end])/N,sum(F2L[2:4:end])/N,sum(F2L[3:4:end])/N,sum(F2L[4:4:end])/N,std(F2L[1:4:end]),std(F2L[2:4:end]),std(F2L[3:4:end]),std(F2L[4:4:end])]

F3B = [sum(F3B[1:3:end])/N,sum(F3B[2:3:end])/N,sum(F3B[3:3:end])/N,std(F3B[1:3:end]),std(F3B[2:3:end]),std(F3B[3:3:end])]


out_dir = "../poets/results_poets/"

writedlm(string(out_dir,"F2A",".dat"),F2A)
writedlm(string(out_dir,"F2B",".dat"),F2B)
writedlm(string(out_dir,"F2C",".dat"),F2C)
writedlm(string(out_dir,"F2D",".dat"),F2D)
writedlm(string(out_dir,"F2E",".dat"),F2E)
writedlm(string(out_dir,"F2F",".dat"),F2F)
writedlm(string(out_dir,"F2G",".dat"),F2G)
writedlm(string(out_dir,"F2H",".dat"),F2H)
writedlm(string(out_dir,"F2I",".dat"),F2I)
writedlm(string(out_dir,"F2J",".dat"),F2J)
writedlm(string(out_dir,"F2K",".dat"),F2K)
writedlm(string(out_dir,"F2L",".dat"),F2L)

writedlm(string(out_dir,"F3B",".dat"),F3B)

println(now())
