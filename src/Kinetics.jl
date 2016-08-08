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
function Kinetics(t,x,data_dictionary)
# --------------------------------------------------------------------- #
# Kinetics.jl was generated using the Kwatee code generation system.
# Username: jeffreyvarner
# Type: GRN-JULIA
# Version: 1.0
# Generation timestamp: 06-24-2016 14:59:02
#
# Input arguments:
# t  - current time
# x  - state vector
# data_dictionary - parameter vector
#
# Return arguments:
# rate_vector - rate vector
# --------------------------------------------------------------------- #
#
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
U0126 = x[67];
TGFB3_Ab = x[68];
ss_virus = x[69];
ecad_virus = x[70];
gene_TCF4 = x[71];
gene_TGFB3 = x[72];
gene_YREG1 = x[73];
gene_LEF1 = x[74];
gene_vimentin = x[75];
gene_R = x[76];
gene_VEGFR = x[77];
gene_NFATc = x[78];
gene_MAPK = x[79];
mRNA_TCF4 = x[80];
mRNA_TGFB3 = x[81];
mRNA_YREG1 = x[82];
mRNA_LEF1 = x[83];
mRNA_vimentin = x[84];
mRNA_R = x[85];
mRNA_VEGFR = x[86];
mRNA_NFATc = x[87];
mRNA_MAPK = x[88];
R = x[89];
TGFB12 = x[90];
TGFB3 = x[91];
VEGF = x[92];
TGFB12_R = x[93];
TGFB3_R = x[94];
VEGFR = x[95];
VEGF_VEGFR = x[96];

# Formulate the kinetic rate vector -
rate_constant_array = data_dictionary["RATE_CONSTANT_ARRAY"];
# apply bionumbers term (elements in rca become alphas and betas for transcription and translation respectively)
# @show rate_constant_array,2
# rate_constant_array[140:162]=rate_constant_array[140:162]*const_transcription
# rate_constant_array[163:185]=rate_constant_array[163:185]*const_translation
# #@show rate_constant_array[140:162]
# rate_constant_array[76:95]=rate_constant_array[76:95]*degradation_constant_mRNA
# rate_constant_array[39:75]=rate_constant_array[39:75]*degradation_constant_protein

saturation_constant_array = data_dictionary["SATURATION_CONSTANT_ARRAY"];
rate_vector = Float64[];

# 1 TGFB12_binding: TGFB12+R =([])=> TGFB12_R
tmp = rate_constant_array[1]*(TGFB12)/(saturation_constant_array[1,90] + TGFB12)*(R)/(saturation_constant_array[1,89] + R);
push!(rate_vector,tmp);

# 2 TGFB12_binding: TGFB12_R =([])=> TGFB12+R (reverse)
tmp = rate_constant_array[2]*(TGFB12_R)/(saturation_constant_array[2,93] + TGFB12_R);
push!(rate_vector,tmp);

# 3 TGFB3_binding: TGFB3+R =([])=> TGFB3_R
tmp = rate_constant_array[3]*(TGFB3)/(saturation_constant_array[3,91] + TGFB3)*(R)/(saturation_constant_array[3,89] + R);
push!(rate_vector,tmp);

# 4 TGFB3_binding: TGFB3_R =([])=> TGFB3+R (reverse)
tmp = rate_constant_array[4]*(TGFB3_R)/(saturation_constant_array[4,94] + TGFB3_R);
push!(rate_vector,tmp);

# 5 VEGF_binding: VEGF+VEGFR =([])=> VEGF_VEGFR
tmp = rate_constant_array[5]*(VEGF)/(saturation_constant_array[5,92] + VEGF)*(VEGFR)/(saturation_constant_array[5,95] + VEGFR);
push!(rate_vector,tmp);

# 6 VEGF_binding: VEGF_VEGFR =([])=> VEGF+VEGFR (reverse)
tmp = rate_constant_array[6]*(VEGF_VEGFR)/(saturation_constant_array[6,96] + VEGF_VEGFR);
push!(rate_vector,tmp);

# 7 VEGF_VEGFR_PLCy: PLCy =(VEGF_VEGFR)=> Active_PLCy
tmp = rate_constant_array[7]*(VEGF_VEGFR)*(PLCy)/(saturation_constant_array[7,29] + PLCy);
push!(rate_vector,tmp);

# 8 PLCy_activation_Calcineurin: Calcineurin =(Active_PLCy)=> Active_Calcineurin
tmp = rate_constant_array[8]*(Active_PLCy)*(Calcineurin)/(saturation_constant_array[8,31] + Calcineurin);
push!(rate_vector,tmp);

# 9 Calcineurin_activation_NFATc: NFATc =(Active_Calcineurin)=> Active_NFATc
tmp = rate_constant_array[9]*(Active_Calcineurin)*(NFATc)/(saturation_constant_array[9,33] + NFATc);
push!(rate_vector,tmp);

