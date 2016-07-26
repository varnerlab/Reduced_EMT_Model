## INSTRUCTIONS:
## RUN IN LINE WITH SIMULATION MAIN FLOW CODE
## REQUIRES "data_file"

### UPDATE FUNCTION FOR DATA FILE ARRAYS

function UpdateArray(data_dictionary,string,alterations)
  # access array
  #println(data_dictionary)
  #println(alterations)
  data_array = data_dictionary[string];
  # set modifications for all conditions here
  for i in 1:Int(size(alterations)[1])
    updates = alterations[Int(i)];
    index = updates[1];
    value = updates[2];
    data_array[Int(index)]=value;
  data_dictionary[string] = data_array;
  end
  return data_array
end

#### set values for multiple variables

# # # TGFB SIGNALING RATES
tgfb12_to_ap1_sp1_gain = 1.5
tgfb3_to_smad_gain_rate = 1.0 # TGFB3_R_phosphorylation_Smad: Smad =(TGFB3_R)=> pSmad
tgfb12_to_smad_rate = 0.2
MAPK_activation_smad_rate = 0.2
# # # BETA-CATEININ RATES
bcat_deg_rate = 0.1 # default 0.1
# bcat_deg_gsk3_rate = 0.05 # default 0.1

bcat_trans_rate = 1.0
pmapk_inact_gsk3_rate = 1.0
# # # BETA-CATEININ COMPLEXING
ecad_complex_gain = 10.0 # 6 or 8
ecad_complex_reverse = 1.0
ecad_bcat_degradation_rate = 0.1
lef1_complex_gain = 2.0
tcf4_complex_gain = 1.0
tgfb3_pik3_rate=1.5
apc_complex_forward_rate=8.0

#ecad_bais_factor = 1.0 # multiply ecadherin-bcat only
ecad_trans_rate = 1.5
ecad_deg_rate=0.5 #0.1


lef1_trans_rate = 1.0

snail_slug_trans_rate = 1.0 # increases lef1 mrna too much

### SELECTED DATA FILE INDEXES

# INDEX VALUES CHANGE WITH UPDATES TO MODEL.NET

# initial conditions
tgfb12_initial_cond_index = 88 # TGFB12
R_initial_cond_index = 87
vegf_initial_cond_index = 93 # VEGF


# TGFB signaling
tgfb3_binding_rate_index = 3 # TGFB3_binding: TGFB3+R =([])=> TGFB3_R
R_deg_rate_index = 55 # degradation_R: R =([])=> []
TGFB12_R_activation_RAS_rate_index = 15 # TGFB12_R_activation_RAS: RAS =(TGFB12_R)=> RAS_GTP
RAS_activation_RAF_rate_index  = 16 # RAS_GTP_phosphorylation_RAF: RAF =(RAS_GTP)=> RAF_P
RAF_activation_MAPK_rate_index = 17 # RAF_P_phosphorylation_MAPK: MAPK =(RAF_P)=> pMAPK
MAPK_activation_AP1_SP1_rate_index = 19 # MAPK_phosphorylation_AP1_SP1: AP1_SP1 =(pMAPK)=> AP1_SP1_P
MAPK_activation_smad_rate_index = 18 # MAPK_phosphorylation_Smad: Smad =(pMAPK)=> pSmad
# Bcatenin complex formation
bcat_ecad_forward_index = 20 # Binding_Ecadherin_Bcatenin: Ecadherin+Bcatenin =([])=> Ecadherin_Bcatenin
bcat_ecad_reverse_index = 21 # Binding_Ecadherin_Bcatenin: Ecadherin_Bcatenin =([])=> Ecadherin+Bcatenin (reverse)
#bcat_apc_reverse_index = 23
bcat_tcf4_forward_index = 24 # TCF4_Bcatenin_complex_formation: TCF4+Bcatenin =([])=> Active_TCF4
bcat_tcf4_reverse_index = 25 # TCF4_Bcatenin_complex_formation: Active_TCF4 =([])=> TCF4+Bcatenin (reverse)
bcat_lef1_forward_index = 26 # LEF1_Bcatenin_complex_formation: LEF1+Bcatenin =([])=> Active_LEF1
bcat_lef1_reverse_index = 27 # LEF1_Bcatenin_complex_formation: Active_LEF1 =([])=> LEF1+Bcatenin (reverse)
bcat_deg_rate_index = 41 # Bcatenin_degradation: Bcatenin =([])=> []
#bcat_deg_gsk3_mediated_index = 67 # Bcatenin_GSK3_MEDIATED_degradation: Bcatenin =(GSK3)=> []
#pmapk_inact_gsk3_index = 68 # 68	GSK3_deactivation_by_pMAPK: GSK3 =(pMAPK)=> []
bcat_trans_rate_index = 163 # translation_mRNA_Bcatenin: mRNA_Bcatenin = Bcatenin

