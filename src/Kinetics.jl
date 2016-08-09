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
# Generation timestamp: 08-08-2016 20:01:41
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

# Formulate the kinetic rate vector - 
rate_constant_array = data_dictionary["RATE_CONSTANT_ARRAY"];
saturation_constant_array = data_dictionary["SATURATION_CONSTANT_ARRAY"];
rate_vector = Float64[];

# 1 TGFB12_binding: TGFB12+R =([])=> TGFB12_R
tmp = rate_constant_array[1]*(TGFB12)/(saturation_constant_array[1,91] + TGFB12)*(R)/(saturation_constant_array[1,90] + R);
push!(rate_vector,tmp);

# 2 TGFB12_binding: TGFB12_R =([])=> TGFB12+R (reverse)
tmp = rate_constant_array[2]*(TGFB12_R)/(saturation_constant_array[2,94] + TGFB12_R);
push!(rate_vector,tmp);

# 3 TGFB3_binding: TGFB3+R =([])=> TGFB3_R
tmp = rate_constant_array[3]*(TGFB3)/(saturation_constant_array[3,92] + TGFB3)*(R)/(saturation_constant_array[3,90] + R);
push!(rate_vector,tmp);

# 4 TGFB3_binding: TGFB3_R =([])=> TGFB3+R (reverse)
tmp = rate_constant_array[4]*(TGFB3_R)/(saturation_constant_array[4,95] + TGFB3_R);
push!(rate_vector,tmp);

# 5 VEGF_binding: VEGF+VEGFR =([])=> VEGF_VEGFR
tmp = rate_constant_array[5]*(VEGF)/(saturation_constant_array[5,93] + VEGF)*(VEGFR)/(saturation_constant_array[5,96] + VEGFR);
push!(rate_vector,tmp);

# 6 VEGF_binding: VEGF_VEGFR =([])=> VEGF+VEGFR (reverse)
tmp = rate_constant_array[6]*(VEGF_VEGFR)/(saturation_constant_array[6,97] + VEGF_VEGFR);
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

# 42 VEGF_VEGFR_degradation: VEGF_VEGFR =([])=> []
tmp = rate_constant_array[42]*(VEGF_VEGFR);
push!(rate_vector,tmp);

# 43 Bcatenin_degradation: Bcatenin =([])=> []
tmp = rate_constant_array[43]*(Bcatenin);
push!(rate_vector,tmp);

# 44 Ecadherin_degrdation: Ecadherin =([])=> []
tmp = rate_constant_array[44]*(Ecadherin);
push!(rate_vector,tmp);

# 45 Smad_degradation: Smad =([])=> []
tmp = rate_constant_array[45]*(Smad);
push!(rate_vector,tmp);

# 46 TCF4_degradation: TCF4 =([])=> []
tmp = rate_constant_array[46]*(TCF4);
push!(rate_vector,tmp);

# 47 Active_TCF4_degradation: Active_TCF4 =([])=> []
tmp = rate_constant_array[47]*(Active_TCF4);
push!(rate_vector,tmp);

# 48 YREG1_degradation: YREG1 =([])=> []
tmp = rate_constant_array[48]*(YREG1);
push!(rate_vector,tmp);

# 49 SNAIL_SLUG_degradation: SNAIL_SLUG =([])=> []
tmp = rate_constant_array[49]*(SNAIL_SLUG);
push!(rate_vector,tmp);

# 50 LEF1_degradation: LEF1 =([])=> []
tmp = rate_constant_array[50]*(LEF1);
push!(rate_vector,tmp);

# 51 Active_LEF1_degradation: Active_LEF1 =([])=> []
tmp = rate_constant_array[51]*(Active_LEF1);
push!(rate_vector,tmp);

# 52 vimentin_degradation: vimentin =([])=> []
tmp = rate_constant_array[52]*(vimentin);
push!(rate_vector,tmp);

# 53 VEGFR_degradation: VEGFR =([])=> []
tmp = rate_constant_array[53]*(VEGFR);
push!(rate_vector,tmp);

# 54 NFATc_degradation: NFATc =([])=> []
tmp = rate_constant_array[54]*(NFATc);
push!(rate_vector,tmp);