# 10 PLCy_activatation_PKC: PKC =(Active_PLCy)=> Active_PKC
tmp = rate_constant_array[10]*(Active_PLCy)*(PKC)/(saturation_constant_array[10,35] + PKC);
push!(rate_vector,tmp);

# 11 PKC_activation_RAF: RAF =(Active_PKC)=> RAF_P
tmp = rate_constant_array[11]*(Active_PKC)*(RAF)/(saturation_constant_array[11,37] + RAF);
push!(rate_vector,tmp);

# 12 TGFB12_R_phosphorylation_Smad: Smad =(TGFB12_R)=> pSmad
tmp = rate_constant_array[12]*(TGFB12_R)*(Smad)/(saturation_constant_array[12,39] + Smad);
push!(rate_vector,tmp);

# 13 TGFB3_R_phosphorylation_Smad: Smad =(TGFB3_R)=> pSmad
tmp = rate_constant_array[13]*(TGFB3_R)*(Smad)/(saturation_constant_array[13,39] + Smad);
push!(rate_vector,tmp);

# 14 TGFB3_R_phosphorylation_PI3K: PI3K =(TGFB3_R)=> PI3K_P
tmp = rate_constant_array[14]*(TGFB3_R)*(PI3K)/(saturation_constant_array[14,41] + PI3K);
push!(rate_vector,tmp);

# 15 PI3K_phosphorylation_GSK3: GSK3 =(PI3K_P)=> GSK3_P
tmp = rate_constant_array[15]*(PI3K_P)*(GSK3)/(saturation_constant_array[15,43] + GSK3);
push!(rate_vector,tmp);

# 16 TGFB12_R_activation_RAS: RAS =(TGFB12_R)=> RAS_GTP
tmp = rate_constant_array[16]*(TGFB12_R)*(RAS)/(saturation_constant_array[16,45] + RAS);
push!(rate_vector,tmp);

# 17 RAS_GTP_phosphorylation_RAF: RAF =(RAS_GTP)=> RAF_P
tmp = rate_constant_array[17]*(RAS_GTP)*(RAF)/(saturation_constant_array[17,37] + RAF);
push!(rate_vector,tmp);

# 18 RAF_P_phosphorylation_MAPK: MAPK =(RAF_P)=> pMAPK
tmp = rate_constant_array[18]*(RAF_P)*(MAPK)/(saturation_constant_array[18,47] + MAPK);
push!(rate_vector,tmp);

# 19 MAPK_phosphorylation_Smad: Smad =(pMAPK)=> pSmad
tmp = rate_constant_array[19]*(pMAPK)*(Smad)/(saturation_constant_array[19,39] + Smad);
push!(rate_vector,tmp);

# 20 MAPK_phosphorylation_AP1_SP1: AP1_SP1 =(pMAPK)=> AP1_SP1_P
tmp = rate_constant_array[20]*(pMAPK)*(AP1_SP1)/(saturation_constant_array[20,49] + AP1_SP1);
push!(rate_vector,tmp);

# 21 Binding_Ecadherin_Bcatenin: Ecadherin+Bcatenin =([])=> Ecadherin_Bcatenin
tmp = rate_constant_array[21]*(Ecadherin)/(saturation_constant_array[21,51] + Ecadherin)*(Bcatenin)/(saturation_constant_array[21,52] + Bcatenin);
push!(rate_vector,tmp);

# 22 Binding_Ecadherin_Bcatenin: Ecadherin_Bcatenin =([])=> Ecadherin+Bcatenin (reverse)
tmp = rate_constant_array[22]*(Ecadherin_Bcatenin)/(saturation_constant_array[22,53] + Ecadherin_Bcatenin);
push!(rate_vector,tmp);

# 23 Binding_APC_AXIN_forw: APC_AXIN+Bcatenin =([])=> APC_AXIN_Bcatenin
tmp = rate_constant_array[23]*(APC_AXIN)/(saturation_constant_array[23,54] + APC_AXIN)*(Bcatenin)/(saturation_constant_array[23,52] + Bcatenin);
push!(rate_vector,tmp);

# 24 Binding_APC_AXIN_revs: APC_AXIN_Bcatenin =([])=> APC_AXIN+Bcatenin
tmp = rate_constant_array[24]*(APC_AXIN_Bcatenin)/(saturation_constant_array[24,55] + APC_AXIN_Bcatenin);
push!(rate_vector,tmp);

# 25 TCF4_Bcatenin_complex_formation: TCF4+Bcatenin =([])=> Active_TCF4
tmp = rate_constant_array[25]*(TCF4)/(saturation_constant_array[25,56] + TCF4)*(Bcatenin)/(saturation_constant_array[25,52] + Bcatenin);
push!(rate_vector,tmp);

# 26 TCF4_Bcatenin_complex_formation: Active_TCF4 =([])=> TCF4+Bcatenin (reverse)
tmp = rate_constant_array[26]*(Active_TCF4)/(saturation_constant_array[26,57] + Active_TCF4);
push!(rate_vector,tmp);