ecad_bcat_degradation_rate_index = 56 # Ecadherin_Bcatenin_degradation: Ecadherin_Bcatenin =([])=> []

# VEGF signaing
PKC_activation_RAF_rate_index = 11 # PKC_activation_RAF: RAF =(Active_PKC)=> RAF_P

snail_slug_trans_rate_index = 179 # induction_gene_SNAIL_SLUG: gene_SNAIL_SLUG = mRNA_SNAIL_SLUG
lef1_trans_rate_index = 167 # translation_mRNA_LEF1: mRNA_LEF1 = LEF1

apc_complex_forward_rate_index = 22 # Binding_GSK3_APC_AXIN: GSK3_APC_AXIN+Bcatenin =([])=> GSK3_APC_AXIN_Bcatenin
tgfb3_pik3_rate_index = 14 # TGFB3_R_phosphorylation_PI3K: PI3K =(TGFB3_R)=> PI3K_P


#ecad bcat balance
ecad_trans_rate_index = 162 # translation_mRNA_Ecadherin: mRNA_Ecadherin = Ecadherin
ecad_deg_rate_index = 42 # Ecadherin_degrdation: Ecadherin =([])=> []

# TGFB dosing
tgfb12_forward_rate_index = 111 # addition_TGFb12: [] =([])=> TGFB12
tgfb12_reverse_rate_index = 112 # addition_TGFb12: TGFB12 =([])=> [] (reverse)
tgfb12_binding_rate_index = 1 # TGFB12_binding: TGFB12+R =([])=> TGFB12_R

# VEGF dosing
vegf_forward_rate_index = 113 # addition_VEGF: [] =([])=> VEGF
vegf_reverse_rate_index = 114 # addition_VEGF: VEGF =([])=> [] (reverse)
vegf_binding_rate_index = 5 # VEGF_binding: VEGF+VEGFR =([])=> VEGF_VEGFR

# TGFB3_Ab dosing
TGFB3_Ab_foward_rate_index = 104 # addition_TGFB3_Ab: [] =([])=> TGFB3_Ab (reverse)
TGFB3_Ab_reverse_rate_index = 103 # addition_TGFB3_Ab: TGFB3_Ab =([])=> []

# U0126 dosing
U0126_foward_rate_index = 102 # addition_U0126: [] =([])=> U0126 (reverse)
U0126_reverse_rate_index = 101 # addition_U0126: U0126 =([])=> []

# TGFB3 dosing
TGFB3_foward_rate_index = 115 # addition_TGFB3: [] =([])=> TGFB3
TGFB3_reverse_rate_index = 116 # addition_TGFB3: TGFB3 =([])=> [] (reverse)
tgfb12_to_smad_rate_index = 12 # TGFB12_R_phosphorylation_Smad: Smad =(TGFB12_R)=> pSmad
tgfb3_to_smad_gain_rate_index = 13 # TGFB3_R_phosphorylation_Smad: Smad =(TGFB3_R)=> pSmad

# Snail slug transfeciton
ss_virus_forward_rate_index = 106 # addition_ss_virus: [] =([])=> ss_virus (reverse)
ss_virus_reverse_rate_index = 107 # addition_ss_virus: ss_virus =([])=> []

# DN smad
# DN SMAD temoprary
#SMAD_induciton_rate_index = 139 # induction_gene_Smad: gene_Smad = mRNA_Smad
# reverse convention based on product term
smad_virus_forward_rate_index = 108 # addition_smad_virus: [] =([])=> smad_virus (reverse)
smad_virus_reverse_rate_index = 107 # addition_smad_virus: smad_virus =([])=> []

# DN LEF1
#lef1_induciton_rate_index = 145
# reverse convention based on product term
LEF1_virus_forward_rate_index = 110 # addition_lef1_virus: [] =([])=> lef1_virus (reverse)
LEF1_virus_reverse_rate_index = 109 # addition_lef1_virus: lef1_virus =([])=> []

yreg_deg_rate_index = 46 # degradation_mRNA_YREG1: mRNA_YREG1 = []



