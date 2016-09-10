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
function Control(t,x,rate_vector,data_dictionary)
# ---------------------------------------------------------------------- #
# Control.jl was generated using the Kwatee code generation system.
# Username: jeffreyvarner
# Type: GRN-JULIA
# Version: 1.0
# Generation timestamp: 08-08-2016 20:01:41
#
# Arguments:
# t  - current time
# x  - state vector
# rate_vector - vector of reaction rates
# data_dictionary  - Data dictionary instance (holds model parameters)
# ---------------------------------------------------------------------- #

# Set a default value for the allosteric control variables -
EPSILON = 1.0e-3;
#EPSILON = 1.0e-1;
number_of_reactions = length(rate_vector);
control_vector = ones(number_of_reactions);
control_parameter_array = data_dictionary["CONTROL_PARAMETER_ARRAY"];

# Alias the species vector -
gene_Smad = x[1];
gene_Ecadherin = x[2];
gene_Bcatenin = x[3];
gene_PLCy = x[4];
gene_PKC = x[5];
gene_RAF = x[6];
gene_RAS = x[7];
gene_AP1_SP1 = x[8];
gene_GSK3 = x[9];
gene_tubulin = x[10];
gene_SNAIL_SLUG = x[11];
gene_Calcineurin = x[12];
gene_APC_AXIN = x[13];
gene_PI3K = x[14];
mRNA_Smad = x[15];
mRNA_Ecadherin = x[16];
mRNA_Bcatenin = x[17];
mRNA_PLCy = x[18];
mRNA_PKC = x[19];
mRNA_RAF = x[20];
mRNA_RAS = x[21];
mRNA_AP1_SP1 = x[22];
mRNA_Calcineurin = x[23];
mRNA_SNAIL_SLUG = x[24];
mRNA_tubulin = x[25];
mRNA_APC_AXIN = x[26];
mRNA_GSK3 = x[27];
mRNA_PI3K = x[28];
PLCy = x[29];
Active_PLCy = x[30];
Calcineurin = x[31];
Active_Calcineurin = x[32];
NFATc = x[33];
Active_NFATc = x[34];
PKC = x[35];
Active_PKC = x[36];
RAF = x[37];
RAF_P = x[38];
Smad = x[39];
pSmad = x[40];
PI3K = x[41];
PI3K_P = x[42];
GSK3 = x[43];
GSK3_P = x[44];
RAS = x[45];
RAS_GTP = x[46];
MAPK = x[47];
pMAPK = x[48];
AP1_SP1 = x[49];
AP1_SP1_P = x[50];
Ecadherin = x[51];
Bcatenin = x[52];
Ecadherin_Bcatenin = x[53];
APC_AXIN = x[54];
APC_AXIN_Bcatenin = x[55];
TCF4 = x[56];
Active_TCF4 = x[57];
LEF1 = x[58];
Active_LEF1 = x[59];
PPase = x[60];
YREG1 = x[61];
SNAIL_SLUG = x[62];
vimentin = x[63];
tubulin = x[64];
RNAP = x[65];
RIBOSOME = x[66];
TGFB3_Ab = x[67];
ss_virus = x[68];
ecad_virus = x[69];
U0126 = x[70];
vivit = x[71];
gene_TCF4 = x[72];
gene_TGFB3 = x[73];
gene_YREG1 = x[74];
gene_LEF1 = x[75];
gene_vimentin = x[76];
gene_R = x[77];
gene_VEGFR = x[78];
gene_NFATc = x[79];
gene_MAPK = x[80];
mRNA_TCF4 = x[81];
mRNA_TGFB3 = x[82];
mRNA_YREG1 = x[83];
mRNA_LEF1 = x[84];
mRNA_vimentin = x[85];
mRNA_R = x[86];
mRNA_VEGFR = x[87];
mRNA_NFATc = x[88];
mRNA_MAPK = x[89];
R = x[90];
TGFB12 = x[91];
TGFB3 = x[92];
VEGF = x[93];
TGFB12_R = x[94];
TGFB3_R = x[95];
VEGFR = x[96];
VEGF_VEGFR = x[97];

# ----------------------------------------------------------------------------------- #
transfer_function_vector = Float64[];

