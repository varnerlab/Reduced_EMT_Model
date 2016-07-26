# This file currently contains both the objective function and preprocessing
# steps, plus helper functions SSE and norm

# some global parameters -
BIG = 1e10
num_objs = 11

# How we calculate error
function SSE(model_values,data_values)
  y = model_values
  m = data_values
  # (max(y)-10)^2
  E = sum((m-y).^2)
end

# How we normalize the data
function norm_dat(data)
  min = minimum(data)
  max = maximum(data)
  normalized_data = (data-min)/(max-min)
end

#     #    #   # Prep objective data
# Load and Normalize each blot individually
fpath="/home/dbassen/Dropbox/server_swap_space/gen_2_model/poets/medici_blot_combined.jl"
include(fpath)
Fig1B = norm_dat(Fig1B)
Fig1F = norm_dat(Fig1F)
Fig2A = norm_dat(Fig2A)
Fig2E = norm_dat(Fig2E)
Fig3D = norm_dat(Fig3D)
Fig3F = norm_dat(Fig3F)
Fig4D = norm_dat(Fig4D)
Fig4E = norm_dat(Fig4E)
Fig4G = norm_dat(Fig4G)
Fig5A = norm_dat(Fig5A)
Fig5C = norm_dat(Fig5C)

#     #    #   # Initialize and  Run model to steady state
 # EXECUTE RunAllSimulations UP TO LOOP

 # Load data dictionary off disk

 # Initialize simulation functions
 fpath="/home/dbassen/Dropbox/server_swap_space/gen_2_model/src/new_SimulationFunctions.jl" # Loads up DataFile , SolveBalances , Balances, Kinetics, Control
 include(fpath)

 # Establish simulation parameters
 TSTART = 0.0;
 Ts = 0.1;
 TSTOP = 100.0;

 # Initialize intial data dictionary
 data_dictionary = DataFile(TSTART,TSTOP,Ts)

 # # # #

# update control parameter array here for now
GAIN_MASTER = 0.3
num_regs = 17;
control_parameter_array=data_dictionary["CONTROL_PARAMETER_ARRAY"]
for i in 1:num_regs
  control_parameter_array[i,1]=GAIN_MASTER # Gain for transcriptional activity
end
# TGFB3_inhibition: TGFB3_Ab inhibition; TGFB3_binding
control_parameter_array[1,1]=30.0 # GAIN # _tgfb3_Ab
# GSK3_P_inhibition_Binding_APC_AXIN_forw: GSK3_P inhibition; Binding_APC_AXIN_forw
control_parameter_array[2,1]=3.0 # GAIN # GSK3_P_inhibition_Binding_APC_AXIN_forw
control_parameter_array[2,2]=1.0 # ORDER# GSK3_P_inhibition_Binding_APC_AXIN_forw
# Active_TCF4_inhibition_Ecad: Ecadherin_Bcatenin inhibition; TCF4_Bcatenin_complex_formation
control_parameter_array[3,1]=0.5 # GAIN # Active_TCF4_inhibition_Ecad
# Active_TCF4_inhibition_APC: APC_AXIN_Bcatenin inhibition; TCF4_Bcatenin_complex_formation
control_parameter_array[4,1]=0.5 # GAIN # Active_TCF4_inhibition_APC
# activation_Ecadherin_by_Active_NFATc: Active_NFATc induction induction_gene_Ecadherin
control_parameter_array[5,1]=0.3 # GAIN # activation_Ecadherin_by_Active_NFATc
# repression_Ecadherin_by_pSmad: pSmad repression induction_gene_Ecadherin
control_parameter_array[6,1]=1.0 # GAIN # REP_ECAD_PSMAD
# repression_Ecadherin_by_SNAIL_SLUG: SNAIL_SLUG repression induction_gene_Ecadherin
control_parameter_array[7,1]=2.0 # GAIN_SNAIL_SLUG_ECAD
# repression_Ecadherin_by_Active_LEF1: Active_LEF1 repression induction_gene_Ecadherin
control_parameter_array[8,1]=12.0# GAIN_ACTIVE_LEF1_ECAD
#  control_parameter_array[6,1]=0.3 # GAIN_BCAT_TGFB3
# activation_Ecadherin_by_ecad_virus: ecad_virus induction induction_gene_Ecadherin
control_parameter_array[9,1]=0.5 # ecad_virus ***
# activation_TGFB3_by_TCF4: Active_TCF4 induction induction_gene_TGFB3
control_parameter_array[10,1]=0.5 # GAIN_TCF4_TGFB3
# repression_TGFB3_by_YREG1: YREG1 repression induction_gene_TGFB3
control_parameter_array[11,1]=8.0 # YREG_TGFB3
# repression_YREG1_by_SNAIL_SLUG: SNAIL_SLUG repression induction_gene_YREG1
control_parameter_array[12,1]=6.0 # SNAIL_YREG1
# activation_LEF1_by_pSmad: pSmad induction induction_gene_LEF1
control_parameter_array[13,1]=0.8# GAIN # _PSMAD_LEF1 # 0.5
control_parameter_array[13,2]=1.0# ORDER# _PSMAD_LEF1
# repression_LEF1_by_YREG1: YREG1 repression induction_gene_LEF1
control_parameter_array[14,1]=5.0 # YREG1_LEF1
# activation_vimentin_by_Active_LEF1: Active_LEF1 induction induction_gene_vimentin
control_parameter_array[15,1]=0.5# GAIN_LEF1_VIM
control_parameter_array[15,2]=2.0# ORDER_LEF1_VIM
# activation_SNAIL_SLUG_by_ss_virus: ss_virus induction induction_gene_SNAIL_SLUG
control_parameter_array[17,1]=1.0# SS_VIRUS ***

