# run_random_set
fname = "/home/dbassen/Dropbox/server_swap_space/gen_2_model/poets/random_set_generator.jl"
include(fname)

start_random = true # false
global HOLD=0
fname = "/home/dbassen/Dropbox/server_swap_space/gen_2_model/poets/emt_grn_model_objective_function.jl"
include(fname)

# Set parameters and pointers

initial_state = Array{Float64,1}(parameter_array)


# Execute the beast
println(now())
EC = generate_random_set(objective_function,deepcopy(parameter_array),"/home/dbassen/Dropbox/server_swap_space/gen_2_model/poets/results_poets/random_set/EC_full.dat",
10.0,100)
println(now())
# Save output


outdir= "/home/dbassen/Dropbox/server_swap_space/gen_2_model/poets/results_poets/random_set"
writedlm("$outdir/EC_full.dat", EC)
#writedlm("$outdir/PC.dat", PC)
#writedlm("$outdir/RA.dat", RA)
