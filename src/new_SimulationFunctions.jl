include("/home/dbassen/Dropbox/server_swap_space/gen_2_model/src/DataFile.jl")
include("/home/dbassen/Dropbox/server_swap_space/gen_2_model/src/SolveBalances.jl")
using Debug

# =============================================================================== #
# Solve.jl
# Function library to solve the EMT model for different experimental/test cases
# Author: J.Varner
#
# Version: 1.0
# Date: 12/17/15
# =============================================================================== #

# addition indices
addition_start,addition_end = 85,100

# mRNA / transcriptional indices
mdeg_start,mdeg_end = 101,123
script_start,script_end = 124,146

# protein / translational indices
pdeg_start,pdeg_end = 39,78
lation_start,lation_end = 147,169

#@debug
# Run the model to steady state -
 function EstimateSteadyState(current_data_dictionary)
# WARNING UNLESS DEEPCOPY IS USED, CURRENT_DATA_DICTIONARY IS THE SAME OBJECT AS DATA_DICIONARY!
  # Do we have a data_dictionary (if not load a new one)
  if (isempty(current_data_dictionary))
    # DB 02/27/2016
    TSTART = 0.0
    Ts=1.0
    TSTOP=100
    # DB
    current_data_dictionary = DataFile(TSTART,TSTOP,Ts)
  end

  #test = data_dictionary["INITIAL_CONDITION_ARRAY"]
  #println(data_dictionary)
  include("/home/dbassen/Dropbox/server_swap_space/gen_2_model/src/edit_file_global.jl")
  UpdateArray(current_data_dictionary,"INITIAL_CONDITION_ARRAY",initial_cond_update_array)
  UpdateArray(current_data_dictionary,"RATE_CONSTANT_ARRAY",rate_constant_update_array)

  rate_constant_array = copy(current_data_dictionary["RATE_CONSTANT_ARRAY"]);
  rate_constant_array[script_start:script_end]=0.033*rate_constant_array[script_start:script_end]*const_transcription
  rate_constant_array[lation_start:lation_end]=rate_constant_array[lation_start:lation_end]*const_translation
  #@show rate_constant_array[140:162]
 # Just try to adjust dosage level by similiar amount as protein (?)
  rate_constant_array[addition_start:addition_end]=10*rate_constant_array[addition_start:addition_end]#*const_translation

# factor of 10 just corrects for a 0.1 "gamma/delta" value in the data file
  rate_constant_array[mdeg_start:mdeg_end]=30*rate_constant_array[mdeg_start:mdeg_end]*degradation_constant_mRNA
  rate_constant_array[pdeg_start:pdeg_end]=10*rate_constant_array[pdeg_start:pdeg_end]*degradation_constant_protein
  current_data_dictionary["RATE_CONSTANT_ARRAY"] = rate_constant_array

# 137 - 139
# rate_constant_array[137:139]=30*rate_constant_array[137:139]*degradation_constant_mRNA


  #UpdateArray(data_dictionary,"CONTROL_PARAMETER_ARRAY",control_parameter_update_array)
  # Setup loop -
  #TSIM_all = []
  #X_all    = Array(Float64,length(data_dictionary["INITIAL_CONDITION_ARRAY"]))
  # tmpI = 0 # save
  EPSILON = 1e-3;
  TSTART = 0.0;
  Ts = 1.0;
  TSTOP = 100;
  did_reach_steady_state = false
  #@show current_data_dictionary["RATE_CONSTANT_ARRAY"][141] #here

  while (!did_reach_steady_state)
    # println("ITERATION",)
    # solve the balances -
  #  @show current_data_dictionary["RATE_CONSTANT_ARRAY"][141]

    (TSIM,X1) = SolveBalances(TSTART,TSTOP,Ts,current_data_dictionary);
  #  @show current_data_dictionary["RATE_CONSTANT_ARRAY"][141]
    ###save
    # if tmpI == 0
    #   X_all = X1
    # else
    # X_all=vcat(X_all,X1) # Save
    # end
    # tmpI = tmpI+1
    # Take a few additional steps -
    TNEXT_START = TSTOP+Ts;
    TNEXT_STOP = TNEXT_START+1.0;
    Ts = 0.1;

    # solve the balances again 0

    initial_condition_array = vec(X1[end,:])
    current_data_dictionary["INITIAL_CONDITION_ARRAY"] = initial_condition_array;

    (TSIM,X2) = SolveBalances(TNEXT_START,TNEXT_STOP,Ts,current_data_dictionary);
    # X_all=vcat(X_all,X2) # Save
    # view simulation trajectory


    # Find the difference -
    DIFF = norm((X2[end,:] - X1[end,:]));
    # Take the end, the last step is the one we compare
    # Should we stop -or- go around again?

