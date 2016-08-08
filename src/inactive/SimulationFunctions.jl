include("DataFile.jl")
include("SolveBalances.jl")
using Debug


## Keep track of datafile indexes

# TGFB dosing
tgfb12_initial_cond_index = 76 # TGFB12
tgfb12_forward_rate_index = 98 # addition_TGFb12: [] =([])=> TGFB12
tgfb12_reverse_rate_index = 99 # addition_TGFb12: TGFB12 =([])=> [] (reverse)
tgfb12_binding_rate_index = 1 # TGFB12_binding: TGFB12+R =([])=> TGFB12_R

# TGFB signaling
tgfb3_binding_rate_index = 3 # TGFB3_binding: TGFB3+R =([])=> TGFB3_R
R_initial_cond_index = 75
R_deg_rate_index = 51 # R_degradation: R =([])=> []
TGFB12_R_activation_RAS_rate_index = 14 #TGFB12_R_activation_RAS: RAS =(TGFB12_R)=> RAS_GTP
RAS_activation_RAF_rate_index  = 15 # RAS_GTP_phosphorylation_RAF: RAF =(RAS_GTP)=> RAF_P
RAF_activation_MAPK_rate_index = 16 # RAF_P_phosphorylation_MAPK: MAPK =(RAF_P)=> pMAPK
MAPK_activation_AP1_SP1_rate_index = 18 # MAPK_phosphorylation_AP1_SP1: AP1_SP1 =(pMAPK)=> AP1_SP1_P
tgfb12_to_ap1_sp1_gain = 1.5

# Bcatenin complex formation

bcat_ecad_forward_index = 19 	# 19	Binding_Ecadherin_Bcatenin: Ecadherin+Bcatenin =([])=> Ecadherin_Bcatenin
bcat_ecad_reverse_index = 20	# 20	Binding_Ecadherin_Bcatenin: Ecadherin_Bcatenin =([])=> Ecadherin+Bcatenin (reverse)
bcat_tcf4_forward_index = 21	# 21	TCF4_Bcatenin_complex_formation: TCF4+Bcatenin =([])=> Active_TCF4
bcat_tcf4_reverse_index = 22	# 22	TCF4_Bcatenin_complex_formation: Active_TCF4 =([])=> TCF4+Bcatenin (reverse)
bcat_lef1_forward_index = 23 	# 23	LEF1_Bcatenin_complex_formation: LEF1+Bcatenin =([])=> Active_LEF1
bcat_lef1_reverse_index = 24	# 24	LEF1_Bcatenin_complex_formation: Active_LEF1 =([])=> LEF1+Bcatenin (reverse)

bcat_deg_rate_index = 37 # Bcatenin_degradation: Bcatenin =([])=> []
bcat_deg_rate = 0.3 # default 0.1

ecad_bais_factor = 2.0 #
bcat_complex_gain = 5.0

# VEGF dosing
vegf_initial_cond_index = 78 # VEGF
vegf_forward_rate_index = 100 # addition_VEGF: [] =([])=> VEGF
vegf_reverse_rate_index = 101 # addition_VEGF: VEGF =([])=> [] (reverse)
vegf_binding_rate_index = 5 # VEGF+VEGFR =([])=> VEGF_VEGFR