# TGFB3_inhibition target: TGFB3_binding actor: TGFB3_Ab type: inhibition
if (TGFB3_Ab<EPSILON);
	push!(transfer_function_vector,1.0);
else
	push!(transfer_function_vector,1.0 - (control_parameter_array[1,1]*(TGFB3_Ab)^control_parameter_array[1,2])/(1+control_parameter_array[1,1]*(TGFB3_Ab)^control_parameter_array[1,2]));
end

control_vector[3] = mean(transfer_function_vector);
transfer_function_vector = 0;
# ----------------------------------------------------------------------------------- #

# ----------------------------------------------------------------------------------- #
transfer_function_vector = Float64[];

# NFATc_inhibition target: Calcineurin_activation_NFATc actor: vivit type: inhibition
if (vivit<EPSILON);
	push!(transfer_function_vector,1.0);
else
	push!(transfer_function_vector,1.0 - (control_parameter_array[2,1]*(vivit)^control_parameter_array[2,2])/(1+control_parameter_array[2,1]*(vivit)^control_parameter_array[2,2]));
end

control_vector[9] = mean(transfer_function_vector);
transfer_function_vector = 0;
# ----------------------------------------------------------------------------------- #

# ----------------------------------------------------------------------------------- #
transfer_function_vector = Float64[];

# GSK3_P_inhibition_Binding_APC_AXIN_forw target: Binding_APC_AXIN_forw actor: GSK3_P type: inhibition
if (GSK3_P<EPSILON);
	push!(transfer_function_vector,1.0);
else
	push!(transfer_function_vector,1.0 - (control_parameter_array[3,1]*(GSK3_P)^control_parameter_array[3,2])/(1+control_parameter_array[3,1]*(GSK3_P)^control_parameter_array[3,2]));
end

control_vector[23] = mean(transfer_function_vector);
transfer_function_vector = 0;
# ----------------------------------------------------------------------------------- #

# ----------------------------------------------------------------------------------- #
transfer_function_vector = Float64[];

# Active_TCF4_inhibition_Ecad target: TCF4_Bcatenin_complex_formation actor: Ecadherin_Bcatenin type: inhibition
if (Ecadherin_Bcatenin<EPSILON);
	push!(transfer_function_vector,1.0);
else
	push!(transfer_function_vector,1.0 - (control_parameter_array[4,1]*(Ecadherin_Bcatenin)^control_parameter_array[4,2])/(1+control_parameter_array[4,1]*(Ecadherin_Bcatenin)^control_parameter_array[4,2]));
end

# Active_TCF4_inhibition_APC target: TCF4_Bcatenin_complex_formation actor: APC_AXIN_Bcatenin type: inhibition
if (APC_AXIN_Bcatenin<EPSILON);
	push!(transfer_function_vector,1.0);
else
	push!(transfer_function_vector,1.0 - (control_parameter_array[5,1]*(APC_AXIN_Bcatenin)^control_parameter_array[5,2])/(1+control_parameter_array[5,1]*(APC_AXIN_Bcatenin)^control_parameter_array[5,2]));
end

control_vector[25] = mean(transfer_function_vector); # was maximum
#@show transfer_function_vector
transfer_function_vector = 0;
# ----------------------------------------------------------------------------------- #

# ----------------------------------------------------------------------------------- #
transfer_function_vector = Float64[];
transfer_function_vector_a = Float64[];

# activation_Ecadherin_by_Active_NFATc target: induction_gene_Ecadherin actor: Active_NFATc type: induction
push!(transfer_function_vector_a,(control_parameter_array[6,1]*(Active_NFATc)^control_parameter_array[6,2])/(1+control_parameter_array[6,1]*(Active_NFATc)^control_parameter_array[6,2]));
# repression_Ecadherin_by_pSmad target: induction_gene_Ecadherin actor: pSmad type: repression
# if (pSmad<EPSILON);
# 	push!(transfer_function_vector,1.0);
# else
# 	push!(transfer_function_vector,1.0 - (control_parameter_array[7,1]*(pSmad)^control_parameter_array[7,2])/(1+control_parameter_array[7,1]*(pSmad)^control_parameter_array[7,2]));
# end

