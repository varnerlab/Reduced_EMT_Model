### SELECTED DATA FILE INDEXES REQUIRED FOR TGFb MODEL ONLY

# INDEX VALUES CHANGE WITH UPDATES TO MODEL.NET

initial_cond_update_array = [];
rate_constant_update_array = [];
control_parameter_update_array = [];

# initial conditions
#push!(initial_cond_update_array,[tgfb12_initial_cond_index,0.0]) # TGFB12 initial conditions


# rates
# TGFB dosing
push!(rate_constant_update_array,[tgfb12_forward_rate_index,tgfb_add_forward_rate]) # addition_TGFb12: [] =([])=> TGFB12
push!(rate_constant_update_array,[tgfb12_reverse_rate_index,0.1]) # addition_TGFb12: TGFB12 =([])=> [] (reverse)

# VEGF dosing
push!(rate_constant_update_array,[vegf_forward_rate_index,vegf_add_forward_rate]) # addition_TGFb12: [] =([])=> TGFB12
push!(rate_constant_update_array,[vegf_reverse_rate_index,0.1]) # addition_TGFb12: TGFB12 =([])=> [] (reverse)


# Vivit dosing
push!(rate_constant_update_array,[vivit_forward_rate_index,vivit_add_forward_rate]) # addition_TGFb12: [] =([])=> TGFB12
push!(rate_constant_update_array,[vivit_reverse_rate_index,0.1]) # addition_TGFb12: TGFB12 =([])=> [] (reverse)



# Run snail slug instead
#push!(rate_constant_update_array,[152,10.0]) # induction_gene_SNAIL_SLUG: gene_SNAIL_SLUG = mRNA_SNAIL_SLUG
#push!(rate_constant_update_array,[ss_virus_forward_rate_index,4.0])
#push!(rate_constant_update_array,[ss_virus_reverse_rate_index,0.1])

#push!(rate_constant_update_array,[bcat_deg_gsk3_mediated_index,bcat_deg_gsk3_rate])

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