# 55 Active_NFATc_degradation: Active_NFATc =([])=> []
tmp = rate_constant_array[55]*(Active_NFATc);
push!(rate_vector,tmp);

# 56 degradation_MAPK: MAPK =([])=> []
tmp = rate_constant_array[56]*(MAPK);
push!(rate_vector,tmp);

# 57 degradation_R: R =([])=> []
tmp = rate_constant_array[57]*(R);
push!(rate_vector,tmp);

# 58 Ecadherin_Bcatenin_degradation: Ecadherin_Bcatenin =([])=> []
tmp = rate_constant_array[58]*(Ecadherin_Bcatenin);
push!(rate_vector,tmp);

# 59 AP1_SP1_degradation: AP1_SP1 =([])=> []
tmp = rate_constant_array[59]*(AP1_SP1);
push!(rate_vector,tmp);

# 60 AP1_SP1_P_degradation: AP1_SP1_P =([])=> []
tmp = rate_constant_array[60]*(AP1_SP1_P);
push!(rate_vector,tmp);

# 61 RAS_degradation: RAS =([])=> []
tmp = rate_constant_array[61]*(RAS);
push!(rate_vector,tmp);

# 62 RAF_degradation: RAF =([])=> []
tmp = rate_constant_array[62]*(RAF);
push!(rate_vector,tmp);

# 63 RAS_GTP_degradation: RAS_GTP =([])=> []
tmp = rate_constant_array[63]*(RAS_GTP);
push!(rate_vector,tmp);

# 64 RAF_P_degradation: RAF_P =([])=> []
tmp = rate_constant_array[64]*(RAF_P);
push!(rate_vector,tmp);

# 65 pMAPK_degradation: pMAPK =([])=> []
tmp = rate_constant_array[65]*(pMAPK);
push!(rate_vector,tmp);

# 66 pSmad_degradation: pSmad =([])=> []
tmp = rate_constant_array[66]*(pSmad);
push!(rate_vector,tmp);

# 67 PLCy_degradation: PLCy =([])=> []
tmp = rate_constant_array[67]*(PLCy);
push!(rate_vector,tmp);

# 68 Active_PLCy_degradation: Active_PLCy =([])=> []
tmp = rate_constant_array[68]*(Active_PLCy);
push!(rate_vector,tmp);

# 69 PKC_degradation: PKC =([])=> []
tmp = rate_constant_array[69]*(PKC);
push!(rate_vector,tmp);

# 70 Active_PKC_degradation: Active_PKC =([])=> []
tmp = rate_constant_array[70]*(Active_PKC);
push!(rate_vector,tmp);

# 71 Calcineurin_degradation: Calcineurin =([])=> []
tmp = rate_constant_array[71]*(Calcineurin);
push!(rate_vector,tmp);

# 72 Active_Calcineurin_degradation: Active_Calcineurin =([])=> []
tmp = rate_constant_array[72]*(Active_Calcineurin);
push!(rate_vector,tmp);

# 73 degradation_APC_AXIN: APC_AXIN =([])=> []
tmp = rate_constant_array[73]*(APC_AXIN);
push!(rate_vector,tmp);

# 74 degradation_GSK3_P: GSK3_P =([])=> []
tmp = rate_constant_array[74]*(GSK3_P);
push!(rate_vector,tmp);

# 75 degradation_GSK3: GSK3 =([])=> []
tmp = rate_constant_array[75]*(GSK3);
push!(rate_vector,tmp);

# 76 degradation_PI3K: PI3K =([])=> []
tmp = rate_constant_array[76]*(PI3K);
push!(rate_vector,tmp);

# 77 degradation_APC_AXIN_Bcatenin: APC_AXIN_Bcatenin =([])=> []
tmp = rate_constant_array[77]*(APC_AXIN_Bcatenin);
push!(rate_vector,tmp);

# 78 tubulin_degradation: tubulin =([])=> []
tmp = rate_constant_array[78]*(tubulin);
push!(rate_vector,tmp);

# 79 generation_RNAP: RNAP =([])=> []
tmp = rate_constant_array[79]*(RNAP);
push!(rate_vector,tmp);

# 80 generation_RNAP: [] =([])=> RNAP (reverse)
tmp = rate_constant_array[80];
push!(rate_vector,tmp);

