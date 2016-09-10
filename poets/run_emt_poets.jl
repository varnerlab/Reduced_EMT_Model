# Execute POETS on EMT model
# DB 5/28/16

# Load POETS
using POETs

# process flags for cross validation
outdir = ARGS[1]
global HOLD=0
if length(matchall(r"fold_pop_obj",outdir)) == 1
global HOLD = parse(Int,split(outdir,"_")[6])
@show "Hold out", HOLD
end

# INITIALIZE MODEL
# FORMAT DATA AND INIT PARAMETER ARRAY
# INITIALIZE OBJECTIVE FUNCTION
# DECOMPOSE THIS INTO TWO FILES, ONE FOR INIT AND ANOTHER FOR FUNCS
fname = "/home/dbassen/Dropbox/server_swap_space/gen_2_model/poets/emt_grn_model_objective_function.jl"
include(fname)

# Set parameters and pointers

initial_state = Array{Float64,1}(parameter_array)

const RANK_CUTOFF = 5.0
const MAX_NUM_ITER= 20

# Execute the beast
println(now())
(EC,PC,RA) = estimate_ensemble(objective_function,neighbor_function,acceptance_probability_function,cooling_function,initial_state;rank_cutoff=RANK_CUTOFF,maximum_number_of_iterations=MAX_NUM_ITER)
println(now())
# Save output



writedlm("$outdir/EC.dat", EC)
writedlm("$outdir/PC.dat", PC)
writedlm("$outdir/RA.dat", RA)