# 27 LEF1_Bcatenin_complex_formation: LEF1+Bcatenin =([])=> Active_LEF1
tmp = rate_constant_array[27]*(LEF1)/(saturation_constant_array[27,58] + LEF1)*(Bcatenin)/(saturation_constant_array[27,52] + Bcatenin);
push!(rate_vector,tmp);

# 28 LEF1_Bcatenin_complex_formation: Active_LEF1 =([])=> LEF1+Bcatenin (reverse)
tmp = rate_constant_array[28]*(Active_LEF1)/(saturation_constant_array[28,59] + Active_LEF1);
push!(rate_vector,tmp);

# 29 deactivation_pSmad: pSmad =(PPase)=> Smad
tmp = rate_constant_array[29]*(PPase)*(pSmad)/(saturation_constant_array[29,40] + pSmad);
push!(rate_vector,tmp);

# 30 deactivation_RAF_P: RAF_P =(PPase)=> RAF
tmp = rate_constant_array[30]*(PPase)*(RAF_P)/(saturation_constant_array[30,38] + RAF_P);
push!(rate_vector,tmp);

# 31 deactivation_RAS_GTP: RAS_GTP =([])=> RAS
tmp = rate_constant_array[31]*(RAS_GTP)/(saturation_constant_array[31,46] + RAS_GTP);
push!(rate_vector,tmp);

# 32 deactivation_pMAPK: pMAPK =(PPase)=> MAPK
tmp = rate_constant_array[32]*(PPase)*(pMAPK)/(saturation_constant_array[32,48] + pMAPK);
push!(rate_vector,tmp);

# 33 deactivation_AP1_SP1: AP1_SP1_P =(PPase)=> AP1_SP1
tmp = rate_constant_array[33]*(PPase)*(AP1_SP1_P)/(saturation_constant_array[33,50] + AP1_SP1_P);
push!(rate_vector,tmp);

# 34 deactivation_Active_PLCy: Active_PLCy =([])=> PLCy
tmp = rate_constant_array[34]*(Active_PLCy)/(saturation_constant_array[34,30] + Active_PLCy);
push!(rate_vector,tmp);

# 35 deactivation_Active_PKC: Active_PKC =([])=> PKC
tmp = rate_constant_array[35]*(Active_PKC)/(saturation_constant_array[35,36] + Active_PKC);
push!(rate_vector,tmp);

# 36 deactivation_Active_Calcineurin: Active_Calcineurin =([])=> Calcineurin
tmp = rate_constant_array[36]*(Active_Calcineurin)/(saturation_constant_array[36,32] + Active_Calcineurin);
push!(rate_vector,tmp);

# 37 deactivation_Active_NFATc: Active_NFATc =([])=> NFATc
tmp = rate_constant_array[37]*(Active_NFATc)/(saturation_constant_array[37,34] + Active_NFATc);
push!(rate_vector,tmp);

# 38 deactivation_GSK3_P: GSK3_P =(PPase)=> GSK3
tmp = rate_constant_array[38]*(PPase)*(GSK3_P)/(saturation_constant_array[38,44] + GSK3_P);
push!(rate_vector,tmp);

# 39 degradation_TGFB12_R: TGFB12_R =([])=> []
tmp = rate_constant_array[39]*(TGFB12_R);
push!(rate_vector,tmp);

# 40 degradation_TGFB3_R: TGFB3_R =([])=> []
tmp = rate_constant_array[40]*(TGFB3_R);
push!(rate_vector,tmp);

# 41 degradation_TGFB3: TGFB3 =([])=> []
tmp = rate_constant_array[41]*(TGFB3);
push!(rate_vector,tmp);

# 42 Bcatenin_degradation: Bcatenin =([])=> []
tmp = rate_constant_array[42]*(Bcatenin);
push!(rate_vector,tmp);

# 43 Ecadherin_degrdation: Ecadherin =([])=> []
tmp = rate_constant_array[43]*(Ecadherin);
push!(rate_vector,tmp);

# 44 Smad_degradation: Smad =([])=> []
tmp = rate_constant_array[44]*(Smad);
push!(rate_vector,tmp);

# 45 TCF4_degradation: TCF4 =([])=> []
tmp = rate_constant_array[45]*(TCF4);
push!(rate_vector,tmp);

# 46 Active_TCF4_degradation: Active_TCF4 =([])=> []
tmp = rate_constant_array[46]*(Active_TCF4);
push!(rate_vector,tmp);

# 47 YREG1_degradation: YREG1 =([])=> []
tmp = rate_constant_array[47]*(YREG1);
push!(rate_vector,tmp);

# 48 SNAIL_SLUG_degradation: SNAIL_SLUG =([])=> []
tmp = rate_constant_array[48]*(SNAIL_SLUG);
push!(rate_vector,tmp);

# 49 LEF1_degradation: LEF1 =([])=> []
tmp = rate_constant_array[49]*(LEF1);
push!(rate_vector,tmp);

# 50 Active_LEF1_degradation: Active_LEF1 =([])=> []
tmp = rate_constant_array[50]*(Active_LEF1);
push!(rate_vector,tmp);

