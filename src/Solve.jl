include("/Users/dbassen/work/KwateeServer-v1.0/src/DataFile.jl")
include("/Users/dbassen/work/KwateeServer-v1.0/src/SolveBalances.jl")
using Debug

# =============================================================================== #
# Solve.jl
# Function library to solve the EMT model for different experimental/test cases
# Author: J.Varner
#
# Version: 1.0
# Date: 12/17/15
# =============================================================================== #
# Run model to steady state and then give pertubation

# Simulate the addition of TGFB -
function SolveModelAddTGFB(TSTART,TSTOP,Ts,data_dictionary)

  # Do we have a data_dictionary (if not load a new one)
  if (isempty(data_dictionary))
    data_dictionary = DataFile(TSTART,TSTOP,Ts)
  end

  # Setup simulation time -
  TSIM = collect(TSTART:Ts:TSTOP);

  # Run the model to steady-state *before* we add the TGFB -
  XSS = EstimateSteadyState(data_dictionary);

  # ok, we established a steady state -
  # reset the initial conditions -
  initial_condition_array = vec(XSS);

  # Add TGFB1/2 -
  initial_condition_array[56] = 10.0;
  data_dictionary["INITIAL_CONDITION_ARRAY"] = initial_condition_array;

  # Run the simulation -
  (TSIM,X) = SolveBalances(TSTART,TSTOP,Ts,data_dictionary);

  # return tuple -
  return (TSIM,X)

end


# Run the model to steady state -
function EstimateSteadyState(data_dictionary)

  # Do we have a data_dictionary (if not load a new one)
  if (isempty(data_dictionary))
    data_dictionary = DataFile(TSTART,TSTOP,Ts)
  end

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
