#
#using Debug
function rand_pert(x,randmag=10.0)
a = 1.0/randmag
b = randmag

r = a + (b-a).*rand(size(x)[1],1)

return r.*x
end

function generate_random_set(objective_function,parameter_array_original,write_out,randmag=10.0,popsize=1000)

EC_array = []
for i in 1:popsize
parameter_array_active = rand_pert(original_parameter_array)
EC=objective_function(parameter_array_active)
@show i
open(write_out,"a") do f
    writecsv(f,EC)
end
push!(EC_array,EC)
end

return EC_array
end