# 51 vimentin_degradation: vimentin =([])=> []
tmp = rate_constant_array[51]*(vimentin);
push!(rate_vector,tmp);

# 52 VEGFR_degradation: VEGFR =([])=> []
tmp = rate_constant_array[52]*(VEGFR);
push!(rate_vector,tmp);

# 53 NFATc_degradation: NFATc =([])=> []
tmp = rate_constant_array[53]*(NFATc);
push!(rate_vector,tmp);

# 54 Active_NFATc_degradation: Active_NFATc =([])=> []
tmp = rate_constant_array[54]*(Active_NFATc);
push!(rate_vector,tmp);

# 55 degradation_MAPK: MAPK =([])=> []
tmp = rate_constant_array[55]*(MAPK);
push!(rate_vector,tmp);

# 56 degradation_R: R =([])=> []
tmp = rate_constant_array[56]*(R);
push!(rate_vector,tmp);

# 57 Ecadherin_Bcatenin_degradation: Ecadherin_Bcatenin =([])=> []
tmp = rate_constant_array[57]*(Ecadherin_Bcatenin);
push!(rate_vector,tmp);

# 58 AP1_SP1_degradation: AP1_SP1 =([])=> []
tmp = rate_constant_array[58]*(AP1_SP1);
push!(rate_vector,tmp);

# 59 AP1_SP1_P_degradation: AP1_SP1_P =([])=> []
tmp = rate_constant_array[59]*(AP1_SP1_P);
push!(rate_vector,tmp);

# 60 RAS_degradation: RAS =([])=> []
tmp = rate_constant_array[60]*(RAS);
push!(rate_vector,tmp);

# 61 RAF_degradation: RAF =([])=> []
tmp = rate_constant_array[61]*(RAF);
push!(rate_vector,tmp);

# 62 RAS_GTP_degradation: RAS_GTP =([])=> []
tmp = rate_constant_array[62]*(RAS_GTP);
push!(rate_vector,tmp);

# 63 RAF_P_degradation: RAF_P =([])=> []
tmp = rate_constant_array[63]*(RAF_P);
push!(rate_vector,tmp);

# 64 pMAPK_degradation: pMAPK =([])=> []
tmp = rate_constant_array[64]*(pMAPK);
push!(rate_vector,tmp);

# 65 pSmad_degradation: pSmad =([])=> []
tmp = rate_constant_array[65]*(pSmad);
push!(rate_vector,tmp);

# 66 PLCy_degradation: PLCy =([])=> []
tmp = rate_constant_array[66]*(PLCy);
push!(rate_vector,tmp);

# 67 Active_PLCy_degradation: Active_PLCy =([])=> []
tmp = rate_constant_array[67]*(Active_PLCy);
push!(rate_vector,tmp);

# 68 PKC_degradation: PKC =([])=> []
tmp = rate_constant_array[68]*(PKC);
push!(rate_vector,tmp);

# 69 Active_PKC_degradation: Active_PKC =([])=> []
tmp = rate_constant_array[69]*(Active_PKC);
push!(rate_vector,tmp);

# 70 Calcineurin_degradation: Calcineurin =([])=> []
tmp = rate_constant_array[70]*(Calcineurin);
push!(rate_vector,tmp);

# 71 Active_Calcineurin_degradation: Active_Calcineurin =([])=> []
tmp = rate_constant_array[71]*(Active_Calcineurin);
push!(rate_vector,tmp);

# 72 degradation_APC_AXIN_degradation: APC_AXIN =([])=> []
tmp = rate_constant_array[72]*(APC_AXIN);
push!(rate_vector,tmp);

# 73 degradation_GSK3_P_degradation: GSK3_P =([])=> []
tmp = rate_constant_array[73]*(GSK3_P);
push!(rate_vector,tmp);

# 74 degradation_APC_AXIN_Bcatenin_degradation: APC_AXIN_Bcatenin =([])=> []
tmp = rate_constant_array[74]*(APC_AXIN_Bcatenin);
push!(rate_vector,tmp);

# 75 tubulin_degradation: tubulin =([])=> []
tmp = rate_constant_array[75]*(tubulin);
#@show tmp, "deg rate tubulin", tubulin
push!(rate_vector,tmp);

# 76 mRNA_Smad_degradation: mRNA_Smad =([])=> []
tmp = rate_constant_array[76]*(mRNA_Smad);
push!(rate_vector,tmp);

# 77 mRNA_Ecadherin_degradation: mRNA_Ecadherin =([])=> []
tmp = rate_constant_array[77]*(mRNA_Ecadherin);
push!(rate_vector,tmp);

# 78 mRNA_Bcatenin_degradation: mRNA_Bcatenin =([])=> []
tmp = rate_constant_array[78]*(mRNA_Bcatenin);
push!(rate_vector,tmp);

# 79 mRNA_TCF4_degradation: mRNA_TCF4 =([])=> []
tmp = rate_constant_array[79]*(mRNA_TCF4);
push!(rate_vector,tmp);

