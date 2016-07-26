include("new_SimulationFunctions.jl")


data_dictionary=Dict()

TSTART = 0.0;
Ts = 1.0;
TSTOP = 100;

# Rate constants for TGFb12 addition

XSS =  EstimateSteadyState(data_dictionary)

writedlm("/Users/dbassen/work/varner_gould_emt_model/emt_grn_bassen_model/Results/SteadyStateEpithelialTest/xss.dat", XSS)