# # # #

 data_dictionary["CONTROL_PARAMETER_ARRAY"]=control_parameter_array

 # Also use edit_file_global here
 fpath = "/home/dbassen/Dropbox/server_swap_space/gen_2_model/src/edit_file_global.jl"
 include(fpath)
 UpdateArray(data_dictionary,"INITIAL_CONDITION_ARRAY",initial_cond_update_array)
 UpdateArray(data_dictionary,"RATE_CONSTANT_ARRAY",rate_constant_update_array)

  # False, this will break the simulations
#  const pa103=parameter_array[103]
#  const pa104=parameter_array[104]
#  const pa105=parameter_array[105]
#  const pa106=parameter_array[106]
#  const pa107=parameter_array[107]
#  const pa108=parameter_array[108]
#  const pa109=parameter_array[109]
#  const pa110=parameter_array[110]
#  const pa111=parameter_array[111]
#  const pa112=parameter_array[112]
#  const pa113=parameter_array[113]
#  const pa114=parameter_array[114]
#  const pa115=parameter_array[115]
#  const pa116=parameter_array[116]
#  const pa117=parameter_array[117]
#  const pa118=parameter_array[118]

 println("Running to steady state ... ")

 # # # STEADY STATE
 println(now())
 XSS = EstimateSteadyState(data_dictionary)
 println(now())
 initial_condition_array = vec(XSS);
 data_dictionary["INITIAL_CONDITION_ARRAY"] = initial_condition_array;
 xss_data_dict = deepcopy(data_dictionary) # may not be necessary



#     #    #   # Prep data dictionary for rapid deconstruction / reassembly
len_cpa = length(data_dictionary["CONTROL_PARAMETER_ARRAY"])
len_rca = length(data_dictionary["RATE_CONSTANT_ARRAY"])
len_sca = length(data_dictionary["SATURATION_CONSTANT_ARRAY"])

# We cannot simply dump each array into the parameter array, since each
# sub array as a different shape (especially the SCA)
 # get lengths of data dictoinary components to be included in simulation

 # SCA is sparse, so let's gather linear indices for its non-zero terms
 i = 1 #index to start at
 sca_indices,sca_values = [],[]
 for i in 1:len_sca
   val = data_dictionary["SATURATION_CONSTANT_ARRAY"][i]
 if val !=0
   push!(sca_indices,i)
   push!(sca_values,val)
 end
 end
 # package for quick reconstruction
 # this needs to be reassembled at runtime anyway :/
 sca_pack = zip(sca_indices,sca_values)

  # CPA, let's give access to gain AND power
  cpa_gain = data_dictionary["CONTROL_PARAMETER_ARRAY"][:,1] # Gain
  cpa_order= data_dictionary["CONTROL_PARAMETER_ARRAY"][:,2] # Power

# Initialize parameter_array
 parameter_array = []
 append!(parameter_array,data_dictionary["RATE_CONSTANT_ARRAY"])
 append!(parameter_array,cpa_gain)
 append!(parameter_array,cpa_order)
 append!(parameter_array,sca_values)

 # get lengths of new arrays
 len_cpa_gain = length(cpa_gain)
 len_cpa_order = length(cpa_order)
 len_sca_values = length(sca_values)
 # array order RCA,CPAGAIN,CPAORDER,SCA
   # need indices for reconstruction