# 80 mRNA_TGFB3_degradation: mRNA_TGFB3 =([])=> []
tmp = rate_constant_array[80]*(mRNA_TGFB3);
push!(rate_vector,tmp);

# 81 mRNA_YREG1_degradation: mRNA_YREG1 =([])=> []
tmp = rate_constant_array[81]*(mRNA_YREG1);
push!(rate_vector,tmp);

# 82 mRNA_LEF1_degradation: mRNA_LEF1 =([])=> []
tmp = rate_constant_array[82]*(mRNA_LEF1);
push!(rate_vector,tmp);

# 83 mRNA_vimentin_degradation: mRNA_vimentin =([])=> []
tmp = rate_constant_array[83]*(mRNA_vimentin);
push!(rate_vector,tmp);

# 84 mRNA_VEGFR_degradation: mRNA_VEGFR =([])=> []
tmp = rate_constant_array[84]*(mRNA_VEGFR);
push!(rate_vector,tmp);

# 85 mRNA_NFATc_degradation: mRNA_NFATc =([])=> []
tmp = rate_constant_array[85]*(mRNA_NFATc);
push!(rate_vector,tmp);

# 86 mRNA_R_degradation: mRNA_R =([])=> []
tmp = rate_constant_array[86]*(mRNA_R);
push!(rate_vector,tmp);

# 87 mRNA_MAPK_degradation: mRNA_MAPK =([])=> []
tmp = rate_constant_array[87]*(mRNA_MAPK);
push!(rate_vector,tmp);

# 88 mRNA_tubulin_degradation: mRNA_tubulin =([])=> []
tmp = rate_constant_array[88]*(mRNA_tubulin);
push!(rate_vector,tmp);

# 89 mRNA_SNAIL_SLUG_degradation: mRNA_SNAIL_SLUG =([])=> []
tmp = rate_constant_array[89]*(mRNA_SNAIL_SLUG);
push!(rate_vector,tmp);

# 90 mRNA_RAS_degradation: mRNA_RAS =([])=> []
tmp = rate_constant_array[90]*(mRNA_RAS);
push!(rate_vector,tmp);

# 91 mRNA_RAF_degradation: mRNA_RAF =([])=> []
tmp = rate_constant_array[91]*(mRNA_RAF);
push!(rate_vector,tmp);

# 92 mRNA_PLCy_degradation: mRNA_PLCy =([])=> []
tmp = rate_constant_array[92]*(mRNA_PLCy);
push!(rate_vector,tmp);

# 93 mRNA_PKC_degradation: mRNA_PKC =([])=> []
tmp = rate_constant_array[93]*(mRNA_PKC);
push!(rate_vector,tmp);

# 94 mRNA_Calcineurin_degradation: mRNA_Calcineurin =([])=> []
tmp = rate_constant_array[94]*(mRNA_Calcineurin);
push!(rate_vector,tmp);

# 95 mRNA_AP1_SP1_degradation: mRNA_AP1_SP1 =([])=> []
tmp = rate_constant_array[95]*(mRNA_AP1_SP1);
push!(rate_vector,tmp);

# 96 VEGF_VEGFR_degradation: VEGF_VEGFR =([])=> []
tmp = rate_constant_array[96]*(VEGF_VEGFR);
push!(rate_vector,tmp);

# 97 generation_RNAP: RNAP =([])=> []
tmp = rate_constant_array[97]*(RNAP);
push!(rate_vector,tmp);

# 98 generation_RNAP: [] =([])=> RNAP (reverse)
tmp = rate_constant_array[98];
push!(rate_vector,tmp);

# 99 generation_RIBOSOME: RIBOSOME =([])=> []
tmp = rate_constant_array[99]*(RIBOSOME);
push!(rate_vector,tmp);

# 100 generation_RIBOSOME: [] =([])=> RIBOSOME (reverse)
tmp = rate_constant_array[100];
push!(rate_vector,tmp);

# 101 generation_PPase: PPase =([])=> []
tmp = rate_constant_array[101]*(PPase);
push!(rate_vector,tmp);

# 102 generation_PPase: [] =([])=> PPase (reverse)
tmp = rate_constant_array[102];
push!(rate_vector,tmp);

# 103 addition_U0126: U0126 =([])=> []
tmp = rate_constant_array[103]*(U0126);
push!(rate_vector,tmp);

# 104 addition_U0126: [] =([])=> U0126 (reverse)
tmp = rate_constant_array[104];
push!(rate_vector,tmp);

# 105 addition_TGFB3_Ab: TGFB3_Ab =([])=> []
tmp = rate_constant_array[105]*(TGFB3_Ab);
push!(rate_vector,tmp);

# 106 addition_TGFB3_Ab: [] =([])=> TGFB3_Ab (reverse)
tmp = rate_constant_array[106];
push!(rate_vector,tmp);

# 107 addition_ss_virus: ss_virus =([])=> []
tmp = rate_constant_array[107]*(ss_virus);
push!(rate_vector,tmp);