#### THESE SETTINGS ARE FOR STEADY STATE AND ARE DEFAULT ####

# initialize arrays to hold updates for each array in data_file
initial_cond_update_array = [];
rate_constant_update_array = [];
control_parameter_update_array = [];

# initial conditions
push!(initial_cond_update_array,[tgfb12_initial_cond_index,0.0]) # TGFB12 initial conditions
push!(initial_cond_update_array,[R_initial_cond_index,6.0]) # R initial condition
push!(initial_cond_update_array,[vegf_initial_cond_index,0.0]) # VEGF

# rates
# TGFB dosing
push!(rate_constant_update_array,[tgfb12_forward_rate_index,0.0]) # addition_TGFb12: [] =([])=> TGFB12
push!(rate_constant_update_array,[tgfb12_reverse_rate_index,0.0]) # addition_TGFb12: TGFB12 =([])=> [] (reverse)
push!(rate_constant_update_array,[tgfb12_binding_rate_index,3.0]) # TGFB12_binding: TGFB12+R =([])=> TGFB12_R

# VEGF dosing
push!(rate_constant_update_array,[vegf_forward_rate_index,0.0]) # addition_VEGF: [] =([])=> VEGF
push!(rate_constant_update_array,[vegf_reverse_rate_index,0.0]) # addition_VEGF: VEGF =([])=> [] (reverse)
push!(rate_constant_update_array,[vegf_binding_rate_index,3.0]) # VEGF_binding: VEGF+VEGFR =([])=> VEGF_VEGFR

# ecad deg and trans
push!(rate_constant_update_array,[ecad_deg_rate_index,ecad_deg_rate]) #default 0.1
push!(rate_constant_update_array,[ecad_trans_rate_index ,ecad_trans_rate]) #default 1.0


## Inhibitor dosing

# SNAIL_SLUG dosing
# push!(rate_constant_update_array,[snail_slug_forward_rate_index,0.0]) # addition_VEGF: [] =([])=> VEGF
# push!(rate_constant_update_array,[snail_slug_reverse_rate_index,0.0]) # addition_VEGF: VEGF =([])=> [] (reverse)

# TGFB3_Ab dosing
push!(rate_constant_update_array,[TGFB3_Ab_foward_rate_index,0.0])
push!(rate_constant_update_array,[TGFB3_Ab_reverse_rate_index,0.0])

# U0126 dosing
push!(rate_constant_update_array,[U0126_foward_rate_index ,0.0])
push!(rate_constant_update_array,[U0126_reverse_rate_index,0.0])

## Virus dosing

push!(rate_constant_update_array,[ss_virus_forward_rate_index,0.0])
push!(rate_constant_update_array,[ss_virus_reverse_rate_index,0.0])

#push!(rate_constant_update_array,[smad_virus_forward_rate_index,0.0])
#push!(rate_constant_update_array,[smad_virus_reverse_rate_index,0.0])

#push!(rate_constant_update_array,[LEF1_virus_forward_rate_index,0.0])
#push!(rate_constant_update_array,[LEF1_virus_reverse_rate_index,0.0])

# TGFB3 dosing

push!(rate_constant_update_array,[TGFB3_foward_rate_index,0.0])
push!(rate_constant_update_array,[TGFB3_reverse_rate_index,0.0])

##
# TGFB signaling
push!(rate_constant_update_array,[tgfb3_binding_rate_index,3.5]) # TGFB3_binding: TGFB3+R =([])=> TGFB3_R
push!(rate_constant_update_array,[tgfb3_to_smad_gain_rate_index,tgfb3_to_smad_gain_rate]) # TGFB3_binding: TGFB3+R =([])=> TGFB3_R

push!(rate_constant_update_array,[tgfb12_to_smad_rate_index,tgfb12_to_smad_rate]) # TGFB3_binding: TGFB3+R =([])=> TGFB3_R