# 81 generation_RIBOSOME: RIBOSOME =([])=> []
tmp = rate_constant_array[81]*(RIBOSOME);
push!(rate_vector,tmp);

# 82 generation_RIBOSOME: [] =([])=> RIBOSOME (reverse)
tmp = rate_constant_array[82];
push!(rate_vector,tmp);

# 83 generation_PPase: PPase =([])=> []
tmp = rate_constant_array[83]*(PPase);
push!(rate_vector,tmp);

# 84 generation_PPase: [] =([])=> PPase (reverse)
tmp = rate_constant_array[84];
push!(rate_vector,tmp);

# 85 addition_TGFB3_Ab: TGFB3_Ab =([])=> []
tmp = rate_constant_array[85]*(TGFB3_Ab);
push!(rate_vector,tmp);

# 86 addition_TGFB3_Ab: [] =([])=> TGFB3_Ab (reverse)
tmp = rate_constant_array[86];
push!(rate_vector,tmp);

# 87 addition_ss_virus: ss_virus =([])=> []
tmp = rate_constant_array[87]*(ss_virus);
push!(rate_vector,tmp);

# 88 addition_ss_virus: [] =([])=> ss_virus (reverse)
tmp = rate_constant_array[88];
push!(rate_vector,tmp);

# 89 addition_ecad_virus: ecad_virus =([])=> []
tmp = rate_constant_array[89]*(ecad_virus);
push!(rate_vector,tmp);

# 90 addition_ecad_virus: [] =([])=> ecad_virus (reverse)
tmp = rate_constant_array[90];
push!(rate_vector,tmp);

# 91 addition_TGFb12: [] =([])=> TGFB12
tmp = rate_constant_array[91];
push!(rate_vector,tmp);

# 92 addition_TGFb12: TGFB12 =([])=> [] (reverse)
tmp = rate_constant_array[92]*(TGFB12);
push!(rate_vector,tmp);

# 93 addition_VEGF: [] =([])=> VEGF
tmp = rate_constant_array[93];
push!(rate_vector,tmp);

# 94 addition_VEGF: VEGF =([])=> [] (reverse)
tmp = rate_constant_array[94]*(VEGF);
push!(rate_vector,tmp);

# 95 addition_TGFB3: [] =([])=> TGFB3
tmp = rate_constant_array[95];
push!(rate_vector,tmp);

# 96 addition_TGFB3: TGFB3 =([])=> [] (reverse)
tmp = rate_constant_array[96]*(TGFB3);
push!(rate_vector,tmp);

# 97 addition_U0126: U0126 =([])=> []
tmp = rate_constant_array[97]*(U0126);
push!(rate_vector,tmp);

# 98 addition_U0126: [] =([])=> U0126 (reverse)
tmp = rate_constant_array[98];
push!(rate_vector,tmp);

# 99 addition_vivit: vivit =([])=> []
tmp = rate_constant_array[99]*(vivit);
push!(rate_vector,tmp);

# 100 addition_vivit: [] =([])=> vivit (reverse)
tmp = rate_constant_array[100];
push!(rate_vector,tmp);

# 101 degradation_mRNA_Smad: mRNA_Smad = []
tmp = rate_constant_array[101]*(mRNA_Smad);
push!(rate_vector,tmp);

# 102 degradation_mRNA_Ecadherin: mRNA_Ecadherin = []
tmp = rate_constant_array[102]*(mRNA_Ecadherin);
push!(rate_vector,tmp);

# 103 degradation_mRNA_Bcatenin: mRNA_Bcatenin = []
tmp = rate_constant_array[103]*(mRNA_Bcatenin);
push!(rate_vector,tmp);

# 104 degradation_mRNA_TCF4: mRNA_TCF4 = []
tmp = rate_constant_array[104]*(mRNA_TCF4);
push!(rate_vector,tmp);

# 105 degradation_mRNA_TGFB3: mRNA_TGFB3 = []
tmp = rate_constant_array[105]*(mRNA_TGFB3);
push!(rate_vector,tmp);

# 106 degradation_mRNA_YREG1: mRNA_YREG1 = []
tmp = rate_constant_array[106]*(mRNA_YREG1);
push!(rate_vector,tmp);