# 108 addition_ss_virus: [] =([])=> ss_virus (reverse)
tmp = rate_constant_array[108];
push!(rate_vector,tmp);

# 109 addition_ecad_virus: ecad_virus =([])=> []
tmp = rate_constant_array[109]*(ecad_virus);
push!(rate_vector,tmp);

# 110 addition_ecad_virus: [] =([])=> ecad_virus (reverse)
tmp = rate_constant_array[110];
push!(rate_vector,tmp);

# 111 addition_TGFb12: [] =([])=> TGFB12
tmp = rate_constant_array[111];
push!(rate_vector,tmp);

# 112 addition_TGFb12: TGFB12 =([])=> [] (reverse)
tmp = rate_constant_array[112]*(TGFB12);
push!(rate_vector,tmp);

# 113 addition_VEGF: [] =([])=> VEGF
tmp = rate_constant_array[113];
push!(rate_vector,tmp);

# 114 addition_VEGF: VEGF =([])=> [] (reverse)
tmp = rate_constant_array[114]*(VEGF);
push!(rate_vector,tmp);

# 115 addition_TGFB3: [] =([])=> TGFB3
tmp = rate_constant_array[115];
push!(rate_vector,tmp);

# 116 addition_TGFB3: TGFB3 =([])=> [] (reverse)
tmp = rate_constant_array[116]*(TGFB3);
push!(rate_vector,tmp);

# 117 degradation_mRNA_Smad: mRNA_Smad = []
tmp = rate_constant_array[117]*(mRNA_Smad);
push!(rate_vector,tmp);

# 118 degradation_mRNA_Ecadherin: mRNA_Ecadherin = []
tmp = rate_constant_array[118]*(mRNA_Ecadherin);
push!(rate_vector,tmp);

# 119 degradation_mRNA_Bcatenin: mRNA_Bcatenin = []
tmp = rate_constant_array[119]*(mRNA_Bcatenin);
push!(rate_vector,tmp);

# 120 degradation_mRNA_TCF4: mRNA_TCF4 = []
tmp = rate_constant_array[120]*(mRNA_TCF4);
push!(rate_vector,tmp);

# 121 degradation_mRNA_TGFB3: mRNA_TGFB3 = []
tmp = rate_constant_array[121]*(mRNA_TGFB3);
push!(rate_vector,tmp);

# 122 degradation_mRNA_YREG1: mRNA_YREG1 = []
tmp = rate_constant_array[122]*(mRNA_YREG1);
push!(rate_vector,tmp);

# 123 degradation_mRNA_LEF1: mRNA_LEF1 = []
tmp = rate_constant_array[123]*(mRNA_LEF1);
push!(rate_vector,tmp);

# 124 degradation_mRNA_vimentin: mRNA_vimentin = []
tmp = rate_constant_array[124]*(mRNA_vimentin);
push!(rate_vector,tmp);

# 125 degradation_mRNA_VEGFR: mRNA_VEGFR = []
tmp = rate_constant_array[125]*(mRNA_VEGFR);
push!(rate_vector,tmp);

# 126 degradation_mRNA_NFATc: mRNA_NFATc = []
tmp = rate_constant_array[126]*(mRNA_NFATc);
push!(rate_vector,tmp);

# 127 degradation_mRNA_MAPK: mRNA_MAPK = []
tmp = rate_constant_array[127]*(mRNA_MAPK);
push!(rate_vector,tmp);

# 128 degradation_mRNA_R: mRNA_R = []
tmp = rate_constant_array[128]*(mRNA_R);
push!(rate_vector,tmp);

# 129 degradation_mRNA_PLCy: mRNA_PLCy = []
tmp = rate_constant_array[129]*(mRNA_PLCy);
push!(rate_vector,tmp);

# 130 degradation_mRNA_PKC: mRNA_PKC = []
tmp = rate_constant_array[130]*(mRNA_PKC);
push!(rate_vector,tmp);

# 131 degradation_mRNA_RAF: mRNA_RAF = []
tmp = rate_constant_array[131]*(mRNA_RAF);
push!(rate_vector,tmp);

# 132 degradation_mRNA_RAS: mRNA_RAS = []
tmp = rate_constant_array[132]*(mRNA_RAS);
push!(rate_vector,tmp);

# 133 degradation_mRNA_AP1_SP1: mRNA_AP1_SP1 = []
tmp = rate_constant_array[133]*(mRNA_AP1_SP1);
push!(rate_vector,tmp);

# 134 degradation_mRNA_Calcineurin: mRNA_Calcineurin = []
tmp = rate_constant_array[134]*(mRNA_Calcineurin);
push!(rate_vector,tmp);

# 135 degradation_mRNA_SNAIL_SLUG: mRNA_SNAIL_SLUG = []
tmp = rate_constant_array[135]*(mRNA_SNAIL_SLUG);
push!(rate_vector,tmp);

# 136 degradation_mRNA_tubulin: mRNA_tubulin = []
tmp = rate_constant_array[136]*(mRNA_tubulin);
push!(rate_vector,tmp);

