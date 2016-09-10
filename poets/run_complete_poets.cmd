julia run_emt_poets.jl /home/dbassen/Dropbox/server_swap_space/gen_2_model/poets  > run_emt_poets.out
julia regen_prep_plot.jl > regen_prep_plot.out
python ../Results/get_POETS_multi_make_fig2.py