# 107 degradation_mRNA_LEF1: mRNA_LEF1 = []
tmp = rate_constant_array[107]*(mRNA_LEF1);
push!(rate_vector,tmp);

# 108 degradation_mRNA_vimentin: mRNA_vimentin = []
tmp = rate_constant_array[108]*(mRNA_vimentin);
push!(rate_vector,tmp);

# 109 degradation_mRNA_VEGFR: mRNA_VEGFR = []
tmp = rate_constant_array[109]*(mRNA_VEGFR);
push!(rate_vector,tmp);

# 110 degradation_mRNA_NFATc: mRNA_NFATc = []
tmp = rate_constant_array[110]*(mRNA_NFATc);
push!(rate_vector,tmp);

# 111 degradation_mRNA_MAPK: mRNA_MAPK = []
tmp = rate_constant_array[111]*(mRNA_MAPK);
push!(rate_vector,tmp);

# 112 degradation_mRNA_R: mRNA_R = []
tmp = rate_constant_array[112]*(mRNA_R);
push!(rate_vector,tmp);

# 113 degradation_mRNA_PLCy: mRNA_PLCy = []
tmp = rate_constant_array[113]*(mRNA_PLCy);
push!(rate_vector,tmp);

# 114 degradation_mRNA_PKC: mRNA_PKC = []
tmp = rate_constant_array[114]*(mRNA_PKC);
push!(rate_vector,tmp);

# 115 degradation_mRNA_RAF: mRNA_RAF = []
tmp = rate_constant_array[115]*(mRNA_RAF);
push!(rate_vector,tmp);

# 116 degradation_mRNA_RAS: mRNA_RAS = []
tmp = rate_constant_array[116]*(mRNA_RAS);
push!(rate_vector,tmp);

# 117 degradation_mRNA_AP1_SP1: mRNA_AP1_SP1 = []
tmp = rate_constant_array[117]*(mRNA_AP1_SP1);
push!(rate_vector,tmp);

# 118 degradation_mRNA_Calcineurin: mRNA_Calcineurin = []
tmp = rate_constant_array[118]*(mRNA_Calcineurin);
push!(rate_vector,tmp);

# 119 degradation_mRNA_SNAIL_SLUG: mRNA_SNAIL_SLUG = []
tmp = rate_constant_array[119]*(mRNA_SNAIL_SLUG);
push!(rate_vector,tmp);

# 120 degradation_mRNA_tubulin: mRNA_tubulin = []
tmp = rate_constant_array[120]*(mRNA_tubulin);
push!(rate_vector,tmp);

# 121 degradation_mRNA_APC_AXIN: mRNA_APC_AXIN = []
tmp = rate_constant_array[121]*(mRNA_APC_AXIN);
push!(rate_vector,tmp);

# 122 degradation_mRNA_GSK3: mRNA_GSK3 = []
tmp = rate_constant_array[122]*(mRNA_GSK3);
push!(rate_vector,tmp);

# 123 degradation_mRNA_PI3K: mRNA_PI3K = []
tmp = rate_constant_array[123]*(mRNA_PI3K);
push!(rate_vector,tmp);

# 124 induction_gene_Smad: gene_Smad = mRNA_Smad
tmp = rate_constant_array[124]*gene_Smad*RNAP;
push!(rate_vector,tmp);

# 125 induction_gene_Ecadherin: gene_Ecadherin = mRNA_Ecadherin
tmp = rate_constant_array[125]*gene_Ecadherin*RNAP;
push!(rate_vector,tmp);

# 126 induction_gene_Bcatenin: gene_Bcatenin = mRNA_Bcatenin
tmp = rate_constant_array[126]*gene_Bcatenin*RNAP;
push!(rate_vector,tmp);

# 127 induction_gene_TCF4: gene_TCF4 = mRNA_TCF4
tmp = rate_constant_array[127]*gene_TCF4*RNAP;
push!(rate_vector,tmp);

# 128 induction_gene_TGFB3: gene_TGFB3 = mRNA_TGFB3
tmp = rate_constant_array[128]*gene_TGFB3*RNAP;
push!(rate_vector,tmp);