# VEGF signaing
PKC_activation_RAF_rate_index = 11 # PKC_activation_RAF: RAF =(Active_PKC)=> RAF_P


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

  # Modify rate constant array
  rate_constant_array=data_dictionary["RATE_CONSTANT_ARRAY"];
  # Kill TGFB signal for steady state
  rate_constant_array[tgfb12_forward_rate_index]=0;   # forward [] =([])=> TGFB12
  rate_constant_array[tgfb12_reverse_rate_index]=0;  # Reverse TGFB12 =([])=> [] (reverse)
  rate_constant_array[tgfb12_binding_rate_index]=3.0 # speed up TGFB12 binding
  rate_constant_array[tgfb3_binding_rate_index]=3.0 # speed up TGFB3 binding
  rate_constant_array[vegf_forward_rate_index]=0;   # forward [] =([])=> VEGF
  rate_constant_array[vegf_reverse_rate_index]=0;  # Reverse VEGF =([])=> [] (reverse)
  rate_constant_array[vegf_binding_rate_index]=3.0; # speed up VEGF binding
  rate_constant_array[TGFB12_R_activation_RAS_rate_index]=2.0 # speed up RAS activation due to Receptor delay
  rate_constant_array[PKC_activation_RAF_rate_index]=0.1 # bias towards NFATc1 (10x)
  rate_constant_array[bcat_ecad_forward_index]= bcat_complex_gain*ecad_bais_factor
  rate_constant_array[bcat_ecad_reverse_index]= 1.0
  rate_constant_array[bcat_tcf4_forward_index]= bcat_complex_gain
  rate_constant_array[bcat_tcf4_reverse_index]= 1.0
  rate_constant_array[bcat_lef1_forward_index]= bcat_complex_gain
  rate_constant_array[bcat_lef1_reverse_index]= 1.0
  rate_constant_array[bcat_deg_rate_index]= bcat_deg_rate
  rate_constant_array[RAS_activation_RAF_rate_index] = tgfb12_to_ap1_sp1_gain
  rate_constant_array[RAF_activation_MAPK_rate_index] = tgfb12_to_ap1_sp1_gain
  rate_constant_array[MAPK_activation_AP1_SP1_rate_index] = tgfb12_to_ap1_sp1_gain
  #sequestation Bcatenin rate
  data_dictionary["RATE_CONSTANT_ARRAY"] = rate_constant_array;

  # Modify CONTROL_PARAMETER_ARRAY
  GAIN_MASTER = 0.2; # default is 0.1
  control_parameter_array=data_dictionary["CONTROL_PARAMETER_ARRAY"];
  control_parameter_array[1,1]=GAIN_MASTER;
  control_parameter_array[2,1]=GAIN_MASTER;
  control_parameter_array[3,1]=GAIN_MASTER;
  control_parameter_array[4,1]=GAIN_MASTER;
  control_parameter_array[5,1]=GAIN_MASTER;
  control_parameter_array[6,1]=GAIN_MASTER;
  control_parameter_array[7,1]=GAIN_MASTER;
  control_parameter_array[8,1]=GAIN_MASTER;
  control_parameter_array[9,1]=GAIN_MASTER;
  control_parameter_array[10,1]=GAIN_MASTER;
  control_parameter_array[11,1]=GAIN_MASTER;
  control_parameter_array[12,1]=GAIN_MASTER;
  control_parameter_array[13,1]=GAIN_MASTER;
  data_dictionary["CONTROL_PARAMETER_ARRAY"] = control_parameter_array;

  # Run the model to steady-state *before* we add the TGFB -
  XSS = EstimateSteadyState(data_dictionary);
  println(XSS)
  # ok, we established a steady state -
  # reset the initial conditions -
  initial_condition_array = vec(XSS);
  println(initial_condition_array)

  # Add TGFB1/2 -
  initial_condition_array[tgfb12_initial_cond_index] = 6.0; #	TGFB12
  initial_condition_array[R_initial_cond_index] = 6.0; #	Let there be receptors!
  data_dictionary["INITIAL_CONDITION_ARRAY"] = initial_condition_array;

  # Add LOW LEVEL VEGF -
  # initial_condition_array[vegf_initial_cond_index] = 1.0; #	VEGF

  # RESUME TGFB signaling for simulation
  rate_constant_array=data_dictionary["RATE_CONSTANT_ARRAY"];
  rate_constant_array[tgfb12_forward_rate_index]=4.0;   # forward
  rate_constant_array[tgfb12_reverse_rate_index]=0.1;  # Reverse
  rate_constant_array[R_deg_rate_index]=0.01; # attenuate degradation rate
  rate_constant_array[vegf_forward_rate_index]=0;#0;   # forward [] =([])=> VEGF
  rate_constant_array[vegf_reverse_rate_index]=0;#0;  # Reverse VEGF =([])=> [] (reverse)
  data_dictionary["RATE_CONSTANT_ARRAY"] = rate_constant_array;

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
  rate_constant_array=data_dictionary["RATE_CONSTANT_ARRAY"];
  # Kill TGFB AND VEGF signal for steady state
  rate_constant_array[tgfb12_forward_rate_index]=0;   # forward [] =([])=> TGFB12
  rate_constant_array[tgfb12_reverse_rate_index]=0;  # Reverse TGFB12 =([])=> [] (reverse)
  rate_constant_array[vegf_forward_rate_index]=0;   # forward [] =([])=> VEGF
  rate_constant_array[vegf_reverse_rate_index]=0;  # Reverse VEGF =([])=> [] (reverse)
  rate_constant_array[tgfb12_binding_rate_index]=3.0 # speed up TGFB12 binding
  rate_constant_array[tgfb3_binding_rate_index]=3.0 # speed up TGFB3 binding
  rate_constant_array[vegf_binding_rate_index]=3.0; # speed up VEGF binding
  rate_constant_array[PKC_activation_RAF_rate_index]=0.1 # bias towards NFATc1 (10x)
  rate_constant_array[bcat_ecad_forward_index]= bcat_complex_gain*ecad_bais_factor
  rate_constant_array[bcat_ecad_reverse_index]= 1.0
  rate_constant_array[bcat_tcf4_forward_index]= bcat_complex_gain
  rate_constant_array[bcat_tcf4_reverse_index]= 1.0
  rate_constant_array[bcat_lef1_forward_index]= bcat_complex_gain
  rate_constant_array[bcat_lef1_reverse_index]= 1.0
  rate_constant_array[bcat_deg_rate_index]= bcat_deg_rate
  rate_constant_array[RAS_activation_RAF_rate_index] = tgfb12_to_ap1_sp1_gain
  rate_constant_array[RAF_activation_MAPK_rate_index] = tgfb12_to_ap1_sp1_gain
  rate_constant_array[MAPK_activation_AP1_SP1_rate_index] = tgfb12_to_ap1_sp1_gain
  data_dictionary["RATE_CONSTANT_ARRAY"] = rate_constant_array;

  # Modify CONTROL_PARAMETER_ARRAY
  GAIN_MASTER = 0.5; # default is 0.1
  control_parameter_array=data_dictionary["CONTROL_PARAMETER_ARRAY"];
  control_parameter_array[1,1]=GAIN_MASTER;
  control_parameter_array[2,1]=GAIN_MASTER;
  control_parameter_array[3,1]=GAIN_MASTER;
  control_parameter_array[4,1]=GAIN_MASTER;
  control_parameter_array[5,1]=GAIN_MASTER;
  control_parameter_array[6,1]=GAIN_MASTER;
  control_parameter_array[7,1]=GAIN_MASTER;
  control_parameter_array[8,1]=GAIN_MASTER;
  control_parameter_array[9,1]=GAIN_MASTER;
  control_parameter_array[10,1]=GAIN_MASTER;
  control_parameter_array[11,1]=GAIN_MASTER;
  control_parameter_array[12,1]=GAIN_MASTER;
  control_parameter_array[13,1]=GAIN_MASTER;
  data_dictionary["CONTROL_PARAMETER_ARRAY"] = control_parameter_array;

  # Run the model to steady-state *before* we add the TGFB -
  XSS = EstimateSteadyState(data_dictionary);

  # ok, we established a steady state -
  # reset the initial conditions -
  initial_condition_array = vec(XSS);

  # Add VEGF -
  initial_condition_array[vegf_initial_cond_index] = 6.0; #	VEGF 6.0
  data_dictionary["INITIAL_CONDITION_ARRAY"] = initial_condition_array;

  # RESUME VEGF signaling for simulation
  rate_constant_array=data_dictionary["RATE_CONSTANT_ARRAY"];
  rate_constant_array[vegf_forward_rate_index]=4.0;   # forward 4.0
  rate_constant_array[vegf_reverse_rate_index]=0.1;  # Reverse
  data_dictionary["RATE_CONSTANT_ARRAY"] = rate_constant_array;

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

  # Kill ALL signals for steady state
  rate_constant_array=data_dictionary["RATE_CONSTANT_ARRAY"];
