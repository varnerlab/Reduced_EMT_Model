# RunAllSimulations
println("Spinning up model code ... ")
include("../src/new_SimulationFunctions.jl")

# Establish simulation parameters
TSTART = 0.0;
Ts = 1.0; # 0.1
TSTOP = 250.0; # 100 ; 500

# Load data dictionary
data_dictionary = DataFile(TSTART,TSTOP,Ts)

 # # # #
#println(data_dictionary["CONTROL_PARAMETER_ARRAY"])

# update control parameter array here for now
GAIN_MASTER = 0.3
num_regs = 19;
control_parameter_array=data_dictionary["CONTROL_PARAMETER_ARRAY"]
for i in 1:num_regs
  control_parameter_array[i,1]=GAIN_MASTER # Gain for transcriptional activity
end
# TGFB3_inhibition: TGFB3_Ab inhibition; TGFB3_binding
control_parameter_array[1,1]=30.0 # GAIN # _tgfb3_Ab
# NFATc_inhibition: vivit inhibition; Calcineurin_activation_NFATc
control_parameter_array[2,1]=3.0 # GAIN # NFATc_inhibition: vivit inhibition; Calcineurin_activation_NFATc
# GSK3_P_inhibition_Binding_APC_AXIN_forw: GSK3_P inhibition; Binding_APC_AXIN_forw
control_parameter_array[3,1]=0.5 # GAIN # GSK3_P_inhibition_Binding_APC_AXIN_forw
control_parameter_array[3,2]=1.0 # ORDER# GSK3_P_inhibition_Binding_APC_AXIN_forw

# Active_TCF4_inhibition_Ecad: Ecadherin_Bcatenin inhibition; TCF4_Bcatenin_complex_formation
control_parameter_array[4,1]=0.1 # GAIN # Active_TCF4_inhibition_Ecad
control_parameter_array[4,1]=0.9 # GAIN # Active_TCF4_inhibition_Ecad
# Active_TCF4_inhibition_APC: APC_AXIN_Bcatenin inhibition; TCF4_Bcatenin_complex_formation
control_parameter_array[5,1]=0.2 # GAIN # Active_TCF4_inhibition_APC
control_parameter_array[5,2]=1.0 # ORDER # Active_TCF4_inhibition_APC

# activation_Ecadherin_by_Active_NFATc: Active_NFATc induction induction_gene_Ecadherin
control_parameter_array[6,1]=0.3 # GAIN # activation_Ecadherin_by_Active_NFATc
# repression_Ecadherin_by_pSmad: pSmad repression induction_gene_Ecadherin
control_parameter_array[7,1]=5.0 # GAIN # REP_ECAD_PSMAD
control_parameter_array[7,2]=2.0 # ORDER # REP_ECAD_PSMAD
# repression_Ecadherin_by_SNAIL_SLUG: SNAIL_SLUG repression induction_gene_Ecadherin
control_parameter_array[8,1]=0.5 # GAIN_SNAIL_SLUG_ECAD #2.0
# repression_Ecadherin_by_Active_LEF1: Active_LEF1 repression induction_gene_Ecadherin
control_parameter_array[9,1]=0.6# GAIN_ACTIVE_LEF1_ECAD #2.0 0.5
control_parameter_array[9,2]=1.0# ORDER_ACTIVE_LEF1_ECAD
#  control_parameter_array[6,1]=0.3 # GAIN_BCAT_TGFB3
# activation_Ecadherin_by_ecad_virus: ecad_virus induction induction_gene_Ecadherin
control_parameter_array[10,1]=5.0 # ecad_virus ***
# activation_TGFB3_by_TCF4: Active_TCF4 induction induction_gene_TGFB3
control_parameter_array[11,1]=0.15 # GAIN_TCF4_TGFB3
control_parameter_array[11,2]=1.5 # GAIN_TCF4_TGFB3

# repression_TGFB3_by_YREG1: YREG1 repression induction_gene_TGFB3
control_parameter_array[12,1]=1.0 # YREG_TGFB3 #1.0
control_parameter_array[12,2]=1.0 # YREG_TGFB3
# repression_YREG1_by_SNAIL_SLUG: SNAIL_SLUG repression induction_gene_YREG1
control_parameter_array[13,1]=0.1 # GAIN_SNAIL_YREG1 # 0.1
control_parameter_array[13,2]=2.0 # ORDER_SNAIL_YREG1 # 2.0
# activation_LEF1_by_pSmad: pSmad induction induction_gene_LEF1
control_parameter_array[14,1]=0.8# GAIN # _PSMAD_LEF1 # 0.5 # 0.8
control_parameter_array[14,2]=2.0# ORDER# _PSMAD_LEF1       # 1.0, 2.0
# repression_LEF1_by_YREG1: YREG1 repression induction_gene_LEF1
control_parameter_array[15,1]=5.0 # GAIN YREG1_LEF1 # 0.1
control_parameter_array[15,2]=0.5 # ORDER YREG1_LEF1 # 2.0
# activation_vimentin_by_Active_LEF1: Active_LEF1 induction induction_gene_vimentin
control_parameter_array[16,1]=0.3# GAIN_LEF1_VIM
control_parameter_array[16,2]=2.0# ORDER_LEF1_VIM
# activation_SNAIL_SLUG_by_AP1_SP1_P: AP1_SP1_P induction induction_gene_SNAIL_SLUG
control_parameter_array[18,1]=1.0# SS by AP1 SP1
# activation_SNAIL_SLUG_by_ss_virus: ss_virus induction induction_gene_SNAIL_SLUG
control_parameter_array[19,1]=5.0# SS_VIRUS ***