# repression_Ecadherin_by_SNAIL_SLUG target: induction_gene_Ecadherin actor: SNAIL_SLUG type: repression
if (SNAIL_SLUG<EPSILON);
	push!(transfer_function_vector,1.0);
else
	push!(transfer_function_vector,1.0 - (control_parameter_array[8,1]*(Active_LEF1*SNAIL_SLUG)^control_parameter_array[8,2])/(1+control_parameter_array[8,1]*(Active_LEF1*SNAIL_SLUG)^control_parameter_array[8,2]));
end

# repression_Ecadherin_by_Active_LEF1 target: induction_gene_Ecadherin actor: Active_LEF1 type: repression
if (pSmad<EPSILON);
	push!(transfer_function_vector,1.0);
else
	push!(transfer_function_vector,1.0 - (control_parameter_array[9,1]*(Active_LEF1*pSmad)^control_parameter_array[9,2])/(1+control_parameter_array[9,1]*(Active_LEF1*pSmad)^control_parameter_array[9,2]));
end

# activation_Ecadherin_by_ecad_virus target: induction_gene_Ecadherin actor: ecad_virus type: induction
push!(transfer_function_vector_a,(control_parameter_array[10,1]*(ecad_virus)^control_parameter_array[10,2])/(1+control_parameter_array[10,1]*(ecad_virus)^control_parameter_array[10,2]));
#control_vector[125] = maximum([minimum(transfer_function_vector),maximum(transfer_function_vector_a)]);
#control_vector[125] = mean([minimum(transfer_function_vector),maximum(transfer_function_vector_a)]); # more stable?
# function product(A)
# prod = 1
# for x in A
# prod = prod*x
# end
# return prod;
# end
#control_vector[125] = mean([product(transfer_function_vector),maximum(transfer_function_vector_a)]); # more stable?
#control_vector[125] = mean([minimum(transfer_function_vector[1:2]),maximum(transfer_function_vector_a),transfer_function_vector[3]]); # more stable?
#push!(transfer_function_vector,0.5)


#control_vector[125] = maximum([minimum(transfer_function_vector),maximum(transfer_function_vector_a),transfer_function_vector[3]]);
#control_vector[125] = maximum([mean([minimum(transfer_function_vector),transfer_function_vector[3]]),maximum(transfer_function_vector_a)]);

#control_vector[125] = mean([minimum(transfer_function_vector),maximum(transfer_function_vector_a),transfer_function_vector[3]]);
control_vector[125] = mean([minimum(transfer_function_vector),maximum(transfer_function_vector_a)]);




#control_vector[125] = mean([maximum([minimum(transfer_function_vector),transfer_function_vector[3]]),maximum(transfer_function_vector_a)]);


#control_vector[125] = maximum([minimum(transfer_function_vector),maximum(transfer_function_vector_a)]);

#control_vector[125] = mean([minimum(transfer_function_vector),maximum(transfer_function_vector_a),transfer_function_vector[3]]);

transfer_function_vector = 0;
# ----------------------------------------------------------------------------------- #

# ----------------------------------------------------------------------------------- #
transfer_function_vector = Float64[];

# activation_TGFB3_by_TCF4 target: induction_gene_TGFB3 actor: Active_TCF4 type: induction
push!(transfer_function_vector,(control_parameter_array[11,1]*(Active_TCF4)^control_parameter_array[11,2])/(1+control_parameter_array[11,1]*(Active_TCF4)^control_parameter_array[11,2]));
# repression_TGFB3_by_YREG1 target: induction_gene_TGFB3 actor: YREG1 type: repression
if (YREG1<EPSILON);
	push!(transfer_function_vector,1.0);
else
	push!(transfer_function_vector,1.0 - (control_parameter_array[12,1]*(YREG1)^control_parameter_array[12,2])/(1+control_parameter_array[12,1]*(YREG1)^control_parameter_array[12,2]));
end

control_vector[128] = minimum(transfer_function_vector);
transfer_function_vector = 0;
# ----------------------------------------------------------------------------------- #

# ----------------------------------------------------------------------------------- #
transfer_function_vector = Float64[];

# repression_YREG1_by_SNAIL_SLUG target: induction_gene_YREG1 actor: SNAIL_SLUG type: repression
if (SNAIL_SLUG<EPSILON);
	push!(transfer_function_vector,1.0);