# 137 degradation_mRNA_APC_AXIN: mRNA_APC_AXIN = []
tmp = rate_constant_array[137]*(mRNA_APC_AXIN);
push!(rate_vector,tmp);

# 138 degradation_mRNA_GSK3: mRNA_GSK3 = []
tmp = rate_constant_array[138]*(mRNA_GSK3);
push!(rate_vector,tmp);

# 139 degradation_mRNA_PI3K: mRNA_PI3K = []
tmp = rate_constant_array[139]*(mRNA_PI3K);
push!(rate_vector,tmp);

# 140 induction_gene_Smad: gene_Smad = mRNA_Smad
tmp = rate_constant_array[140]*gene_Smad*RNAP;
push!(rate_vector,tmp);

# 141 induction_gene_Ecadherin: gene_Ecadherin = mRNA_Ecadherin
tmp = rate_constant_array[141]*gene_Ecadherin*RNAP;
push!(rate_vector,tmp);

# 142 induction_gene_Bcatenin: gene_Bcatenin = mRNA_Bcatenin
tmp = rate_constant_array[142]*gene_Bcatenin*RNAP;
push!(rate_vector,tmp);

# 143 induction_gene_TCF4: gene_TCF4 = mRNA_TCF4
tmp = rate_constant_array[143]*gene_TCF4*RNAP;
push!(rate_vector,tmp);

# 144 induction_gene_TGFB3: gene_TGFB3 = mRNA_TGFB3
tmp = rate_constant_array[144]*gene_TGFB3*RNAP;
push!(rate_vector,tmp);

# 145 induction_gene_YREG1: gene_YREG1 = mRNA_YREG1
tmp = rate_constant_array[145]*gene_YREG1*RNAP;
push!(rate_vector,tmp);

# 146 induction_gene_LEF1: gene_LEF1 = mRNA_LEF1
tmp = rate_constant_array[146]*gene_LEF1*RNAP;
push!(rate_vector,tmp);

# 147 induction_gene_R: gene_R = mRNA_R
tmp = rate_constant_array[147]*gene_R*RNAP;
push!(rate_vector,tmp);

# 148 induction_gene_vimentin: gene_vimentin = mRNA_vimentin
tmp = rate_constant_array[148]*gene_vimentin*RNAP;
push!(rate_vector,tmp);

# 149 induction_gene_VEGFR: gene_VEGFR = mRNA_VEGFR
tmp = rate_constant_array[149]*gene_VEGFR*RNAP;
push!(rate_vector,tmp);

# 150 induction_gene_NFATc: gene_NFATc = mRNA_NFATc
tmp = rate_constant_array[150]*gene_NFATc*RNAP;
push!(rate_vector,tmp);

# 151 induction_gene_PLCy: gene_PLCy = mRNA_PLCy
tmp = rate_constant_array[151]*gene_PLCy*RNAP;
push!(rate_vector,tmp);

# 152 induction_gene_PKC: gene_PKC = mRNA_PKC
tmp = rate_constant_array[152]*gene_PKC*RNAP;
push!(rate_vector,tmp);

# 153 induction_gene_RAF: gene_RAF = mRNA_RAF
tmp = rate_constant_array[153]*gene_RAF*RNAP;
push!(rate_vector,tmp);

# 154 induction_gene_RAS: gene_RAS = mRNA_RAS
tmp = rate_constant_array[154]*gene_RAS*RNAP;
push!(rate_vector,tmp);

# 155 induction_gene_MAPK: gene_MAPK = mRNA_MAPK
tmp = rate_constant_array[155]*gene_MAPK*RNAP;
push!(rate_vector,tmp);

# 156 induction_gene_AP1_SP1: gene_AP1_SP1 = mRNA_AP1_SP1
tmp = rate_constant_array[156]*gene_AP1_SP1*RNAP;
push!(rate_vector,tmp);

# 157 induction_gene_GSK3: gene_GSK3 = mRNA_GSK3
tmp = rate_constant_array[157]*gene_GSK3*RNAP;
push!(rate_vector,tmp);

# 158 induction_gene_tubulin: gene_tubulin = mRNA_tubulin
tmp = rate_constant_array[158]*gene_tubulin*RNAP;
push!(rate_vector,tmp);

# 159 induction_gene_SNAIL_SLUG: gene_SNAIL_SLUG = mRNA_SNAIL_SLUG
tmp = rate_constant_array[159]*gene_SNAIL_SLUG*RNAP;
push!(rate_vector,tmp);

# 160 induction_gene_Calcineurin: gene_Calcineurin = mRNA_Calcineurin
tmp = rate_constant_array[160]*gene_Calcineurin*RNAP;
push!(rate_vector,tmp);

# 161 induction_gene_APC_AXIN: gene_APC_AXIN = mRNA_APC_AXIN
tmp = rate_constant_array[161]*gene_APC_AXIN*RNAP;
push!(rate_vector,tmp);

