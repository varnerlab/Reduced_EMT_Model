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
# Generation timestamp: 03-31-2016 14:11:33
#
# Arguments:
# t  - current time
# x  - state vector
# rate_vector - vector of reaction rates
# data_dictionary  - Data dictionary instance (holds model parameters)
# ---------------------------------------------------------------------- #

# Set a default value for the allosteric control variables -
EPSILON = 1.0e-3;
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
gene_tubulin = x[9];
gene_SNAIL_SLUG = x[10];
gene_Calcineurin = x[11];
gene_GSK3 = x[12];
mRNA_Smad = x[13];
mRNA_Ecadherin = x[14];
mRNA_Bcatenin = x[15];
mRNA_PLCy = x[16];
mRNA_PKC = x[17];
mRNA_RAF = x[18];
mRNA_RAS = x[19];
mRNA_AP1_SP1 = x[20];
mRNA_Calcineurin = x[21];
mRNA_SNAIL_SLUG = x[22];
mRNA_tubulin = x[23];
mRNA_GSK3 = x[24];
PLCy = x[25];
Active_PLCy = x[26];
Calcineurin = x[27];
Active_Calcineurin = x[28];
NFATc = x[29];
Active_NFATc = x[30];
PKC = x[31];
Active_PKC = x[32];
RAF = x[33];
RAF_P = x[34];
Smad = x[35];
pSmad = x[36];
RAS = x[37];
RAS_GTP = x[38];
MAPK = x[39];
pMAPK = x[40];
AP1_SP1 = x[41];
AP1_SP1_P = x[42];
Ecadherin = x[43];
Bcatenin = x[44];
Ecadherin_Bcatenin = x[45];
TCF4 = x[46];
Active_TCF4 = x[47];
LEF1 = x[48];
Active_LEF1 = x[49];
PPase = x[50];
YREG1 = x[51];
SNAIL_SLUG = x[52];
vimentin = x[53];
GSK3 = x[54];
tubulin = x[55];
RNAP = x[56];
RIBOSOME = x[57];
U0126 = x[58];
TGFB3_Ab = x[59];
ss_virus = x[60];
smad_virus = x[61];
lef1_virus = x[62];
gene_TCF4 = x[63];
gene_TGFB3 = x[64];
gene_YREG1 = x[65];
gene_LEF1 = x[66];
gene_vimentin = x[67];
gene_R = x[68];
gene_VEGFR = x[69];
gene_NFATc = x[70];
gene_MAPK = x[71];
mRNA_TCF4 = x[72];
mRNA_TGFB3 = x[73];
mRNA_YREG1 = x[74];
mRNA_LEF1 = x[75];
mRNA_vimentin = x[76];
mRNA_R = x[77];
mRNA_VEGFR = x[78];
mRNA_NFATc = x[79];
mRNA_MAPK = x[80];
R = x[81];
TGFB12 = x[82];
TGFB3 = x[83];
VEGF = x[84];
TGFB12_R = x[85];
TGFB3_R = x[86];
VEGFR = x[87];
VEGF_VEGFR = x[88];

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

# activation_Ecadherin_by_Active_NFATc target: induction_gene_Ecadherin actor: Active_NFATc type: induction
push!(transfer_function_vector,(control_parameter_array[2,1]*(Active_NFATc)^control_parameter_array[2,2])/(1+control_parameter_array[2,1]*(Active_NFATc)^control_parameter_array[2,2]));
# repression_Ecadherin_by_pSmad target: induction_gene_Ecadherin actor: pSmad type: repression
if (pSmad<EPSILON);
	push!(transfer_function_vector,1.0);
else
	push!(transfer_function_vector,1.0 - (control_parameter_array[3,1]*(pSmad)^control_parameter_array[3,2])/(1+control_parameter_array[3,1]*(pSmad)^control_parameter_array[3,2]));
end

# repression_Ecadherin_by_SNAIL_SLUG target: induction_gene_Ecadherin actor: SNAIL_SLUG type: repression
if (SNAIL_SLUG<EPSILON);
	push!(transfer_function_vector,1.0);
else
	push!(transfer_function_vector,1.0 - (control_parameter_array[4,1]*(SNAIL_SLUG)^control_parameter_array[4,2])/(1+control_parameter_array[4,1]*(SNAIL_SLUG)^control_parameter_array[4,2]));
end

# repression_Ecadherin_by_Active_LEF1 target: induction_gene_Ecadherin actor: Active_LEF1 type: repression
if (Active_LEF1<EPSILON);
	push!(transfer_function_vector,1.0);
else
	push!(transfer_function_vector,1.0 - (control_parameter_array[5,1]*(Active_LEF1)^control_parameter_array[5,2])/(1+control_parameter_array[5,1]*(Active_LEF1)^control_parameter_array[5,2]));
end

control_vector[135] = mean(transfer_function_vector);
transfer_function_vector = 0;
# ----------------------------------------------------------------------------------- #

# ----------------------------------------------------------------------------------- #
transfer_function_vector = Float64[];