len_sca_prime = length(sca_values)
  A = len_rca + len_cpa_gain
  B = A + len_cpa_order
  C = B + len_sca_prime

# parameter_array gets sent to estimate estimate_ensemble as initial_state

#Evaluates the objective function values -
function objective_function(parameter_array)

 # Alias the species -
 # in order of appearance below!

# Descriptions include the CURRENT indexed value,
# NOT necessarily the correct one
# Indices are from the DataFile and are NOT automously updated!!!
 # LEF 1 protein (technically this not not total, due to active amt)
 index_lef = 58
 # LEF 1 active
 index_lef_act = 59
 # Snail_slug total protein
 index_ss = 62
 # ecadherin protein (unbound)
 index_ecad = 51
 # vimentin protein
 index_vim = 63
 # tgfb3 protein
 index_tgfb3 = 91
 # This is fit to ACTIVE_TCF4, data is IP from bcat and tcf-4
 index_bcat_tcf = 57 # i.e. this index is for Active_TCF4
 # Should probably be total protein, so sum index_bcat with index_tcf
 index_tcf = 56
 #
 #
 #

 # Alias species as they will appear in the output array

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
# 11 "edit_file_tgfb_tgfb3ab.jl"

#  MOD,BLOT = norm_dat(MOD),norm_dat(BLOT)

 # Execute simulations

 # Calculate the objective function array -
 obj_array = BIG*ones(num_objs,1)

 # Refactor data dictionary for model execution
 # need to specify implicit strucutre of parameter_array
 # structure: rca;cpa(1);cpa(2);sca
 data_dictionary["RATE_CONSTANT_ARRAY"] = parameter_array[1:len_rca]
 data_dictionary["CONTROL_PARAMETER_ARRAY"][:,1] = parameter_array[len_rca+1:A]
 data_dictionary["CONTROL_PARAMETER_ARRAY"][:,2] = parameter_array[A+1:B]
# Rebuild SCA
 sca_pack = zip(sca_indices,parameter_array[B+1:C]) # new values
 for (i,val) in sca_pack
 data_dictionary["SATURATION_CONSTANT_ARRAY"][i]=val
 end

### RUN TO NEW STEADY STATE!
# Make new xss_data_dict

# # # STEADY STATE
# WAIT, what initial condiiton array do we use???
# use last steady state, we should still be stored in the data_dictionary object
# as long as it is global
# # # # THIS DATA DICTIONARY CONTAINS THE MASTER STATE
# # # # FOR A GIVEN SET OF PARAMETERS
XSS = EstimateSteadyState(data_dictionary) # BE CAREFUL WITH DATA DICTIONARY NAME
initial_condition_array = vec(XSS);
data_dictionary["INITIAL_CONDITION_ARRAY"] = initial_condition_array;
xss_data_dict = deepcopy(data_dictionary) # BE CAREFUL WITH DATA DICTIONARY NAME

### EXECUTE RunAllSimulations loop (without file writes)

# ??? This should be read off of ram SolveModelGeneric needs to be updated
simulations = ["edit_file_none.jl","edit_file_tgfb.jl","edit_file_mapkin.jl","edit_file_ss.jl","edit_file_ssecad.jl","edit_file_ss_tgfb3ab.jl","edit_file_ss_dnlef1.jl","edit_file_tgfb3.jl","edit_file_dnsmad.jl","edit_file_tgfb3_dnlef1.jl","edit_file_tgfb_tgfb3ab.jl"]
sim_data = [] # Keep data in RAM
for sim in simulations
  ##### What data_dictionary should be loaded here??? clearly the active one
  data_dictionary = deepcopy(xss_data_dict) # RENAME THIS TO RETAIN ORIGINAL call it data_dictionary_active
  (TSIM,X) =  SolveModelGenericPOETS(TSTART,TSTOP,Ts,data_dictionary,string("/home/dbassen/Dropbox/server_swap_space/gen_2_model/src/",sim))
  push!(sim_data,X)
  # now reset the data dictionary
end