#  rate_constant_array[tgfb12_forward_rate_index]=0;   # forward
#  rate_constant_array[tgfb12_reverse_rate_index]=0;  # Reverse
#  rate_constant_array[vegf_forward_rate_index]=0;   # forward [] =([])=> VEGF
#  rate_constant_array[vegf_reverse_rate_index]=0;  # Reverse VEGF =([])=> [] (reverse)
#  rate_constant_array[TGFB12_R_activation_RAS_rate_index]=2.0 # speed up RAS activation due to Receptor delay
#  rate_constant_array[PKC_activation_RAF_rate_index]=0.1 # bias towards NFATc1 (10x)

  rate_constant_array[tgfb12_forward_rate_index]=0;   # forward [] =([])=> TGFB12
  rate_constant_array[tgfb12_reverse_rate_index]=0;  # Reverse TGFB12 =([])=> [] (reverse)
  rate_constant_array[vegf_forward_rate_index]=0;   # forward [] =([])=> VEGF
  rate_constant_array[vegf_reverse_rate_index]=0;  # Reverse VEGF =([])=> [] (reverse)
  rate_constant_array[tgfb12_binding_rate_index]=3.0 # speed up TGFB12 binding
  rate_constant_array[tgfb3_binding_rate_index]=3.0 # speed up TGFB3 binding
  rate_constant_array[vegf_binding_rate_index]=3.0; # speed up VEGF binding
  rate_constant_array[PKC_activation_RAF_rate_index]=0.1 # bias towards NFATc1 (10x)
  rate_constant_array[bcat_ecad_forward_index]= bcat_complex_gain*ecad_bais_factor
  rate_constant_array[bcat_ecad_reverse_index]= 1.0
  rate_constant_array[bcat_tcf4_forward_index]= bcat_complex_gain
  rate_constant_array[bcat_tcf4_reverse_index]= 1.0
  rate_constant_array[bcat_lef1_forward_index]= bcat_complex_gain
  rate_constant_array[bcat_lef1_reverse_index]= 1.0
  rate_constant_array[bcat_deg_rate_index]= bcat_deg_rate
  rate_constant_array[RAS_activation_RAF_rate_index] = tgfb12_to_ap1_sp1_gain
  rate_constant_array[RAF_activation_MAPK_rate_index] = tgfb12_to_ap1_sp1_gain
  rate_constant_array[MAPK_activation_AP1_SP1_rate_index] = tgfb12_to_ap1_sp1_gain
  data_dictionary["RATE_CONSTANT_ARRAY"] = rate_constant_array;

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