# activation_TGFB3_by_Bcatenin target: induction_gene_TGFB3 actor: Bcatenin type: induction
push!(transfer_function_vector,(control_parameter_array[6,1]*(Bcatenin)^control_parameter_array[6,2])/(1+control_parameter_array[6,1]*(Bcatenin)^control_parameter_array[6,2]));
# activation_TGFB3_by_TCF4 target: induction_gene_TGFB3 actor: Active_TCF4 type: induction
push!(transfer_function_vector,(control_parameter_array[7,1]*(Active_TCF4)^control_parameter_array[7,2])/(1+control_parameter_array[7,1]*(Active_TCF4)^control_parameter_array[7,2]));
control_vector[138] = mean(transfer_function_vector);
transfer_function_vector = 0;
# ----------------------------------------------------------------------------------- #

# ----------------------------------------------------------------------------------- #
transfer_function_vector = Float64[];

# repression_YREG1_by_SNAIL_SLUG target: induction_gene_YREG1 actor: SNAIL_SLUG type: repression
if (SNAIL_SLUG<EPSILON);
	push!(transfer_function_vector,1.0);
else
	push!(transfer_function_vector,1.0 - (control_parameter_array[8,1]*(SNAIL_SLUG)^control_parameter_array[8,2])/(1+control_parameter_array[8,1]*(SNAIL_SLUG)^control_parameter_array[8,2]));
end

control_vector[139] = mean(transfer_function_vector);
transfer_function_vector = 0;
# ----------------------------------------------------------------------------------- #

# ----------------------------------------------------------------------------------- #
transfer_function_vector = Float64[];

# activation_LEF1_by_pSmad target: induction_gene_LEF1 actor: pSmad type: induction
push!(transfer_function_vector,(control_parameter_array[9,1]*(pSmad)^control_parameter_array[9,2])/(1+control_parameter_array[9,1]*(pSmad)^control_parameter_array[9,2]));
# repression_LEF1_by_YREG1 target: induction_gene_LEF1 actor: YREG1 type: repression
if (YREG1<EPSILON);
	push!(transfer_function_vector,1.0);
else
	push!(transfer_function_vector,1.0 - (control_parameter_array[10,1]*(YREG1)^control_parameter_array[10,2])/(1+control_parameter_array[10,1]*(YREG1)^control_parameter_array[10,2]));
end
# DB constituatively inactive enforcement

if pSmad < 0.4
	mod = 0.0
else
	mod = 1.0
end
control_vector[140] = mean(transfer_function_vector*mod);
transfer_function_vector = 0;
# ----------------------------------------------------------------------------------- #

# ----------------------------------------------------------------------------------- #
transfer_function_vector = Float64[];

# activation_vimentin_by_Active_LEF1 target: induction_gene_vimentin actor: Active_LEF1 type: induction
push!(transfer_function_vector,(control_parameter_array[11,1]*(Active_LEF1)^control_parameter_array[11,2])/(1+control_parameter_array[11,1]*(Active_LEF1)^control_parameter_array[11,2]));
# activation_vimentin_by_pSmad target: induction_gene_vimentin actor: pSmad type: induction
push!(transfer_function_vector,(control_parameter_array[12,1]*(pSmad)^control_parameter_array[12,2])/(1+control_parameter_array[12,1]*(pSmad)^control_parameter_array[12,2]));
# activation_vimentin_by_Bcatenin target: induction_gene_vimentin actor: Bcatenin type: induction
push!(transfer_function_vector,(control_parameter_array[13,1]*(Bcatenin)^control_parameter_array[13,2])/(1+control_parameter_array[13,1]*(Bcatenin)^control_parameter_array[13,2]));
# activation_vimentin_by_AP1_SP1_P target: induction_gene_vimentin actor: AP1_SP1_P type: induction
push!(transfer_function_vector,(control_parameter_array[14,1]*(AP1_SP1_P)^control_parameter_array[14,2])/(1+control_parameter_array[14,1]*(AP1_SP1_P)^control_parameter_array[14,2]));
control_vector[142] = mean(transfer_function_vector);
transfer_function_vector = 0;
# ----------------------------------------------------------------------------------- #

# ----------------------------------------------------------------------------------- #
transfer_function_vector = Float64[];

# activation_SNAIL_SLUG_by_AP1_SP1_P target: induction_gene_SNAIL_SLUG actor: AP1_SP1_P type: induction
push!(transfer_function_vector,(control_parameter_array[15,1]*(AP1_SP1_P)^control_parameter_array[15,2])/(1+control_parameter_array[15,1]*(AP1_SP1_P)^control_parameter_array[15,2]));
# activation_SNAIL_SLUG_by_ss_virus target: induction_gene_SNAIL_SLUG actor: ss_virus type: induction
push!(transfer_function_vector,(control_parameter_array[16,1]*(ss_virus)^control_parameter_array[16,2])/(1+control_parameter_array[16,1]*(ss_virus)^control_parameter_array[16,2]));
control_vector[152] = mean(transfer_function_vector);
transfer_function_vector = 0;
# ----------------------------------------------------------------------------------- #

# Modify the rate_vector with the control variables -
rate_vector = rate_vector.*control_vector;

# Return the modified rate vector -
return rate_vector;
end