# 162 induction_gene_PI3K: gene_PI3K = mRNA_PI3K
tmp = rate_constant_array[162]*gene_PI3K*RNAP;
push!(rate_vector,tmp);

# 163 translation_mRNA_Smad: mRNA_Smad = Smad
tmp = rate_constant_array[163]*mRNA_Smad*RIBOSOME;
push!(rate_vector,tmp);

# 164 translation_mRNA_Ecadherin: mRNA_Ecadherin = Ecadherin
tmp = rate_constant_array[164]*mRNA_Ecadherin*RIBOSOME;
push!(rate_vector,tmp);

# 165 translation_mRNA_Bcatenin: mRNA_Bcatenin = Bcatenin
tmp = rate_constant_array[165]*mRNA_Bcatenin*RIBOSOME;
push!(rate_vector,tmp);

# 166 translation_mRNA_TCF4: mRNA_TCF4 = TCF4
tmp = rate_constant_array[166]*mRNA_TCF4*RIBOSOME;
push!(rate_vector,tmp);

# 167 translation_mRNA_TGFB3: mRNA_TGFB3 = TGFB3
tmp = rate_constant_array[167]*mRNA_TGFB3*RIBOSOME;
push!(rate_vector,tmp);

# 168 translation_mRNA_YREG1: mRNA_YREG1 = YREG1
tmp = rate_constant_array[168]*mRNA_YREG1*RIBOSOME;
push!(rate_vector,tmp);

# 169 translation_mRNA_LEF1: mRNA_LEF1 = LEF1
tmp = rate_constant_array[169]*mRNA_LEF1*RIBOSOME;
push!(rate_vector,tmp);

# 170 translation_mRNA_vimentin: mRNA_vimentin = vimentin
tmp = rate_constant_array[170]*mRNA_vimentin*RIBOSOME;
push!(rate_vector,tmp);

# 171 translation_mRNA_VEGFR: mRNA_VEGFR = VEGFR
tmp = rate_constant_array[171]*mRNA_VEGFR*RIBOSOME;
push!(rate_vector,tmp);

# 172 translation_mRNA_NFATc: mRNA_NFATc = NFATc
tmp = rate_constant_array[172]*mRNA_NFATc*RIBOSOME;
push!(rate_vector,tmp);

# 173 translation_mRNA_MAPK: mRNA_MAPK = MAPK
tmp = rate_constant_array[173]*mRNA_MAPK*RIBOSOME;
push!(rate_vector,tmp);

# 174 translation_mRNA_R: mRNA_R = R
tmp = rate_constant_array[174]*mRNA_R*RIBOSOME;
push!(rate_vector,tmp);

# 175 translation_mRNA_PLCy: mRNA_PLCy = PLCy
tmp = rate_constant_array[175]*mRNA_PLCy*RIBOSOME;
push!(rate_vector,tmp);

# 176 translation_mRNA_PKC: mRNA_PKC = PKC
tmp = rate_constant_array[176]*mRNA_PKC*RIBOSOME;
push!(rate_vector,tmp);

# 177 translation_mRNA_RAF: mRNA_RAF = RAF
tmp = rate_constant_array[177]*mRNA_RAF*RIBOSOME;
push!(rate_vector,tmp);

# 178 translation_mRNA_RAS: mRNA_RAS = RAS
tmp = rate_constant_array[178]*mRNA_RAS*RIBOSOME;
push!(rate_vector,tmp);

# 179 translation_mRNA_AP1_SP1: mRNA_AP1_SP1 = AP1_SP1
tmp = rate_constant_array[179]*mRNA_AP1_SP1*RIBOSOME;
push!(rate_vector,tmp);

# 180 translation_mRNA_Calcineurin: mRNA_Calcineurin = Calcineurin
tmp = rate_constant_array[180]*mRNA_Calcineurin*RIBOSOME;
push!(rate_vector,tmp);

# 181 translation_mRNA_SNAIL_SLUG: mRNA_SNAIL_SLUG = SNAIL_SLUG
tmp = rate_constant_array[181]*mRNA_SNAIL_SLUG*RIBOSOME;
push!(rate_vector,tmp);

# 182 translation_mRNA_tubulin: mRNA_tubulin = tubulin
tmp = rate_constant_array[182]*mRNA_tubulin*RIBOSOME;
#@show tmp, "translation rate tubulin", mRNA_tubulin
push!(rate_vector,tmp);

# 183 translation_mRNA_APC_AXIN: mRNA_APC_AXIN = APC_AXIN
tmp = rate_constant_array[183]*mRNA_APC_AXIN*RIBOSOME;
push!(rate_vector,tmp);

# 184 translation_mRNA_GSK3: mRNA_GSK3 = GSK3
tmp = rate_constant_array[184]*mRNA_GSK3*RIBOSOME;
push!(rate_vector,tmp);

# 185 translation_mRNA_PI3K: mRNA_PI3K = PI3K
tmp = rate_constant_array[185]*mRNA_PI3K*RIBOSOME;
push!(rate_vector,tmp);

# return the kinetics vector -
return rate_vector;
end