###
t48 = 528 # 48 hours(24hrs = 264)
 #  sim_data[1][526,55] -> [t48,index_species]
 # specific objectives
 # EXP [conditions] RO [readouts]
 #1 EXP SS RO SS LEF

 MOD  = [sim_data[1][t48,index_ss],sim_data[1][t48,index_lef],
         sim_data[4][t48,index_ss],sim_data[4][t48,index_lef]]
 BLOT = [Fig1B[1],Fig1B[9],
         Fig1B[2],Fig1B[10]]
 MOD = norm_dat(MOD)
 obj_array[1]  = SSE(MOD,BLOT)

 #2 EXP SS DNLEF RO ECAD VIM
 MOD  = [sim_data[1][t48,index_ecad],sim_data[1][t48,index_vim],
         sim_data[4][t48,index_ecad],sim_data[4][t48,index_vim],
         sim_data[7][t48,index_ecad],sim_data[7][t48,index_vim]]
 BLOT = [Fig1F[1],Fig1F[5],
         Fig1F[2],Fig1F[6],
         Fig1F[4],Fig1F[8]]
 MOD = norm_dat(MOD)

 obj_array[2]  = SSE(MOD,BLOT)

 #3 EXP SS RO TGFB3
 MOD  = [sim_data[1][t48,index_tgfb3],
         sim_data[4][t48,index_tgfb3]]
 BLOT = [Fig2A[1],
         Fig2A[2]]
 MOD = norm_dat(MOD)
 obj_array[3]  = SSE(MOD,BLOT)

 #4 EXP SS TGFBab RO LEF ECAD VIM
 MOD  = [sim_data[1][t48,index_ecad],sim_data[1][t48,index_vim],sim_data[1][t48,index_lef],
         sim_data[4][t48,index_ecad],sim_data[4][t48,index_vim],sim_data[4][t48,index_lef],
         sim_data[6][t48,index_ecad],sim_data[6][t48,index_vim],sim_data[6][t48,index_lef]]
 BLOT = [Fig2E[6],Fig2E[11],Fig2E[1],
         Fig2E[7],Fig2E[12],Fig2E[2],
         Fig2E[10],Fig2E[15],Fig2E[5]]
 MOD = norm_dat(MOD)
 obj_array[4] = SSE(MOD,BLOT)

 #5 EXP SS ECAD RO BCAT TCF4
 # CAREFUL in setting index_bcat & index_tcf, total BCAT & TCF?
 # consistent with total TCF4 and free/nuclear bcat, but need to verify
 MOD  = [sim_data[1][t48,index_bcat_tcf],sim_data[1][t48,index_tcf]+sim_data[1][t48,index_bcat_tcf],
         sim_data[4][t48,index_bcat_tcf],sim_data[4][t48,index_tcf]+sim_data[4][t48,index_bcat_tcf],
         sim_data[5][t48,index_bcat_tcf],sim_data[5][t48,index_tcf]+sim_data[5][t48,index_bcat_tcf]]
 BLOT = [Fig3D[1],Fig3D[6],
         Fig3D[2],Fig3D[7],
         Fig3D[5],Fig3D[10]]
 MOD = norm_dat(MOD)
 obj_array[5]  = SSE(MOD,BLOT)

 #6 EXP SS ECAD RO TGFB3 ECAD VIM
 MOD  = [sim_data[1][t48,index_tgfb3],sim_data[1][t48,index_vim],sim_data[1][t48,index_ecad],
         sim_data[4][t48,index_tgfb3],sim_data[4][t48,index_vim],sim_data[4][t48,index_ecad],
         sim_data[5][t48,index_tgfb3],sim_data[5][t48,index_vim],sim_data[5][t48,index_ecad]]
 BLOT = [Fig3F[1],Fig3F[11],Fig3F[6],
         Fig3F[2],Fig3F[12],Fig3F[7],
         Fig3F[5],Fig3F[15],Fig3F[10]]
 MOD = norm_dat(MOD)
 obj_array[6]  = SSE(MOD,BLOT)

 #7 EXP TGFB3 RO SS
 MOD  = [sim_data[1][t48,index_tgfb3],
         sim_data[8][t48,index_tgfb3]]
 BLOT = [Fig4D[1],
         Fig4D[2]]
 MOD = norm_dat(MOD)
 obj_array[7]  = SSE(MOD,BLOT)

 #8 EXP TGFB3 DNSMAD RO LEF
 MOD  = [sim_data[1][t48,index_lef],
         sim_data[8][t48,index_lef],
         sim_data[9][t48,index_lef]]
 BLOT = [Fig4E[1],
         Fig4E[2],
         Fig4E[3]]
 MOD = norm_dat(MOD)
 obj_array[8]  = SSE(MOD,BLOT)

 #9 EXP TGFB3 DNSMAD DNLEF RO ECAD VIM
 # RESTART HERE ..
 MOD  = [sim_data[1][t48,index_ecad],sim_data[1][t48,index_vim],
         sim_data[8][t48,index_ecad],sim_data[8][t48,index_vim],
         sim_data[9][t48,index_ecad],sim_data[9][t48,index_vim],
         sim_data[10][t48,index_ecad],sim_data[10][t48,index_vim]]
 BLOT = [Fig4G[1],Fig4G[5],
         Fig4G[2],Fig4G[6],
         Fig4G[3],Fig4G[7],
         Fig4G[4],Fig4G[8]]
 MOD = norm_dat(MOD)
 obj_array[9]  = SSE(MOD,BLOT)

 #10 EXP TGFB2 DNMEK RO SS
 MOD  = [sim_data[1][t48,index_ss],
         sim_data[2][t48,index_ss],
         sim_data[3][t48,index_ss]]
 BLOT = [Fig5A[1],
         Fig5A[2],
         Fig5A[3]]
 MOD = norm_dat(MOD)
 obj_array[10] = SSE(MOD,BLOT)

 #11 EXP TGFB TGFB3_Abn RO LEF1
  # generate new experiment EXP TGFB + TGFB3_Ab RO: LEF1
 MOD  = [sim_data[1][t48,index_lef],
         sim_data[2][t48,index_lef],
         sim_data[11][t48,index_lef]] # patched
 BLOT = [Fig5C[1],
         Fig5C[2],
         Fig5C[3]]
 MOD = norm_dat(MOD)
 obj_array[11] = SSE(MOD,BLOT)

 # Constraints are implemented as a penaltly on obj value
 lambda_value = 100.0

 # How much do we violate the constraints?
 #violation_constraint_1 = 25 - (x-5.0)^2 - y^2
 #violation_constraint_2 = (x-8.0)^2 + (y-3.0)^2 - 7.7
 penaltly_array = zeros(num_objs)
 #penaltly_array[1] = lambda_value*(min(0,violation_constraint_1))^2
 #penaltly_array[2] = lambda_value*(min(0,violation_constraint_2))^2

 # return the obj_array -
 return obj_array+penaltly_array