push!(rate_constant_update_array,[R_deg_rate_index,0.01]) # R_degradation: R =([])=> []
push!(rate_constant_update_array,[TGFB12_R_activation_RAS_rate_index,2.0]) #TGFB12_R_activation_RAS: RAS =(TGFB12_R)=> RAS_GTP
push!(rate_constant_update_array,[RAS_activation_RAF_rate_index,tgfb12_to_ap1_sp1_gain]) # RAS_GTP_phosphorylation_RAF: RAF =(RAS_GTP)=> RAF_P
push!(rate_constant_update_array,[RAF_activation_MAPK_rate_index,tgfb12_to_ap1_sp1_gain]) # RAF_P_phosphorylation_MAPK: MAPK =(RAF_P)=> pMAPK
push!(rate_constant_update_array,[MAPK_activation_AP1_SP1_rate_index,tgfb12_to_ap1_sp1_gain]) # MAPK_phosphorylation_AP1_SP1: AP1_SP1 =(pMAPK)=> AP1_SP1_P
push!(rate_constant_update_array,[MAPK_activation_smad_rate_index,MAPK_activation_smad_rate]) # MAPK_phosphorylation_AP1_SP1: AP1_SP1 =(pMAPK)=> AP1_SP1_P

# VEGF signaing
push!(rate_constant_update_array,[PKC_activation_RAF_rate_index,0.1]) # PKC_activation_RAF: RAF =(Active_PKC)=> RAF_P

# Bcatenin complex formation
push!(rate_constant_update_array,[bcat_ecad_forward_index,ecad_complex_gain]) # 19	Binding_Ecadherin_Bcatenin: Ecadherin+Bcatenin =([])=> Ecadherin_Bcatenin
push!(rate_constant_update_array,[bcat_ecad_reverse_index,ecad_complex_reverse]) # 20	Binding_Ecadherin_Bcatenin: Ecadherin_Bcatenin =([])=> Ecadherin+Bcatenin (reverse)
push!(rate_constant_update_array,[bcat_tcf4_forward_index,tcf4_complex_gain]) # 21	TCF4_Bcatenin_complex_formation: TCF4+Bcatenin =([])=> Active_TCF4
push!(rate_constant_update_array,[bcat_tcf4_reverse_index,1.0]) # 22	TCF4_Bcatenin_complex_formation: Active_TCF4 =([])=> TCF4+Bcatenin (reverse)
push!(rate_constant_update_array,[bcat_lef1_forward_index,lef1_complex_gain]) # 23	LEF1_Bcatenin_complex_formation: LEF1+Bcatenin =([])=> Active_LEF1
push!(rate_constant_update_array,[bcat_lef1_reverse_index,1.0]) # 24	LEF1_Bcatenin_complex_formation: Active_LEF1 =([])=> LEF1+Bcatenin (reverse)

push!(rate_constant_update_array,[bcat_deg_rate_index,bcat_deg_rate]) # Bcatenin_degradation: Bcatenin =([])=> []
#push!(rate_constant_update_array,[bcat_deg_gsk3_mediated_index,bcat_deg_gsk3_rate])
#push!(rate_constant_update_array,[pmapk_inact_gsk3_index,pmapk_inact_gsk3_rate])

push!(rate_constant_update_array,[yreg_deg_rate_index,1.2])
push!(rate_constant_update_array,[bcat_trans_rate_index,bcat_trans_rate])
push!(rate_constant_update_array,[ecad_bcat_degradation_rate_index,ecad_bcat_degradation_rate])

# LEF1
push!(rate_constant_update_array,[lef1_trans_rate_index,lef1_trans_rate])

#
push!(rate_constant_update_array,[apc_complex_forward_rate_index,apc_complex_forward_rate])
push!(rate_constant_update_array,[tgfb3_pik3_rate_index,tgfb3_pik3_rate])

# control parameter array
#num_regs = 15; # number of inducing or repressing intereactions (could have multiple for species)
# do forced update for now
#for i in 1:num_regs
  #push!(control_parameter_update_array[i,1],GAIN_MASTER) # Gain for transcriptional activity
#end
#push!(control_parameter_update_array,[7,GAIN_TCF4_TGFB3])
#push!(control_parameter_update_array,[6,GAIN_BCAT_TGFB3])
#push!(control_parameter_update_array,[5,GAIN_ACTIVE_LEF1_ECAD])



# push modifications to RAM
#println(data_dictionary["INITIAL_CONDITION_ARRAY"])
#println(data_dictionary)
#UpdateArray(data_dictionary,"INITIAL_CONDITION_ARRAY",initial_cond_update_array)
#UpdateArray(data_dictionary,"RATE_CONSTANT_ARRAY",rate_constant_update_array)
#UpdateArray(data_dictionary,"CONTROL_PARAMETER_ARRAY",control_parameter_update_array)
###  I can't figure out how to get data_dictionary to be passed into this streamed file,
### It would seem that the stream opens a new variable space and then merges it with the main variable space
### Hence, these will need to be called post-stream





#
