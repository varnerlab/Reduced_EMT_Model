include("edit_file_global.jl")
simulations = []
include("edit_file_none.jl")
push!(simulations,rate_constant_update_array)
include("edit_file_tgfb.jl")
push!(simulations,rate_constant_update_array)
include("edit_file_mapkin.jl")
push!(simulations,rate_constant_update_array)
include("edit_file_ss.jl")
push!(simulations,rate_constant_update_array)
include("edit_file_ssecad.jl")
push!(simulations,rate_constant_update_array)
include("edit_file_ss_tgfb3ab.jl")
push!(simulations,rate_constant_update_array)
include("edit_file_ss_dnlef1.jl")
push!(simulations,rate_constant_update_array)
include("edit_file_tgfb3.jl")
push!(simulations,rate_constant_update_array)
include("edit_file_dnsmad.jl")
push!(simulations,rate_constant_update_array)
include("edit_file_tgfb3_dnlef1.jl")
push!(simulations,rate_constant_update_array)
include("edit_file_tgfb_tgfb3ab.jl")
push!(simulations,rate_constant_update_array)