end


#     #    #   # Provide other model specific functions for POETS
# FROM JV ...
# Generates new parameter array, given current array -
function neighbor_function(parameter_array)

  SIGMA = 0.05
  number_of_parameters = length(parameter_array)

  # calculate new parameters -
  new_parameter_array = parameter_array.*(1+SIGMA*randn(number_of_parameters))

  # Check the bound constraints -
  LOWER_BOUND = zeros(parameter_array)
  UPPER_BOUND = LOWER_BOUND + 100

  # return the corrected parameter arrays -
  return parameter_bounds_function(new_parameter_array,LOWER_BOUND,UPPER_BOUND)
end

function acceptance_probability_function(rank_array,temperature)

  return (exp(-rank_array[end]/temperature))

end

function cooling_function(temperature)

  # define my new temperature -
  alpha = 0.8 #0.9
  return alpha*temperature
end

# Helper functions -
function parameter_bounds_function(parameter_array,lower_bound_array,upper_bound_array)

  # reflection_factor -
  epsilon = 0.01

  # iterate through and fix the parameters -
  new_parameter_array = copy(parameter_array)
  for (index,value) in enumerate(parameter_array)

    lower_bound = lower_bound_array[index]
    upper_bound = upper_bound_array[index]
    if (value<lower_bound)
      new_parameter_array[index] = lower_bound+epsilon*upper_bound
    elseif (value>upper_bound)
      new_parameter_array[index] = upper_bound - epsilon*lower_bound
    end
  end

  # fix parameters
  new_parameter_array[len_rca+1]=30.0# GAIN_tgfb3_Ab

  # addition terms
#  parameter_array[103]=pa103
#  parameter_array[104]=pa104
#  parameter_array[105]=pa105
#  parameter_array[106]=pa106
#  parameter_array[107]=pa107
#  parameter_array[108]=pa108
#  parameter_array[109]=pa109
#  parameter_array[110]=pa110
#  parameter_array[111]=pa111
#  parameter_array[112]=pa112
#  parameter_array[113]=pa113
#  parameter_array[114]=pa114
#  parameter_array[115]=pa115
#  parameter_array[116]=pa116
#  parameter_array[117]=pa117
#  parameter_array[118]=pa118

  return new_parameter_array
end

function n_alpha(alpha,Tf=0.0001;Ti=1.0)
Ti = 1.0
(log(Tf)-log(Ti))/log(alpha)
end
