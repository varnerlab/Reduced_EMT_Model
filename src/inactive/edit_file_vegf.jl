### SELECTED DATA FILE INDEXES REQUIRED FOR TGFb MODEL ONLY

# INDEX VALUES CHANGE WITH UPDATES TO MODEL.NET

initial_cond_update_array = [];
rate_constant_update_array = [];
control_parameter_update_array = [];

# initial conditions
push!(initial_cond_update_array,[vegf_initial_cond_index,0.0]) # VEGF

# rates
# VEGF dosing
push!(rate_constant_update_array,[vegf_forward_rate_index,4.0]) # addition_VEGF: [] =([])=> VEGF
push!(rate_constant_update_array,[vegf_reverse_rate_index,0.1]) # addition_VEGF: VEGF =([])=> [] (reverse)

# push modifications to RAM
#UpdateArray(data_dictionary,"INITIAL_CONDITION_ARRAY",initial_cond_update_array)
#UpdateArray(data_dictionary,"RATE_CONSTANT_ARRAY",rate_constant_update_array)
