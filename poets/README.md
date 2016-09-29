# main files  
  
emt_grn_model_objective_function.jl  
	Objective functions   
medici_blot_combined.jl  
	Training data  
regen_prep_plot.jl  
	Regenerate timeseries for all parameter sets and compute requested values   
results_poets  
	Data summaries for figure 2  
run_emt_poets.jl  
	Run poets  
	  
# poets output arrays  
EC.dat  
PC.dat  
RA.dat  
  
  
# inactive files  
decomp_emt_grn_model_objective_function.jl  
out_tmp  
parallel_regen_prep_plot.jl  
  
  

# run robustness
julia run_robustness.jl > robustness.out &

# get nfat and sp1 plot

julia run_regen_abundance_plot.jl > nfataspp.out &