# # # #

data_dictionary["CONTROL_PARAMETER_ARRAY"]=control_parameter_array
#println(data_dictionary["CONTROL_PARAMETER_ARRAY"])

println("Running to steady state ... ")

# # # STEADY STATE
#@show data_dictionary["RATE_CONSTANT_ARRAY"][141] # here

println(now())
# WARNING data_dicionary will be edited within EstimateSteadyState unless copy/deepcopy used!
XSS = EstimateSteadyState(deepcopy(data_dictionary))
println(now())
initial_condition_array = vec(XSS);
#println(initial_condition_array) ###
#@show data_dictionary["RATE_CONSTANT_ARRAY"][141]

writedlm("../output/xss.dat", XSS)

data_dictionary["INITIAL_CONDITION_ARRAY"] = initial_condition_array;
xss_data_dict = deepcopy(data_dictionary)

# # # # TGFB SIMULATION
#
# println("Running TGFB simulation ... ")
#
# # not required for first simulation
# #data_dictionary= deepcopy(xss_data_dict) # reinitialize dictionary with steady state dictionary
#
# (TSIM,X,ICA) =  SolveModelAddTGFB(TSTART,TSTOP,Ts,data_dictionary)
#
# writedlm("/Users/dbassen/work/varner_gould_emt_model/emt_grn_bassen_model/Results/TGFbSimulation/TSIM.dat", TSIM)
# writedlm("/Users/dbassen/work/varner_gould_emt_model/emt_grn_bassen_model/Results/TGFbSimulation/X.dat", X)

# # # VEGF SIMULATION
## WARNING, SIMULATION DATAFILE MAY BE LEAKING
# println("Running VEGF simulation ... ")
#
# data_dictionary = deepcopy(xss_data_dict) # reinitialize dictionary with steady state dictionary
#
# (TSIM,X,ICA) =  SolveModelAddVEGF(TSTART,TSTOP,Ts,data_dictionary)
#
# writedlm("/Users/dbassen/work/varner_gould_emt_model/emt_grn_bassen_model/Results/VEGFSimulation/TSIM.dat", TSIM)
# writedlm("/Users/dbassen/work/varner_gould_emt_model/emt_grn_bassen_model/Results/VEGFSimulation/X.dat", X)
#
#@show xss_data_dict["RATE_CONSTANT_ARRAY"][141]

simulations_name = ["edit_file_none.jl","edit_file_tgfb.jl","edit_file_mapkin.jl","edit_file_ss.jl","edit_file_ssecad.jl","edit_file_ss_tgfb3ab.jl","edit_file_ss_dnlef1.jl","edit_file_tgfb3.jl","edit_file_dnsmad.jl","edit_file_tgfb3_dnlef1.jl","edit_file_tgfb_tgfb3ab.jl"]
#simulations_name = ["edit_file_tgfb.jl","edit_file_vegf.jl","edit_file_vegf_vi.jl","edit_file_tgfb_vi.jl","edit_file_tgfb_vegf.jl","edit_file_vegf_vi.jl","edit_file_tgfb_vegf_vi.jl","edit_file_yreg_ox.jl","edit_file_yreg_ko.jl","edit_file_yreg_ox_tgfb.jl","edit_file_yreg_ko_tgfb.jl"] # Robustness sims
include("spin_up_edits.jl")
#include("robustness_spin_up_edits.jl")
sim_data = [] # Keep data in RAM
i_simdat = 1
for sim in simulations
  name = simulations_name[i_simdat]
  msg = string("Running ",name," simulation ... ")
  println(msg)
  data_dictionary_active = deepcopy(xss_data_dict)
  (TSIM,X) = SolveModelGeneric_ram(TSTART,TSTOP,Ts,data_dictionary_active,sim)

  outdir="../output/Fig2Simulations/"
  tpath= string(outdir,"TSIM",name[10:end-3],".dat")
  xpath= string(outdir,"X",name[10:end-3],".dat")
  push!(sim_data,X)
  writedlm(tpath, TSIM)
  writedlm(xpath, X)
  i_simdat = i_simdat + 1
end
