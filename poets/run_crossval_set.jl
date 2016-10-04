# run_random_set
fname = "../poets/basic_set_generator.jl"
include(fname)

var = ARGS[1]

start_random = false # true
global HOLD=0
fname = "../poets/emt_grn_model_objective_function.jl"
include(fname)

# Set parameters and pointers

#initial_state = Array{Float64,1}(parameter_array)
full_pc_array = readdlm("../poets/results_poets/cross_validation/fold_pop_obj_$var/PC.dat")

# Execute the beast
println(now())
@show size(full_pc_array)[2]
#stop()
EC = generate_set(objective_function,full_pc_array)
println(now())
# Save output


outdir= "../poets/results_poets/cross_validation"
writedlm("$outdir/EC$var.dat", EC)
#writedlm("$outdir/PC.dat", PC)
#writedlm("$outdir/RA.dat", RA)
