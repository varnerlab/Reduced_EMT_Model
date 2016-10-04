include("../src/Kinetics.jl");
include("../src/Control.jl");

# ----------------------------------------------------------------------------------- #
# Copyright (c) 2016 Varnerlab
# School of Chemical Engineering Purdue University
# W. Lafayette IN 46907 USA

# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
#
# The above copyright notice and this permission notice shall be included in
# all copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
# THE SOFTWARE.
# ----------------------------------------------------------------------------------- #
function Balances(t,x,dxdt_vector,data_dictionary)
# ---------------------------------------------------------------------- #
# Balances.jl was generated using the Kwatee code generation system.
# Username: jeffreyvarner
# Type: GRN-JULIA
# Version: 1.0
# Generation timestamp: 08-08-2016 20:01:41
#
# Arguments:
# t  - current time
# x  - state vector
# dxdt_vector - right hand side vector
# data_dictionary  - Data dictionary instance (holds model parameters)
# ---------------------------------------------------------------------- #

# Correct nagative x's = throws errors in control even if small -
idx = find(x->(x<0),x);
x[idx] = 0.0;

# Call the kinetics function -
(rate_vector) = Kinetics(t,x,data_dictionary);

# Call the control function -
(rate_vector) = Control(t,x,rate_vector,data_dictionary);

# Encode the balance equations as a matrix vector product -
# Get the required matricies -
maximum_specific_growth_rate = data_dictionary["MAXIMUM_SPECIFIC_GROWTH_RATE"];
S = data_dictionary["STOICHIOMETRIC_MATRIX"];
dilution_selection_array = data_dictionary["DILUTION_SELECTION_ARRAY"];
tau_array = data_dictionary["TIME_CONSTANT_ARRAY"];

# Calculate and correct dxdt -
tmp_vector = S*rate_vector;
number_of_states = length(tmp_vector);
for state_index in collect(1:number_of_states)
	dxdt_vector[state_index] = tau_array[state_index]*(tmp_vector[state_index] - maximum_specific_growth_rate*dilution_selection_array[state_index]*(x[state_index]));
end

# set ribosome and RNAP rates to 0
dxdt_vector[65] = 0;
dxdt_vector[66] = 0;
# set ppase rate to 0
dxdt_vector[60] = 0;

# Correct extracellular species -
cellmass = Cellmass(t,x,data_dictionary);

end

# ---------------------------------------------------------------------- #
# User defined cellmass function -
# ---------------------------------------------------------------------- #
function Cellmass(t,x,data_dictionary)
	# User function to calculate the cellmass abundance -
	# Default behavior is cellmass = 1.0
	cellmass = 1.0;
	return cellmass;
end