else
	push!(transfer_function_vector,1.0 - (control_parameter_array[13,1]*(SNAIL_SLUG)^control_parameter_array[13,2])/(1+control_parameter_array[13,1]*(SNAIL_SLUG)^control_parameter_array[13,2]));
end

control_vector[129] = mean(transfer_function_vector);
transfer_function_vector = 0;
# ----------------------------------------------------------------------------------- #

# ----------------------------------------------------------------------------------- #
transfer_function_vector = Float64[];

# activation_LEF1_by_pSmad target: induction_gene_LEF1 actor: pSmad type: induction
push!(transfer_function_vector,(control_parameter_array[14,1]*(pSmad)^control_parameter_array[14,2])/(1+control_parameter_array[14,1]*(pSmad)^control_parameter_array[14,2]));
# repression_LEF1_by_YREG1 target: induction_gene_LEF1 actor: YREG1 type: repression
if (YREG1<EPSILON);
	push!(transfer_function_vector,1.0);
else
	push!(transfer_function_vector,1.0 - (control_parameter_array[15,1]*(YREG1)^control_parameter_array[15,2])/(1+control_parameter_array[15,1]*(YREG1)^control_parameter_array[15,2]));
end

#control_vector[130] = minimum([mean(transfer_function_vector),transfer_function_vector[2]]); #[2]
#control_vector[130] = minimum([mean(transfer_function_vector),transfer_function_vector[2]*transfer_function_vector[1]]); #[2]
#control_vector[130] = mean([transfer_function_vector[2]*transfer_function_vector[1],transfer_function_vector[1]])
control_vector[130] = mean(transfer_function_vector)
#control_vector[130]=transfer_function_vector[2]*transfer_function_vector[1]

#control_vector[130] = maximum([transfer_function_vector[2],transfer_function_vector[1]])

#control_vector[130] = minimum([transfer_function_vector[2]*transfer_function_vector[1],transfer_function_vector[1]]); #[2]

#control_vector[130] = mean(transfer_function_vector);
#@show mean(transfer_function_vector),transfer_function_vector[2]
transfer_function_vector = 0;
# ----------------------------------------------------------------------------------- #

# ----------------------------------------------------------------------------------- #
transfer_function_vector = Float64[];

# activation_vimentin_by_Active_LEF1 target: induction_gene_vimentin actor: Active_LEF1 type: induction
push!(transfer_function_vector,(control_parameter_array[16,1]*(Active_LEF1*pSmad)^control_parameter_array[16,2])/(1+control_parameter_array[16,1]*(Active_LEF1*pSmad)^control_parameter_array[16,2]));
# activation_vimentin_by_AP1_SP1_P target: induction_gene_vimentin actor: AP1_SP1_P type: induction
push!(transfer_function_vector,(control_parameter_array[17,1]*(AP1_SP1_P)^control_parameter_array[17,2])/(1+control_parameter_array[17,1]*(AP1_SP1_P)^control_parameter_array[17,2]));
control_vector[132] = mean(transfer_function_vector);
transfer_function_vector = 0;
# ----------------------------------------------------------------------------------- #

# ----------------------------------------------------------------------------------- #
transfer_function_vector = Float64[];

# activation_SNAIL_SLUG_by_AP1_SP1_P target: induction_gene_SNAIL_SLUG actor: AP1_SP1_P type: induction
push!(transfer_function_vector,(control_parameter_array[18,1]*(AP1_SP1_P)^control_parameter_array[18,2])/(1+control_parameter_array[18,1]*(AP1_SP1_P)^control_parameter_array[18,2]));
# activation_SNAIL_SLUG_by_ss_virus target: induction_gene_SNAIL_SLUG actor: ss_virus type: induction
push!(transfer_function_vector,(control_parameter_array[19,1]*(ss_virus)^control_parameter_array[19,2])/(1+control_parameter_array[19,1]*(ss_virus)^control_parameter_array[19,2]));
control_vector[143] = maximum(transfer_function_vector);
transfer_function_vector = 0;
# ----------------------------------------------------------------------------------- #

# Modify the rate_vector with the control variables -
rate_vector = rate_vector.*control_vector;

# Return the modified rate vector -
return rate_vector;
end
