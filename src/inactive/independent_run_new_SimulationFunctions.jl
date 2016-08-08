include("DataFile.jl")
include("SolveBalances.jl")
using Debug

# =============================================================================== #
# Solve.jl
# Function library to solve the EMT model for different experimental/test cases
# Author: J.Varner
#
# Version: 1.0
# Date: 12/17/15
# =============================================================================== #

# Simulate the addition of TGFB -
function SolveModelAddTGFB(TSTART,TSTOP,Ts,data_dictionary)

  # Do we have a data_dictionary (if not load a new one)
  if (isempty(data_dictionary))
    data_dictionary = DataFile(TSTART,TSTOP,Ts)
  end

  # Setup simulation time -
  # TSIM = collect(TSTART:Ts:TSTOP); # redundant

  include("edit_file_global.jl")
  UpdateArray(data_dictionary,"INITIAL_CONDITION_ARRAY",initial_cond_update_array)
  UpdateArray(data_dictionary,"RATE_CONSTANT_ARRAY",rate_constant_update_array)
  UpdateArray(data_dictionary,"CONTROL_PARAMETER_ARRAY",control_parameter_update_array)

  # Run the model to steady-state *before* we add the TGFB -
  XSS = EstimateSteadyState(data_dictionary);

  # ok, we established a steady state -
  # reset the initial conditions -
  initial_condition_array = vec(XSS);

  # Add TGFB1/2 -
  # RESUME TGFB signaling for simulation
  include("edit_file_tgfb.jl")
  UpdateArray(data_dictionary,"INITIAL_CONDITION_ARRAY",initial_cond_update_array)
  UpdateArray(data_dictionary,"RATE_CONSTANT_ARRAY",rate_constant_update_array)

  # Run the simulation -
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

  include("edit_file_global.jl")
  UpdateArray(data_dictionary,"INITIAL_CONDITION_ARRAY",initial_cond_update_array)
  UpdateArray(data_dictionary,"RATE_CONSTANT_ARRAY",rate_constant_update_array)
  UpdateArray(data_dictionary,"CONTROL_PARAMETER_ARRAY",control_parameter_update_array)

  # Run the model to steady-state *before* we add the TGFB -
  XSS = EstimateSteadyState(data_dictionary);

  # ok, we established a steady state -
  # reset the initial conditions -
  initial_condition_array = vec(XSS);

  # Add VEGF -
  include("edit_file_vegf.jl")
  UpdateArray(data_dictionary,"INITIAL_CONDITION_ARRAY",initial_cond_update_array)
  UpdateArray(data_dictionary,"RATE_CONSTANT_ARRAY",rate_constant_update_array)

    # Run the simulation -
  (TSIM,X) = SolveBalances(TSTART,TSTOP,Ts,data_dictionary);

  # return tuple -
  return (TSIM,X,initial_condition_array)

end


# Run the model to steady state -
function EstimateSteadyState(data_dictionary)

  # Do we have a data_dictionary (if not load a new one)
  if (isempty(data_dictionary))
    # DB 02/27/2016
    TSTART = 0.0
    Ts=1.0
    TSTOP=100
    # DB
    data_dictionary = DataFile(TSTART,TSTOP,Ts)
  end

  #test = data_dictionary["INITIAL_CONDITION_ARRAY"]
  #println(data_dictionary)
  include("edit_file_global.jl")
  UpdateArray(data_dictionary,"INITIAL_CONDITION_ARRAY",initial_cond_update_array)
  UpdateArray(data_dictionary,"RATE_CONSTANT_ARRAY",rate_constant_update_array)
  UpdateArray(data_dictionary,"CONTROL_PARAMETER_ARRAY",control_parameter_update_array)
  # Setup loop -
  EPSILON = 1e-3;
  TSTART = 0.0;
  Ts = 1.0;
  TSTOP = 100;
  did_reach_steady_state = false
  while (!did_reach_steady_state)

    # solve the balances -
    (TSIM,X1) = SolveBalances(TSTART,TSTOP,Ts,data_dictionary);

    # Take a few additional steps -
    TNEXT_START = TSTOP+Ts;
    TNEXT_STOP = TNEXT_START+1.0;
    Ts = 0.1;

    # solve the balances again 0
    initial_condition_array = vec(X1[end,:])
    data_dictionary["INITIAL_CONDITION_ARRAY"] = initial_condition_array;

    (TSIM,X2) = SolveBalances(TNEXT_START,TNEXT_STOP,Ts,data_dictionary);

    # Find the difference -
    DIFF = norm((X2[end,:] - X1[end,:]));

    # Should we stop -or- go around again?
    if (DIFF<EPSILON)
      did_reach_steady_state = true;
      return (X2[end,:]);
    else

      # No, we did *not* reach steady state ....
      TSTART = TSTOP+Ts
      TSTOP = 1000 + TSTART;
      Ts = 100.0;

      initial_condition_array = vec(X2[end,:])
      data_dictionary["INITIAL_CONDITION_ARRAY"] = initial_condition_array;
    end
  end

  # return
  return XSS;

end