# println(size(X1))
# println(size(X2))
#@bp

    if (DIFF<EPSILON)
      did_reach_steady_state = true;
      # savepath = "/home/dbassen/Dropbox/server_swap_space/gen_2_model/output/all_XSS.dat"
      # println("Save",size(X_all))
      # writedlm(savepath,X_all)# save
      return (X2[end,:]);

    else

      # No, we did *not* reach steady state ....
      TSTART = TSTOP+Ts
      TSTOP = 1000 + TSTART;
      Ts = 100.0;

      initial_condition_array = vec(X2[end,:])
      current_data_dictionary["INITIAL_CONDITION_ARRAY"] = initial_condition_array;
      # println("else")
    end
  end
  # return
  # println("final return")
  return XSS;

end



function SolveModelGeneric_ram(TSTART,TSTOP,Ts,data_dictionary_active,sim_RCA)

  include("/home/dbassen/Dropbox/server_swap_space/gen_2_model/src/edit_file_global.jl")
  UpdateArray(data_dictionary_active,"INITIAL_CONDITION_ARRAY",initial_cond_update_array)

  ### THIS WAS MISSING BECAUSE IT WAS REPLACED BY SIM_RCA... BUT NEEDS TO COME BEFORE IT
  UpdateArray(data_dictionary_active,"RATE_CONSTANT_ARRAY",rate_constant_update_array)
  ### IT HAD BEEN COMPESATED FOR BY THE MEMORY LEAK FROM THE STEADYSTATE FUNCTION ..

  UpdateArray(data_dictionary_active,"RATE_CONSTANT_ARRAY",sim_RCA)
  # Run the simulation -
  rate_constant_array = data_dictionary_active["RATE_CONSTANT_ARRAY"];
  rate_constant_array[script_start:script_end]=0.033*rate_constant_array[script_start:script_end]*const_transcription
  rate_constant_array[lation_start:lation_end]=rate_constant_array[lation_start:lation_end]*const_translation
  #@show rate_constant_array[140:162]
 # Just try to adjust dosage level by similiar amount as protein (?)
  rate_constant_array[addition_start:addition_end]=10*rate_constant_array[addition_start:addition_end]#*const_translation

# factor of 10 just corrects for a 0.1 "gamma/delta" value in the data file
  rate_constant_array[mdeg_start:mdeg_end]=30*rate_constant_array[mdeg_start:mdeg_end]*degradation_constant_mRNA
  rate_constant_array[pdeg_start:pdeg_end]=10*rate_constant_array[pdeg_start:pdeg_end]*degradation_constant_protein
  data_dictionary_active["RATE_CONSTANT_ARRAY"] = rate_constant_array

# 137 - 139
# rate_constant_array[137:139]=30*rate_constant_array[137:139]*degradation_constant_mRNA

#

  #@bp
  (TSIM,X) = SolveBalances(TSTART,TSTOP,Ts,data_dictionary_active);
  #@show data_dictionary_active["RATE_CONSTANT_ARRAY"][141]
  #  @show data_dictionary_active["RATE_CONSTANT_ARRAY"][182]

  # return tuple -
  return (TSIM,X,initial_condition_array)

end

function SolveModelGenericPOETS(TSTART,TSTOP,Ts,local_data_dictionary,simulation)

  include(simulation)
  # !!!! I think th initial condition array update is not required
  #UpdateArray(data_dictionary,"INITIAL_CONDITION_ARRAY",initial_cond_update_array)
  UpdateArray(local_data_dictionary,"RATE_CONSTANT_ARRAY",rate_constant_update_array)

  # Run the simulation -
  # println(TSTOP)
  (TSIM,X) = SolveBalances(TSTART,TSTOP,Ts,local_data_dictionary);

  # return tuple -
  return (TSIM,X)

end

#  #
#  #
#  #
#  #

function SolveModelGenericPOETS_ram(TSTART,TSTOP,Ts,local_data_dictionary,sim_RCA)
  # Set simulation rate constants
  UpdateArray(local_data_dictionary,"RATE_CONSTANT_ARRAY",sim_RCA)
  # Run the simulation -
  (TSIM,X) = SolveBalances(TSTART,TSTOP,Ts,local_data_dictionary);

  # return tuple -
  return (TSIM,X)

end