# 129 induction_gene_YREG1: gene_YREG1 = mRNA_YREG1
tmp = rate_constant_array[129]*gene_YREG1*RNAP;
push!(rate_vector,tmp);

# 130 induction_gene_LEF1: gene_LEF1 = mRNA_LEF1
tmp = rate_constant_array[130]*gene_LEF1*RNAP;
push!(rate_vector,tmp);

# 131 induction_gene_R: gene_R = mRNA_R
tmp = rate_constant_array[131]*gene_R*RNAP;
push!(rate_vector,tmp);

# 132 induction_gene_vimentin: gene_vimentin = mRNA_vimentin
tmp = rate_constant_array[132]*gene_vimentin*RNAP;
push!(rate_vector,tmp);

# 133 induction_gene_VEGFR: gene_VEGFR = mRNA_VEGFR
tmp = rate_constant_array[133]*gene_VEGFR*RNAP;
push!(rate_vector,tmp);

# 134 induction_gene_NFATc: gene_NFATc = mRNA_NFATc
tmp = rate_constant_array[134]*gene_NFATc*RNAP;
push!(rate_vector,tmp);

# 135 induction_gene_PLCy: gene_PLCy = mRNA_PLCy
tmp = rate_constant_array[135]*gene_PLCy*RNAP;
push!(rate_vector,tmp);

# 136 induction_gene_PKC: gene_PKC = mRNA_PKC
tmp = rate_constant_array[136]*gene_PKC*RNAP;
push!(rate_vector,tmp);

# 137 induction_gene_RAF: gene_RAF = mRNA_RAF
tmp = rate_constant_array[137]*gene_RAF*RNAP;
push!(rate_vector,tmp);

# 138 induction_gene_RAS: gene_RAS = mRNA_RAS
tmp = rate_constant_array[138]*gene_RAS*RNAP;
push!(rate_vector,tmp);

# 139 induction_gene_MAPK: gene_MAPK = mRNA_MAPK
tmp = rate_constant_array[139]*gene_MAPK*RNAP;
push!(rate_vector,tmp);

# 140 induction_gene_AP1_SP1: gene_AP1_SP1 = mRNA_AP1_SP1
tmp = rate_constant_array[140]*gene_AP1_SP1*RNAP;
push!(rate_vector,tmp);

# 141 induction_gene_GSK3: gene_GSK3 = mRNA_GSK3
tmp = rate_constant_array[141]*gene_GSK3*RNAP;
push!(rate_vector,tmp);

# 142 induction_gene_tubulin: gene_tubulin = mRNA_tubulin
tmp = rate_constant_array[142]*gene_tubulin*RNAP;
push!(rate_vector,tmp);

# 143 induction_gene_SNAIL_SLUG: gene_SNAIL_SLUG = mRNA_SNAIL_SLUG
tmp = rate_constant_array[143]*gene_SNAIL_SLUG*RNAP;
push!(rate_vector,tmp);

# 144 induction_gene_Calcineurin: gene_Calcineurin = mRNA_Calcineurin
tmp = rate_constant_array[144]*gene_Calcineurin*RNAP;
push!(rate_vector,tmp);

# 145 induction_gene_APC_AXIN: gene_APC_AXIN = mRNA_APC_AXIN
tmp = rate_constant_array[145]*gene_APC_AXIN*RNAP;
push!(rate_vector,tmp);

# 146 induction_gene_PI3K: gene_PI3K = mRNA_PI3K
tmp = rate_constant_array[146]*gene_PI3K*RNAP;
push!(rate_vector,tmp);

# 147 translation_mRNA_Smad: mRNA_Smad = Smad
tmp = rate_constant_array[147]*mRNA_Smad*RIBOSOME;
push!(rate_vector,tmp);

# 148 translation_mRNA_Ecadherin: mRNA_Ecadherin = Ecadherin
tmp = rate_constant_array[148]*mRNA_Ecadherin*RIBOSOME;
push!(rate_vector,tmp);

# 149 translation_mRNA_Bcatenin: mRNA_Bcatenin = Bcatenin
tmp = rate_constant_array[149]*mRNA_Bcatenin*RIBOSOME;
push!(rate_vector,tmp);

