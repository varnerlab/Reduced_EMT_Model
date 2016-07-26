include("new_SimulationFunctions.jl")

data_dictionary=Dict()

TSTART = 0.0;
Ts = 1.0;
TSTOP = 100.0;

(TSIM,X,ICA) =  SolveModelAddTGFB(TSTART,TSTOP,Ts,data_dictionary)

writedlm("/Users/dbassen/work/varner_gould_emt_model/emt_grn_bassen_model/Results/TGFbSimulation/TSIM.dat", TSIM)
writedlm("/Users/dbassen/work/varner_gould_emt_model/emt_grn_bassen_model/Results/TGFbSimulation/X.dat", X)
