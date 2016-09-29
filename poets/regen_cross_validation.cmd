# Supply directory holding the correct parameter array & list of simulations to run by index (will be interpreted within jl file)

#1# panel A 
julia regen_prep_plot_cross_val.jl results_poets/cross_validation/fold_pop_obj_11 [1,2,3] > results_poets/cross_validation/fold_pop_obj_11/regen.out &

#2# panel B
julia regen_prep_plot_cross_val.jl results_poets/cross_validation/fold_pop_obj_10 [1,2,3] > results_poets/cross_validation/fold_pop_obj_10/regen.out &

#3# panel C & D
julia regen_prep_plot_cross_val.jl results_poets/cross_validation/fold_pop_obj_6 [1,4,5] > results_poets/cross_validation/fold_pop_obj_6/regen.out &

#4# panel E
julia regen_prep_plot_cross_val.jl results_poets/cross_validation/fold_pop_obj_4 [1,4,6] > results_poets/cross_validation/fold_pop_obj_4/regen.out &

#5# panel F
julia regen_prep_plot_cross_val.jl results_poets/cross_validation/fold_pop_obj_2 [1,4,7] > results_poets/cross_validation/fold_pop_obj_2/regen.out &

#6# panel G
julia regen_prep_plot_cross_val.jl results_poets/cross_validation/fold_pop_obj_8 [1,8,9] > results_poets/cross_validation/fold_pop_obj_8/regen.out &

#7# panels H & I
julia regen_prep_plot_cross_val.jl results_poets/cross_validation/fold_pop_obj_9 [1,8,9,10] > results_poets/cross_validation/fold_pop_obj_9/regen.out &

#gsk3#
julia regen_prep_plot_cross_val.jl results_poets/cross_validation/fold_pop_obj_7 [1,8,11] > results_poets/cross_validation/fold_pop_obj_7/regen.out &