# 150 translation_mRNA_TCF4: mRNA_TCF4 = TCF4
tmp = rate_constant_array[150]*mRNA_TCF4*RIBOSOME;
push!(rate_vector,tmp);

# 151 translation_mRNA_TGFB3: mRNA_TGFB3 = TGFB3
tmp = rate_constant_array[151]*mRNA_TGFB3*RIBOSOME;
push!(rate_vector,tmp);

# 152 translation_mRNA_YREG1: mRNA_YREG1 = YREG1
tmp = rate_constant_array[152]*mRNA_YREG1*RIBOSOME;
push!(rate_vector,tmp);

# 153 translation_mRNA_LEF1: mRNA_LEF1 = LEF1
tmp = rate_constant_array[153]*mRNA_LEF1*RIBOSOME;
push!(rate_vector,tmp);

# 154 translation_mRNA_vimentin: mRNA_vimentin = vimentin
tmp = rate_constant_array[154]*mRNA_vimentin*RIBOSOME;
push!(rate_vector,tmp);

# 155 translation_mRNA_VEGFR: mRNA_VEGFR = VEGFR
tmp = rate_constant_array[155]*mRNA_VEGFR*RIBOSOME;
push!(rate_vector,tmp);

# 156 translation_mRNA_NFATc: mRNA_NFATc = NFATc
tmp = rate_constant_array[156]*mRNA_NFATc*RIBOSOME;
push!(rate_vector,tmp);

# 157 translation_mRNA_MAPK: mRNA_MAPK = MAPK
tmp = rate_constant_array[157]*mRNA_MAPK*RIBOSOME;
push!(rate_vector,tmp);

# 158 translation_mRNA_R: mRNA_R = R
tmp = rate_constant_array[158]*mRNA_R*RIBOSOME;
push!(rate_vector,tmp);

# 159 translation_mRNA_PLCy: mRNA_PLCy = PLCy
tmp = rate_constant_array[159]*mRNA_PLCy*RIBOSOME;
push!(rate_vector,tmp);

# 160 translation_mRNA_PKC: mRNA_PKC = PKC
tmp = rate_constant_array[160]*mRNA_PKC*RIBOSOME;
push!(rate_vector,tmp);

# 161 translation_mRNA_RAF: mRNA_RAF = RAF
tmp = rate_constant_array[161]*mRNA_RAF*RIBOSOME;
push!(rate_vector,tmp);

# 162 translation_mRNA_RAS: mRNA_RAS = RAS
tmp = rate_constant_array[162]*mRNA_RAS*RIBOSOME;
push!(rate_vector,tmp);

# 163 translation_mRNA_AP1_SP1: mRNA_AP1_SP1 = AP1_SP1
tmp = rate_constant_array[163]*mRNA_AP1_SP1*RIBOSOME;
push!(rate_vector,tmp);

# 164 translation_mRNA_Calcineurin: mRNA_Calcineurin = Calcineurin
tmp = rate_constant_array[164]*mRNA_Calcineurin*RIBOSOME;
push!(rate_vector,tmp);

# 165 translation_mRNA_SNAIL_SLUG: mRNA_SNAIL_SLUG = SNAIL_SLUG
tmp = rate_constant_array[165]*mRNA_SNAIL_SLUG*RIBOSOME;
push!(rate_vector,tmp);

# 166 translation_mRNA_tubulin: mRNA_tubulin = tubulin
tmp = rate_constant_array[166]*mRNA_tubulin*RIBOSOME;
push!(rate_vector,tmp);

# 167 translation_mRNA_APC_AXIN: mRNA_APC_AXIN = APC_AXIN
tmp = rate_constant_array[167]*mRNA_APC_AXIN*RIBOSOME;
push!(rate_vector,tmp);

# 168 translation_mRNA_GSK3: mRNA_GSK3 = GSK3
tmp = rate_constant_array[168]*mRNA_GSK3*RIBOSOME;
push!(rate_vector,tmp);

# 169 translation_mRNA_PI3K: mRNA_PI3K = PI3K
tmp = rate_constant_array[169]*mRNA_PI3K*RIBOSOME;
push!(rate_vector,tmp);

# return the kinetics vector -
return rate_vector;
end
