### SELECTED DATA FILE INDEXES REQUIRED FOR TGFb MODEL ONLY

# INDEX VALUES CHANGE WITH UPDATES TO MODEL.NET

initial_cond_update_array = [];
rate_constant_update_array = [];
control_parameter_update_array = [];

# initial conditions
#push!(initial_cond_update_array,[tgfb12_initial_cond_index,0.0]) # TGFB12 initial conditions

# This gets hacky, we are using the TGFB infastructure to run the inhibitors etc.

# rates
# TGFB dosing
push!(rate_constant_update_array,[yreg_translation_rate_index,0.00]) # addition_TGFb12: [] =([])=> TGFB12
push!(rate_constant_update_array,[yreg_protein_deg_rate_index,yreg_ko_deg_rate_protein]) # addition_TGFb12: [] =([])=> TGFB12

# Run snail slug instead
#push!(rate_constant_update_array,[152,10.0]) # induction_gene_SNAIL_SLUG: gene_SNAIL_SLUG = mRNA_SNAIL_SLUG
#push!(rate_constant_update_array,[ss_virus_forward_rate_index,4.0])
#push!(rate_constant_update_array,[ss_virus_reverse_rate_index,0.1])

# give MAPK inhibitor

#push!(rate_constant_update_array,[U0126_foward_rate_index,4.0])
#push!(rate_constant_update_array,[U0126_reverse_rate_index,0.1])

# ECADHERINchange this to transcription rate
# push!(rate_constant_update_array,[ecad_trans_rate_index,ecad_trans_rate*5.0])

# Block TGFB3
#push!(rate_constant_update_array,[TGFB3_Ab_foward_rate_index,4.0])
#push!(rate_constant_update_array,[TGFB3_Ab_reverse_rate_index,0.1])

# TGFB3 dosing

#push!(rate_constant_update_array,[TGFB3_foward_rate_index,4.0])
#push!(rate_constant_update_array,[TGFB3_reverse_rate_index,0.1])

# DN LEF1 temoprary
#lef1_induciton_rate_index = 141
#lef1_induciton_rate = 0.01

# DN SMAD temoprary
#SMAD_induciton_rate_index = 134
#SMAD_induciton_rate = 0.01

# push modifications to RAM
#UpdateArray(data_dictionary,"INITIAL_CONDITION_ARRAY",initial_cond_update_array)
#UpdateArray(data_dictionary,"RATE_CONSTANT_ARRAY",rate_constant_update_array)


# mRNA degradation test
#tubulin_induction_index = 145
#push!(rate_constant_update_array,[tubulin_induction_index,0.0])
