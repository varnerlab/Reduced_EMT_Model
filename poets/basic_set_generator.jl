#
#using Debug


function generate_set(objective_function,full_pc_array)

EC_array = []
for i in 1:size(full_pc_array)[2]
parameter_array=full_pc_array[:,i]
EC=objective_function(parameter_array)
@show i
push!(EC_array,EC)
end

return EC_array
end