# Simulate the addition of TGFB -
function SolveModelAddTGFB(TSTART,TSTOP,Ts,data_dictionary)

  # Do we have a data_dictionary (if not load a new one)
  if (isempty(data_dictionary))
    data_dictionary = DataFile(TSTART,TSTOP,Ts)
  end

  # Setup simulation time -
  # TSIM = collect(TSTART:Ts:TSTOP); # redundant
  include("/home/dbassen/Dropbox/server_swap_space/gen_2_model/src/edit_file_global.jl")

  UpdateArray(data_dictionary,"INITIAL_CONDITION_ARRAY",initial_cond_update_array)
  UpdateArray(data_dictionary,"RATE_CONSTANT_ARRAY",rate_constant_update_array)
  #UpdateArray(data_dictionary,"CONTROL_PARAMETER_ARRAY",control_parameter_update_array)

  #println(data_dictionary)
  # Run the model to steady-state *before* we add the TGFB -
  XSS = EstimateSteadyState(data_dictionary);

  # ok, we established a steady state -
  # reset the initial conditions -
  initial_condition_array = vec(XSS);
  data_dictionary["INITIAL_CONDITION_ARRAY"] = initial_condition_array;

  # Add TGFB1/2 -
  # RESUME TGFB signaling for simulation
  include("/Users/dbassen/work/KwateeServer-v1.0/src/edit_file_ss.jl")
  UpdateArray(data_dictionary,"INITIAL_CONDITION_ARRAY",initial_cond_update_array)
  UpdateArray(data_dictionary,"RATE_CONSTANT_ARRAY",rate_constant_update_array)
  # Run the simulation -
  #println(TSTOP)
  (TSIM,X) = SolveBalances(TSTART,TSTOP,Ts,data_dictionary);

  # return tuple -
  return (TSIM,X,initial_condition_array)

end




# Simulate the addition of VEGF -
function SolveModelAddVEGF(TSTART,TSTOP,Ts,data_dictionary)

  # Do we have a data_dictionary (if not load a new one)
  if (isempty(data_dictionary))
    data_dictionary = DataFile(TSTART,TSTOP,Ts)
  end

  # Setup simulation time -
  # TSIM = collect(TSTART:Ts:TSTOP); # redundant

  # Modify rate constant array

  include("/Users/dbassen/work/KwateeServer-v1.0/src/edit_file_global.jl")
  UpdateArray(data_dictionary,"INITIAL_CONDITION_ARRAY",initial_cond_update_array)
  UpdateArray(data_dictionary,"RATE_CONSTANT_ARRAY",rate_constant_update_array)
  #UpdateArray(data_dictionary,"CONTROL_PARAMETER_ARRAY",control_parameter_update_array)

  # Run the model to steady-state *before* we add the TGFB -
  XSS = EstimateSteadyState(data_dictionary);

  # ok, we established a steady state -
  # reset the initial conditions -
  initial_condition_array = vec(XSS);
  data_dictionary["INITIAL_CONDITION_ARRAY"] = initial_condition_array;

  # Add VEGF -
  include("/Users/dbassen/work/KwateeServer-v1.0/src/edit_file_vegf.jl")
  UpdateArray(data_dictionary,"INITIAL_CONDITION_ARRAY",initial_cond_update_array)
  UpdateArray(data_dictionary,"RATE_CONSTANT_ARRAY",rate_constant_update_array)

    # Run the simulation -
  (TSIM,X) = SolveBalances(TSTART,TSTOP,Ts,data_dictionary);

  # return tuple -
  return (TSIM,X,initial_condition_array)

end

function SolveModelGeneric(TSTART,TSTOP,Ts,data_dictionary_active,simulation)

  # Do we have a data_dictionary (if not load a new one)
  # if (isempty(data_dictionary_active))
  #   data_dictionary_active = DataFile(TSTART,TSTOP,Ts)
  # end

  # Setup simulation time -
  # TSIM = collect(TSTART:Ts:TSTOP); # redundant

  include("/home/dbassen/Dropbox/server_swap_space/gen_2_model/src/edit_file_global.jl")
  UpdateArray(data_dictionary_active,"INITIAL_CONDITION_ARRAY",initial_cond_update_array)
  #UpdateArray(data_dictionary,"RATE_CONSTANT_ARRAY",rate_constant_update_array)
  #UpdateArray(data_dictionary,"CONTROL_PARAMETER_ARRAY",control_parameter_update_array)

  #println(data_dictionary)
  # Run the model to steady-state *before* we add the TGFB -
  #XSS = EstimateSteadyState(data_dictionary);
#  println(data_dictionary["INITIAL_CONDITION_ARRAY"])
  # ok, we established a steady state -
  # reset the initial conditions -
  #initial_condition_array = vec(XSS);
  #data_dictionary["INITIAL_CONDITION_ARRAY"] = initial_condition_array;

  # Add TGFB1/2 -
  # RESUME TGFB signaling for simulation
  include(simulation)
  #UpdateArray(data_dictionary,"INITIAL_CONDITION_ARRAY",initial_cond_update_array)
  UpdateArray(data_dictionary_active,"RATE_CONSTANT_ARRAY",rate_constant_update_array)
  #println(data_dictionary["INITIAL_CONDITION_ARRAY"]) ###
  # Run the simulation -
  # println(TSTOP)
  (TSIM,X) = SolveBalances(TSTART,TSTOP,Ts,data_dictionary_active);

  # return tuple -
  return (TSIM,X,initial_condition_array)

end

#
