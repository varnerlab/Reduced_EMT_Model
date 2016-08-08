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
function DataFile(TSTART,TSTOP,Ts)
# ----------------------------------------------------------------------------------- #
# DataFile.jl was generated using the Kwatee code generation system.
# DataFile: Stores model parameters as key - value pairs in a Julia Dict()
# Username: jeffreyvarner
# Type: GRN-JULIA
# Version: 1.0
# Generation timestamp: 04-19-2016 10:25:05
#
# Input arguments:
# TSTART  - Time start
# TSTOP  - Time stop
# Ts - Time step
#
# Return arguments:
# data_dictionary  - Data dictionary instance (holds model parameters)
# ----------------------------------------------------------------------------------- #

# Load the stoichiometric matrix -
S = float(open(readdlm,"/Users/dbassen/work/KwateeServer-v1.0/network/Network.dat"));
(NSPECIES,NREACTIONS) = size(S);

# How many genes do we have in the model? -
number_of_genes = 22;

# Formulate the initial condition array -
initial_condition_array = Float64[];
push!(initial_condition_array,1.0);	#	1	gene_Smad
push!(initial_condition_array,1.0);	#	2	gene_Ecadherin
push!(initial_condition_array,1.0);	#	3	gene_Bcatenin
push!(initial_condition_array,1.0);	#	4	gene_PLCy
push!(initial_condition_array,1.0);	#	5	gene_PKC
push!(initial_condition_array,1.0);	#	6	gene_RAF
push!(initial_condition_array,1.0);	#	7	gene_RAS
push!(initial_condition_array,1.0);	#	8	gene_AP1_SP1
push!(initial_condition_array,1.0);	#	9	gene_tubulin
push!(initial_condition_array,1.0);	#	10	gene_SNAIL_SLUG
push!(initial_condition_array,1.0);	#	11	gene_Calcineurin
push!(initial_condition_array,1.0);	#	12	gene_GSK3_APC_AXIN
push!(initial_condition_array,1.0);	#	13	gene_PI3K
push!(initial_condition_array,0.0);	#	14	mRNA_Smad
push!(initial_condition_array,0.0);	#	15	mRNA_Ecadherin
push!(initial_condition_array,0.0);	#	16	mRNA_Bcatenin
push!(initial_condition_array,0.0);	#	17	mRNA_PLCy
push!(initial_condition_array,0.0);	#	18	mRNA_PKC
push!(initial_condition_array,0.0);	#	19	mRNA_RAF
push!(initial_condition_array,0.0);	#	20	mRNA_RAS
push!(initial_condition_array,0.0);	#	21	mRNA_AP1_SP1
push!(initial_condition_array,0.0);	#	22	mRNA_Calcineurin
push!(initial_condition_array,0.0);	#	23	mRNA_SNAIL_SLUG
push!(initial_condition_array,0.0);	#	24	mRNA_tubulin
push!(initial_condition_array,0.0);	#	25	mRNA_GSK3_APC_AXIN
push!(initial_condition_array,0.0);	#	26	mRNA_PI3K
push!(initial_condition_array,0.0);	#	27	PLCy
push!(initial_condition_array,0.0);	#	28	Active_PLCy
push!(initial_condition_array,0.0);	#	29	Calcineurin
push!(initial_condition_array,0.0);	#	30	Active_Calcineurin
push!(initial_condition_array,0.0);	#	31	NFATc
push!(initial_condition_array,0.0);	#	32	Active_NFATc
push!(initial_condition_array,0.0);	#	33	PKC
push!(initial_condition_array,0.0);	#	34	Active_PKC
push!(initial_condition_array,0.0);	#	35	RAF
push!(initial_condition_array,0.0);	#	36	RAF_P
push!(initial_condition_array,0.0);	#	37	Smad
push!(initial_condition_array,0.0);	#	38	pSmad
push!(initial_condition_array,0.0);	#	39	PI3K
push!(initial_condition_array,0.0);	#	40	PI3K_P
push!(initial_condition_array,0.0);	#	41	GSK3_APC_AXIN
push!(initial_condition_array,0.0);	#	42	GSK3_APC_AXIN_P
push!(initial_condition_array,0.0);	#	43	RAS
push!(initial_condition_array,0.0);	#	44	RAS_GTP
push!(initial_condition_array,0.0);	#	45	MAPK
push!(initial_condition_array,0.0);	#	46	pMAPK
push!(initial_condition_array,0.0);	#	47	AP1_SP1
push!(initial_condition_array,0.0);	#	48	AP1_SP1_P
push!(initial_condition_array,0.0);	#	49	Ecadherin
push!(initial_condition_array,0.0);	#	50	Bcatenin
push!(initial_condition_array,0.0);	#	51	Ecadherin_Bcatenin
push!(initial_condition_array,0.0);	#	52	GSK3_APC_AXIN_Bcatenin
push!(initial_condition_array,0.0);	#	53	TCF4
push!(initial_condition_array,0.0);	#	54	Active_TCF4
push!(initial_condition_array,0.0);	#	55	LEF1
push!(initial_condition_array,0.0);	#	56	Active_LEF1
push!(initial_condition_array,0.0);	#	57	PPase
push!(initial_condition_array,0.0);	#	58	YREG1
push!(initial_condition_array,0.0);	#	59	SNAIL_SLUG
push!(initial_condition_array,0.0);	#	60	vimentin
push!(initial_condition_array,0.0);	#	61	tubulin
push!(initial_condition_array,0.0);	#	62	RNAP
push!(initial_condition_array,0.0);	#	63	RIBOSOME
push!(initial_condition_array,0.0);	#	64	U0126
push!(initial_condition_array,0.0);	#	65	TGFB3_Ab
push!(initial_condition_array,0.0);	#	66	ss_virus
push!(initial_condition_array,0.0);	#	67	smad_virus
push!(initial_condition_array,0.0);	#	68	lef1_virus
push!(initial_condition_array,1.0);	#	69	gene_TCF4
push!(initial_condition_array,1.0);	#	70	gene_TGFB3
push!(initial_condition_array,1.0);	#	71	gene_YREG1
push!(initial_condition_array,1.0);	#	72	gene_LEF1
push!(initial_condition_array,1.0);	#	73	gene_vimentin
push!(initial_condition_array,1.0);	#	74	gene_R
push!(initial_condition_array,1.0);	#	75	gene_VEGFR
push!(initial_condition_array,1.0);	#	76	gene_NFATc
push!(initial_condition_array,1.0);	#	77	gene_MAPK
push!(initial_condition_array,0.0);	#	78	mRNA_TCF4
push!(initial_condition_array,0.0);	#	79	mRNA_TGFB3
push!(initial_condition_array,0.0);	#	80	mRNA_YREG1
push!(initial_condition_array,0.0);	#	81	mRNA_LEF1
push!(initial_condition_array,0.0);	#	82	mRNA_vimentin
push!(initial_condition_array,0.0);	#	83	mRNA_R
push!(initial_condition_array,0.0);	#	84	mRNA_VEGFR
push!(initial_condition_array,0.0);	#	85	mRNA_NFATc
push!(initial_condition_array,0.0);	#	86	mRNA_MAPK
push!(initial_condition_array,0.0);	#	87	R
push!(initial_condition_array,0.0);	#	88	TGFB12
push!(initial_condition_array,0.0);	#	89	TGFB3
push!(initial_condition_array,0.0);	#	90	VEGF
push!(initial_condition_array,0.0);	#	91	TGFB12_R
push!(initial_condition_array,0.0);	#	92	TGFB3_R
push!(initial_condition_array,0.0);	#	93	VEGFR
push!(initial_condition_array,0.0);	#	94	VEGF_VEGFR

# Formulate the time constant array -
time_constant_array = Float64[];
push!(time_constant_array,1.0);	#	1	 time constant: gene_Smad
push!(time_constant_array,1.0);	#	2	 time constant: gene_Ecadherin
push!(time_constant_array,1.0);	#	3	 time constant: gene_Bcatenin
push!(time_constant_array,1.0);	#	4	 time constant: gene_PLCy
push!(time_constant_array,1.0);	#	5	 time constant: gene_PKC
push!(time_constant_array,1.0);	#	6	 time constant: gene_RAF
push!(time_constant_array,1.0);	#	7	 time constant: gene_RAS
push!(time_constant_array,1.0);	#	8	 time constant: gene_AP1_SP1
push!(time_constant_array,1.0);	#	9	 time constant: gene_tubulin
push!(time_constant_array,1.0);	#	10	 time constant: gene_SNAIL_SLUG
push!(time_constant_array,1.0);	#	11	 time constant: gene_Calcineurin
push!(time_constant_array,1.0);	#	12	 time constant: gene_GSK3_APC_AXIN
push!(time_constant_array,1.0);	#	13	 time constant: gene_PI3K
push!(time_constant_array,0.1);	#	14	 time constant: mRNA_Smad
push!(time_constant_array,0.1);	#	15	 time constant: mRNA_Ecadherin
push!(time_constant_array,0.1);	#	16	 time constant: mRNA_Bcatenin
push!(time_constant_array,0.1);	#	17	 time constant: mRNA_PLCy
push!(time_constant_array,0.1);	#	18	 time constant: mRNA_PKC
push!(time_constant_array,0.1);	#	19	 time constant: mRNA_RAF
push!(time_constant_array,0.1);	#	20	 time constant: mRNA_RAS
push!(time_constant_array,0.1);	#	21	 time constant: mRNA_AP1_SP1
push!(time_constant_array,0.1);	#	22	 time constant: mRNA_Calcineurin
push!(time_constant_array,0.1);	#	23	 time constant: mRNA_SNAIL_SLUG
push!(time_constant_array,0.1);	#	24	 time constant: mRNA_tubulin
push!(time_constant_array,0.1);	#	25	 time constant: mRNA_GSK3_APC_AXIN
push!(time_constant_array,0.1);	#	26	 time constant: mRNA_PI3K
push!(time_constant_array,1.0);	#	27	 time constant: PLCy
push!(time_constant_array,1.0);	#	28	 time constant: Active_PLCy
push!(time_constant_array,1.0);	#	29	 time constant: Calcineurin
push!(time_constant_array,1.0);	#	30	 time constant: Active_Calcineurin
push!(time_constant_array,1.0);	#	31	 time constant: NFATc
push!(time_constant_array,1.0);	#	32	 time constant: Active_NFATc
push!(time_constant_array,1.0);	#	33	 time constant: PKC
push!(time_constant_array,1.0);	#	34	 time constant: Active_PKC
push!(time_constant_array,1.0);	#	35	 time constant: RAF
push!(time_constant_array,1.0);	#	36	 time constant: RAF_P
push!(time_constant_array,1.0);	#	37	 time constant: Smad
push!(time_constant_array,1.0);	#	38	 time constant: pSmad
push!(time_constant_array,1.0);	#	39	 time constant: PI3K
push!(time_constant_array,1.0);	#	40	 time constant: PI3K_P
push!(time_constant_array,1.0);	#	41	 time constant: GSK3_APC_AXIN
push!(time_constant_array,1.0);	#	42	 time constant: GSK3_APC_AXIN_P
push!(time_constant_array,1.0);	#	43	 time constant: RAS
push!(time_constant_array,1.0);	#	44	 time constant: RAS_GTP
push!(time_constant_array,1.0);	#	45	 time constant: MAPK
push!(time_constant_array,1.0);	#	46	 time constant: pMAPK
push!(time_constant_array,1.0);	#	47	 time constant: AP1_SP1
push!(time_constant_array,1.0);	#	48	 time constant: AP1_SP1_P
push!(time_constant_array,1.0);	#	49	 time constant: Ecadherin
push!(time_constant_array,1.0);	#	50	 time constant: Bcatenin
push!(time_constant_array,1.0);	#	51	 time constant: Ecadherin_Bcatenin
push!(time_constant_array,1.0);	#	52	 time constant: GSK3_APC_AXIN_Bcatenin
push!(time_constant_array,1.0);	#	53	 time constant: TCF4
push!(time_constant_array,1.0);	#	54	 time constant: Active_TCF4
push!(time_constant_array,1.0);	#	55	 time constant: LEF1
push!(time_constant_array,1.0);	#	56	 time constant: Active_LEF1
push!(time_constant_array,1.0);	#	57	 time constant: PPase
push!(time_constant_array,1.0);	#	58	 time constant: YREG1
push!(time_constant_array,1.0);	#	59	 time constant: SNAIL_SLUG
push!(time_constant_array,1.0);	#	60	 time constant: vimentin
push!(time_constant_array,1.0);	#	61	 time constant: tubulin
push!(time_constant_array,1.0);	#	62	 time constant: RNAP
push!(time_constant_array,1.0);	#	63	 time constant: RIBOSOME
push!(time_constant_array,1.0);	#	64	 time constant: U0126
push!(time_constant_array,1.0);	#	65	 time constant: TGFB3_Ab
push!(time_constant_array,1.0);	#	66	 time constant: ss_virus
push!(time_constant_array,1.0);	#	67	 time constant: smad_virus
push!(time_constant_array,1.0);	#	68	 time constant: lef1_virus
push!(time_constant_array,1.0);	#	69	 time constant: gene_TCF4
push!(time_constant_array,1.0);	#	70	 time constant: gene_TGFB3
push!(time_constant_array,1.0);	#	71	 time constant: gene_YREG1
push!(time_constant_array,1.0);	#	72	 time constant: gene_LEF1
push!(time_constant_array,1.0);	#	73	 time constant: gene_vimentin
push!(time_constant_array,1.0);	#	74	 time constant: gene_R
push!(time_constant_array,1.0);	#	75	 time constant: gene_VEGFR
push!(time_constant_array,1.0);	#	76	 time constant: gene_NFATc
push!(time_constant_array,1.0);	#	77	 time constant: gene_MAPK
push!(time_constant_array,0.1);	#	78	 time constant: mRNA_TCF4
push!(time_constant_array,0.1);	#	79	 time constant: mRNA_TGFB3
push!(time_constant_array,0.1);	#	80	 time constant: mRNA_YREG1
push!(time_constant_array,0.1);	#	81	 time constant: mRNA_LEF1
push!(time_constant_array,0.1);	#	82	 time constant: mRNA_vimentin
push!(time_constant_array,0.1);	#	83	 time constant: mRNA_R
push!(time_constant_array,0.1);	#	84	 time constant: mRNA_VEGFR
push!(time_constant_array,0.1);	#	85	 time constant: mRNA_NFATc
push!(time_constant_array,0.1);	#	86	 time constant: mRNA_MAPK
push!(time_constant_array,1.0);	#	87	 time constant: R
push!(time_constant_array,1.0);	#	88	 time constant: TGFB12
push!(time_constant_array,1.0);	#	89	 time constant: TGFB3
push!(time_constant_array,1.0);	#	90	 time constant: VEGF
push!(time_constant_array,1.0);	#	91	 time constant: TGFB12_R
push!(time_constant_array,1.0);	#	92	 time constant: TGFB3_R
push!(time_constant_array,1.0);	#	93	 time constant: VEGFR
push!(time_constant_array,1.0);	#	94	 time constant: VEGF_VEGFR

# Formulate the rate constant array -
rate_constant_array = Float64[];
push!(rate_constant_array,1.0);	# 1	TGFB12_binding: TGFB12+R =([])=> TGFB12_R
push!(rate_constant_array,1.0);	# 2	TGFB12_binding: TGFB12_R =([])=> TGFB12+R (reverse)
push!(rate_constant_array,1.0);	# 3	TGFB3_binding: TGFB3+R =([])=> TGFB3_R
push!(rate_constant_array,1.0);	# 4	TGFB3_binding: TGFB3_R =([])=> TGFB3+R (reverse)
push!(rate_constant_array,1.0);	# 5	VEGF_binding: VEGF+VEGFR =([])=> VEGF_VEGFR
push!(rate_constant_array,1.0);	# 6	VEGF_binding: VEGF_VEGFR =([])=> VEGF+VEGFR (reverse)
push!(rate_constant_array,1.0);	# 7	VEGF_VEGFR_PLCy: PLCy =(VEGF_VEGFR)=> Active_PLCy
push!(rate_constant_array,1.0);	# 8	PLCy_activation_Calcineurin: Calcineurin =(Active_PLCy)=> Active_Calcineurin
push!(rate_constant_array,1.0);	# 9	Calcineurin_activation_NFATc: NFATc =(Active_Calcineurin)=> Active_NFATc
push!(rate_constant_array,1.0);	# 10	PLCy_activatation_PKC: PKC =(Active_PLCy)=> Active_PKC
push!(rate_constant_array,1.0);	# 11	PKC_activation_RAF: RAF =(Active_PKC)=> RAF_P
push!(rate_constant_array,1.0);	# 12	TGFB12_R_phosphorylation_Smad: Smad =(TGFB12_R)=> pSmad
push!(rate_constant_array,1.0);	# 13	TGFB3_R_phosphorylation_Smad: Smad =(TGFB3_R)=> pSmad
push!(rate_constant_array,1.0);	# 14	TGFB3_R_phosphorylation_PI3K: PI3K =(TGFB3_R)=> PI3K_P
push!(rate_constant_array,1.0);	# 15	PI3K_phosphorylation_GSK3: GSK3_APC_AXIN =(PI3K_P)=> GSK3_APC_AXIN_P
push!(rate_constant_array,1.0);	# 16	TGFB12_R_activation_RAS: RAS =(TGFB12_R)=> RAS_GTP
push!(rate_constant_array,1.0);	# 17	RAS_GTP_phosphorylation_RAF: RAF =(RAS_GTP)=> RAF_P
push!(rate_constant_array,1.0);	# 18	RAF_P_phosphorylation_MAPK: MAPK =(RAF_P)=> pMAPK
push!(rate_constant_array,1.0);	# 19	MAPK_phosphorylation_Smad: Smad =(pMAPK)=> pSmad
push!(rate_constant_array,1.0);	# 20	MAPK_phosphorylation_AP1_SP1: AP1_SP1 =(pMAPK)=> AP1_SP1_P
push!(rate_constant_array,1.0);	# 21	Binding_Ecadherin_Bcatenin: Ecadherin+Bcatenin =([])=> Ecadherin_Bcatenin
push!(rate_constant_array,1.0);	# 22	Binding_Ecadherin_Bcatenin: Ecadherin_Bcatenin =([])=> Ecadherin+Bcatenin (reverse)
push!(rate_constant_array,1.0);	# 23	Binding_GSK3_APC_AXIN: GSK3_APC_AXIN+Bcatenin =([])=> GSK3_APC_AXIN_Bcatenin
push!(rate_constant_array,1.0);	# 24	Binding_GSK3_APC_AXIN: GSK3_APC_AXIN_Bcatenin =([])=> GSK3_APC_AXIN+Bcatenin (reverse)
push!(rate_constant_array,1.0);	# 25	TCF4_Bcatenin_complex_formation: TCF4+Bcatenin =([])=> Active_TCF4
push!(rate_constant_array,1.0);	# 26	TCF4_Bcatenin_complex_formation: Active_TCF4 =([])=> TCF4+Bcatenin (reverse)
push!(rate_constant_array,1.0);	# 27	LEF1_Bcatenin_complex_formation: LEF1+Bcatenin =([])=> Active_LEF1
push!(rate_constant_array,1.0);	# 28	LEF1_Bcatenin_complex_formation: Active_LEF1 =([])=> LEF1+Bcatenin (reverse)
push!(rate_constant_array,1.0);	# 29	deactivation_pSmad: pSmad =(PPase)=> Smad
push!(rate_constant_array,1.0);	# 30	deactivation_RAF_P: RAF_P =(PPase)=> RAF
push!(rate_constant_array,1.0);	# 31	deactivation_RAS_GTP: RAS_GTP =([])=> RAS
push!(rate_constant_array,1.0);	# 32	deactivation_pMAPK: pMAPK =(PPase)=> MAPK
push!(rate_constant_array,1.0);	# 33	deactivation_AP1_SP1: AP1_SP1_P =(PPase)=> AP1_SP1
push!(rate_constant_array,1.0);	# 34	deactivation_Active_PLCy: Active_PLCy =([])=> PLCy
push!(rate_constant_array,1.0);	# 35	deactivation_Active_PKC: Active_PKC =([])=> PKC
push!(rate_constant_array,1.0);	# 36	deactivation_Active_Calcineurin: Active_Calcineurin =([])=> Calcineurin
push!(rate_constant_array,1.0);	# 37	deactivation_Active_NFATc: Active_NFATc =([])=> NFATc
push!(rate_constant_array,1.0);	# 38	deactivation_GSK3_APC_AXIN_P: GSK3_APC_AXIN_P =(PPase)=> GSK3_APC_AXIN
push!(rate_constant_array,0.1);	# 39	degradation_TGFB12_R: TGFB12_R =([])=> []
push!(rate_constant_array,0.1);	# 40	degradation_TGFB3_R: TGFB3_R =([])=> []
push!(rate_constant_array,0.1);	# 41	degradation_TGFB3: TGFB3 =([])=> []
push!(rate_constant_array,0.1);	# 42	Bcatenin_degradation: Bcatenin =([])=> []
push!(rate_constant_array,0.1);	# 43	Ecadherin_degrdation: Ecadherin =([])=> []
push!(rate_constant_array,0.1);	# 44	Smad_degradation: Smad =([])=> []
push!(rate_constant_array,0.1);	# 45	TCF4_degradation: TCF4 =([])=> []
push!(rate_constant_array,0.1);	# 46	Active_TCF4_degradation: Active_TCF4 =([])=> []
push!(rate_constant_array,0.1);	# 47	YREG1_degradation: YREG1 =([])=> []
push!(rate_constant_array,0.1);	# 48	SNAIL_SLUG_degradation: SNAIL_SLUG =([])=> []
push!(rate_constant_array,0.1);	# 49	LEF1_degradation: LEF1 =([])=> []
push!(rate_constant_array,0.1);	# 50	Active_LEF1_degradation: Active_LEF1 =([])=> []
push!(rate_constant_array,0.1);	# 51	vimentin_degradation: vimentin =([])=> []
push!(rate_constant_array,0.1);	# 52	VEGFR_degradation: VEGFR =([])=> []
push!(rate_constant_array,0.1);	# 53	NFATc_degradation: NFATc =([])=> []
push!(rate_constant_array,0.1);	# 54	Active_NFATc_degradation: Active_NFATc =([])=> []
push!(rate_constant_array,0.1);	# 55	degradation_MAPK: MAPK =([])=> []
push!(rate_constant_array,0.1);	# 56	degradation_R: R =([])=> []
push!(rate_constant_array,0.1);	# 57	Ecadherin_Bcatenin_degradation: Ecadherin_Bcatenin =([])=> []
push!(rate_constant_array,0.1);	# 58	AP1_SP1_degradation: AP1_SP1 =([])=> []
push!(rate_constant_array,0.1);	# 59	AP1_SP1_P_degradation: AP1_SP1_P =([])=> []
push!(rate_constant_array,0.1);	# 60	RAS_degradation: RAS =([])=> []
push!(rate_constant_array,0.1);	# 61	RAF_degradation: RAF =([])=> []
push!(rate_constant_array,0.1);	# 62	RAS_GTP_degradation: RAS_GTP =([])=> []
push!(rate_constant_array,0.1);	# 63	RAF_P_degradation: RAF_P =([])=> []
push!(rate_constant_array,0.1);	# 64	pMAPK_degradation: pMAPK =([])=> []
push!(rate_constant_array,0.1);	# 65	PLCy_degradation: PLCy =([])=> []
push!(rate_constant_array,0.1);	# 66	Active_PLCy_degradation: Active_PLCy =([])=> []
push!(rate_constant_array,0.1);	# 67	PKC_degradation: PKC =([])=> []
push!(rate_constant_array,0.1);	# 68	Active_PKC_degradation: Active_PKC =([])=> []
push!(rate_constant_array,0.1);	# 69	Calcineurin_degradation: Calcineurin =([])=> []
push!(rate_constant_array,0.1);	# 70	Active_Calcineurin_degradation: Active_Calcineurin =([])=> []
push!(rate_constant_array,0.1);	# 71	degradation_GSK3_APC_AXIN_degradation: GSK3_APC_AXIN =([])=> []
push!(rate_constant_array,0.1);	# 72	degradation_GSK3_APC_AXIN_P_degradation: GSK3_APC_AXIN_P =([])=> []
push!(rate_constant_array,0.1);	# 73	degradation_GSK3_APC_AXIN_Bcatenin_degradation: GSK3_APC_AXIN_Bcatenin =([])=> []
push!(rate_constant_array,0.1);	# 74	tubulin_degradation: tubulin =([])=> []
push!(rate_constant_array,0.1);	# 75	mRNA_Smad_degradation: mRNA_Smad =([])=> []
push!(rate_constant_array,0.1);	# 76	mRNA_Ecadherin_degradation: mRNA_Ecadherin =([])=> []
push!(rate_constant_array,0.1);	# 77	mRNA_Bcatenin_degradation: mRNA_Bcatenin =([])=> []
push!(rate_constant_array,0.1);	# 78	mRNA_TCF4_degradation: mRNA_TCF4 =([])=> []
push!(rate_constant_array,0.1);	# 79	mRNA_TGFB3_degradation: mRNA_TGFB3 =([])=> []
push!(rate_constant_array,0.1);	# 80	mRNA_YREG1_degradation: mRNA_YREG1 =([])=> []
push!(rate_constant_array,0.1);	# 81	mRNA_LEF1_degradation: mRNA_LEF1 =([])=> []
push!(rate_constant_array,0.1);	# 82	mRNA_vimentin_degradation: mRNA_vimentin =([])=> []
push!(rate_constant_array,0.1);	# 83	mRNA_VEGFR_degradation: mRNA_VEGFR =([])=> []
push!(rate_constant_array,0.1);	# 84	mRNA_NFATc_degradation: mRNA_NFATc =([])=> []
push!(rate_constant_array,0.1);	# 85	mRNA_R_degradation: mRNA_R =([])=> []
push!(rate_constant_array,0.1);	# 86	mRNA_MAPK_degradation: mRNA_MAPK =([])=> []
push!(rate_constant_array,0.1);	# 87	mRNA_tubulin_degradation: mRNA_tubulin =([])=> []
push!(rate_constant_array,0.1);	# 88	mRNA_SNAIL_SLUG_degradation: mRNA_SNAIL_SLUG =([])=> []
push!(rate_constant_array,0.1);	# 89	mRNA_RAS_degradation: mRNA_RAS =([])=> []
push!(rate_constant_array,0.1);	# 90	mRNA_RAF_degradation: mRNA_RAF =([])=> []
push!(rate_constant_array,0.1);	# 91	mRNA_PLCy_degradation: mRNA_PLCy =([])=> []
push!(rate_constant_array,0.1);	# 92	mRNA_PKC_degradation: mRNA_PKC =([])=> []
push!(rate_constant_array,0.1);	# 93	mRNA_Calcineurin_degradation: mRNA_Calcineurin =([])=> []
push!(rate_constant_array,0.1);	# 94	mRNA_AP1_SP1_degradation: mRNA_AP1_SP1 =([])=> []
push!(rate_constant_array,0.1);	# 95	VEGF_VEGFR_degradation: VEGF_VEGFR =([])=> []
push!(rate_constant_array,0.1);	# 96	generation_RNAP: RNAP =([])=> []
push!(rate_constant_array,1.0);	# 97	generation_RNAP: [] =([])=> RNAP (reverse)
push!(rate_constant_array,0.1);	# 98	generation_RIBOSOME: RIBOSOME =([])=> []
push!(rate_constant_array,1.0);	# 99	generation_RIBOSOME: [] =([])=> RIBOSOME (reverse)
push!(rate_constant_array,0.1);	# 100	generation_PPase: PPase =([])=> []
push!(rate_constant_array,1.0);	# 101	generation_PPase: [] =([])=> PPase (reverse)
push!(rate_constant_array,0.1);	# 102	addition_U0126: U0126 =([])=> []
push!(rate_constant_array,1.0);	# 103	addition_U0126: [] =([])=> U0126 (reverse)
push!(rate_constant_array,0.1);	# 104	addition_TGFB3_Ab: TGFB3_Ab =([])=> []
push!(rate_constant_array,1.0);	# 105	addition_TGFB3_Ab: [] =([])=> TGFB3_Ab (reverse)
push!(rate_constant_array,0.1);	# 106	addition_ss_virus: ss_virus =([])=> []
push!(rate_constant_array,1.0);	# 107	addition_ss_virus: [] =([])=> ss_virus (reverse)
push!(rate_constant_array,0.1);	# 108	addition_smad_virus: smad_virus =([])=> []
push!(rate_constant_array,1.0);	# 109	addition_smad_virus: [] =([])=> smad_virus (reverse)
push!(rate_constant_array,0.1);	# 110	addition_lef1_virus: lef1_virus =([])=> []
push!(rate_constant_array,1.0);	# 111	addition_lef1_virus: [] =([])=> lef1_virus (reverse)
push!(rate_constant_array,1.0);	# 112	addition_TGFb12: [] =([])=> TGFB12
push!(rate_constant_array,0.1);	# 113	addition_TGFb12: TGFB12 =([])=> [] (reverse)
push!(rate_constant_array,1.0);	# 114	addition_VEGF: [] =([])=> VEGF
push!(rate_constant_array,0.1);	# 115	addition_VEGF: VEGF =([])=> [] (reverse)
push!(rate_constant_array,1.0);	# 116	addition_TGFB3: [] =([])=> TGFB3
push!(rate_constant_array,0.1);	# 117	addition_TGFB3: TGFB3 =([])=> [] (reverse)
push!(rate_constant_array,0.1);	# 118	degradation_mRNA_Smad: mRNA_Smad = []
push!(rate_constant_array,0.1);	# 119	degradation_mRNA_Ecadherin: mRNA_Ecadherin = []
push!(rate_constant_array,0.1);	# 120	degradation_mRNA_Bcatenin: mRNA_Bcatenin = []
push!(rate_constant_array,0.1);	# 121	degradation_mRNA_TCF4: mRNA_TCF4 = []
push!(rate_constant_array,0.1);	# 122	degradation_mRNA_TGFB3: mRNA_TGFB3 = []
push!(rate_constant_array,0.1);	# 123	degradation_mRNA_YREG1: mRNA_YREG1 = []
push!(rate_constant_array,0.1);	# 124	degradation_mRNA_LEF1: mRNA_LEF1 = []
push!(rate_constant_array,0.1);	# 125	degradation_mRNA_vimentin: mRNA_vimentin = []
push!(rate_constant_array,0.1);	# 126	degradation_mRNA_VEGFR: mRNA_VEGFR = []
push!(rate_constant_array,0.1);	# 127	degradation_mRNA_NFATc: mRNA_NFATc = []
push!(rate_constant_array,0.1);	# 128	degradation_mRNA_MAPK: mRNA_MAPK = []
push!(rate_constant_array,0.1);	# 129	degradation_mRNA_R: mRNA_R = []
push!(rate_constant_array,0.1);	# 130	degradation_mRNA_PLCy: mRNA_PLCy = []
push!(rate_constant_array,0.1);	# 131	degradation_mRNA_PKC: mRNA_PKC = []
push!(rate_constant_array,0.1);	# 132	degradation_mRNA_RAF: mRNA_RAF = []
push!(rate_constant_array,0.1);	# 133	degradation_mRNA_RAS: mRNA_RAS = []
push!(rate_constant_array,0.1);	# 134	degradation_mRNA_AP1_SP1: mRNA_AP1_SP1 = []
push!(rate_constant_array,0.1);	# 135	degradation_mRNA_Calcineurin: mRNA_Calcineurin = []
push!(rate_constant_array,0.1);	# 136	degradation_mRNA_SNAIL_SLUG: mRNA_SNAIL_SLUG = []
push!(rate_constant_array,0.1);	# 137	degradation_mRNA_tubulin: mRNA_tubulin = []
push!(rate_constant_array,0.1);	# 138	degradation_mRNA_GSK3_APC_AXIN: mRNA_GSK3_APC_AXIN = []
push!(rate_constant_array,0.1);	# 139	degradation_mRNA_PI3K: mRNA_PI3K = []
push!(rate_constant_array,1.0);	# 140	induction_gene_Smad: gene_Smad = mRNA_Smad
push!(rate_constant_array,1.0);	# 141	induction_gene_Ecadherin: gene_Ecadherin = mRNA_Ecadherin
push!(rate_constant_array,1.0);	# 142	induction_gene_Bcatenin: gene_Bcatenin = mRNA_Bcatenin
push!(rate_constant_array,1.0);	# 143	induction_gene_TCF4: gene_TCF4 = mRNA_TCF4
push!(rate_constant_array,1.0);	# 144	induction_gene_TGFB3: gene_TGFB3 = mRNA_TGFB3
push!(rate_constant_array,1.0);	# 145	induction_gene_YREG1: gene_YREG1 = mRNA_YREG1
push!(rate_constant_array,1.0);	# 146	induction_gene_LEF1: gene_LEF1 = mRNA_LEF1
push!(rate_constant_array,1.0);	# 147	induction_gene_R: gene_R = mRNA_R
push!(rate_constant_array,1.0);	# 148	induction_gene_vimentin: gene_vimentin = mRNA_vimentin
push!(rate_constant_array,1.0);	# 149	induction_gene_VEGFR: gene_VEGFR = mRNA_VEGFR
push!(rate_constant_array,1.0);	# 150	induction_gene_NFATc: gene_NFATc = mRNA_NFATc
push!(rate_constant_array,1.0);	# 151	induction_gene_PLCy: gene_PLCy = mRNA_PLCy
push!(rate_constant_array,1.0);	# 152	induction_gene_PKC: gene_PKC = mRNA_PKC
push!(rate_constant_array,1.0);	# 153	induction_gene_RAF: gene_RAF = mRNA_RAF
push!(rate_constant_array,1.0);	# 154	induction_gene_RAS: gene_RAS = mRNA_RAS
push!(rate_constant_array,1.0);	# 155	induction_gene_MAPK: gene_MAPK = mRNA_MAPK
push!(rate_constant_array,1.0);	# 156	induction_gene_AP1_SP1: gene_AP1_SP1 = mRNA_AP1_SP1
push!(rate_constant_array,1.0);	# 157	induction_gene_tubulin: gene_tubulin = mRNA_tubulin
push!(rate_constant_array,1.0);	# 158	induction_gene_SNAIL_SLUG: gene_SNAIL_SLUG = mRNA_SNAIL_SLUG
push!(rate_constant_array,1.0);	# 159	induction_gene_Calcineurin: gene_Calcineurin = mRNA_Calcineurin
push!(rate_constant_array,1.0);	# 160	induction_gene_GSK3_APC_AXIN: gene_GSK3_APC_AXIN = mRNA_GSK3_APC_AXIN
push!(rate_constant_array,1.0);	# 161	induction_gene_PI3K: gene_PI3K = mRNA_PI3K
push!(rate_constant_array,1.0);	# 162	translation_mRNA_Smad: mRNA_Smad = Smad
push!(rate_constant_array,1.0);	# 163	translation_mRNA_Ecadherin: mRNA_Ecadherin = Ecadherin
push!(rate_constant_array,1.0);	# 164	translation_mRNA_Bcatenin: mRNA_Bcatenin = Bcatenin
push!(rate_constant_array,1.0);	# 165	translation_mRNA_TCF4: mRNA_TCF4 = TCF4
push!(rate_constant_array,1.0);	# 166	translation_mRNA_TGFB3: mRNA_TGFB3 = TGFB3
push!(rate_constant_array,1.0);	# 167	translation_mRNA_YREG1: mRNA_YREG1 = YREG1
push!(rate_constant_array,1.0);	# 168	translation_mRNA_LEF1: mRNA_LEF1 = LEF1
push!(rate_constant_array,1.0);	# 169	translation_mRNA_vimentin: mRNA_vimentin = vimentin
push!(rate_constant_array,1.0);	# 170	translation_mRNA_VEGFR: mRNA_VEGFR = VEGFR
push!(rate_constant_array,1.0);	# 171	translation_mRNA_NFATc: mRNA_NFATc = NFATc
push!(rate_constant_array,1.0);	# 172	translation_mRNA_MAPK: mRNA_MAPK = MAPK
push!(rate_constant_array,1.0);	# 173	translation_mRNA_R: mRNA_R = R
push!(rate_constant_array,1.0);	# 174	translation_mRNA_PLCy: mRNA_PLCy = PLCy
push!(rate_constant_array,1.0);	# 175	translation_mRNA_PKC: mRNA_PKC = PKC
push!(rate_constant_array,1.0);	# 176	translation_mRNA_RAF: mRNA_RAF = RAF
push!(rate_constant_array,1.0);	# 177	translation_mRNA_RAS: mRNA_RAS = RAS
push!(rate_constant_array,1.0);	# 178	translation_mRNA_AP1_SP1: mRNA_AP1_SP1 = AP1_SP1
push!(rate_constant_array,1.0);	# 179	translation_mRNA_Calcineurin: mRNA_Calcineurin = Calcineurin
push!(rate_constant_array,1.0);	# 180	translation_mRNA_SNAIL_SLUG: mRNA_SNAIL_SLUG = SNAIL_SLUG
push!(rate_constant_array,1.0);	# 181	translation_mRNA_tubulin: mRNA_tubulin = tubulin
push!(rate_constant_array,1.0);	# 182	translation_mRNA_GSK3_APC_AXIN: mRNA_GSK3_APC_AXIN = GSK3_APC_AXIN
push!(rate_constant_array,1.0);	# 183	translation_mRNA_PI3K: mRNA_PI3K = PI3K

# Formulate the saturation constant array -
saturation_constant_array = zeros(NREACTIONS,NSPECIES);
saturation_constant_array[1,88] = 1.0;	# TGFB12_binding: TGFB12+R =([])=> TGFB12_R	 species: TGFB12
saturation_constant_array[1,87] = 1.0;	# TGFB12_binding: TGFB12+R =([])=> TGFB12_R	 species: R
saturation_constant_array[2,91] = 1.0;	# TGFB12_binding: TGFB12_R =([])=> TGFB12+R (reverse)	 species: TGFB12_R
saturation_constant_array[3,89] = 1.0;	# TGFB3_binding: TGFB3+R =([])=> TGFB3_R	 species: TGFB3
saturation_constant_array[3,87] = 1.0;	# TGFB3_binding: TGFB3+R =([])=> TGFB3_R	 species: R
saturation_constant_array[4,92] = 1.0;	# TGFB3_binding: TGFB3_R =([])=> TGFB3+R (reverse)	 species: TGFB3_R
saturation_constant_array[5,90] = 1.0;	# VEGF_binding: VEGF+VEGFR =([])=> VEGF_VEGFR	 species: VEGF
saturation_constant_array[5,93] = 1.0;	# VEGF_binding: VEGF+VEGFR =([])=> VEGF_VEGFR	 species: VEGFR
saturation_constant_array[6,94] = 1.0;	# VEGF_binding: VEGF_VEGFR =([])=> VEGF+VEGFR (reverse)	 species: VEGF_VEGFR
saturation_constant_array[7,27] = 1.0;	# VEGF_VEGFR_PLCy: PLCy =(VEGF_VEGFR)=> Active_PLCy	 species: PLCy
saturation_constant_array[8,29] = 1.0;	# PLCy_activation_Calcineurin: Calcineurin =(Active_PLCy)=> Active_Calcineurin	 species: Calcineurin
saturation_constant_array[9,31] = 1.0;	# Calcineurin_activation_NFATc: NFATc =(Active_Calcineurin)=> Active_NFATc	 species: NFATc
saturation_constant_array[10,33] = 1.0;	# PLCy_activatation_PKC: PKC =(Active_PLCy)=> Active_PKC	 species: PKC
saturation_constant_array[11,35] = 1.0;	# PKC_activation_RAF: RAF =(Active_PKC)=> RAF_P	 species: RAF
saturation_constant_array[12,37] = 1.0;	# TGFB12_R_phosphorylation_Smad: Smad =(TGFB12_R)=> pSmad	 species: Smad
saturation_constant_array[13,37] = 1.0;	# TGFB3_R_phosphorylation_Smad: Smad =(TGFB3_R)=> pSmad	 species: Smad
saturation_constant_array[14,39] = 1.0;	# TGFB3_R_phosphorylation_PI3K: PI3K =(TGFB3_R)=> PI3K_P	 species: PI3K
saturation_constant_array[15,41] = 1.0;	# PI3K_phosphorylation_GSK3: GSK3_APC_AXIN =(PI3K_P)=> GSK3_APC_AXIN_P	 species: GSK3_APC_AXIN
saturation_constant_array[16,43] = 1.0;	# TGFB12_R_activation_RAS: RAS =(TGFB12_R)=> RAS_GTP	 species: RAS
saturation_constant_array[17,35] = 1.0;	# RAS_GTP_phosphorylation_RAF: RAF =(RAS_GTP)=> RAF_P	 species: RAF
saturation_constant_array[18,45] = 1.0;	# RAF_P_phosphorylation_MAPK: MAPK =(RAF_P)=> pMAPK	 species: MAPK
saturation_constant_array[19,37] = 1.0;	# MAPK_phosphorylation_Smad: Smad =(pMAPK)=> pSmad	 species: Smad
saturation_constant_array[20,47] = 1.0;	# MAPK_phosphorylation_AP1_SP1: AP1_SP1 =(pMAPK)=> AP1_SP1_P	 species: AP1_SP1
saturation_constant_array[21,49] = 2.0;	# Binding_Ecadherin_Bcatenin: Ecadherin+Bcatenin =([])=> Ecadherin_Bcatenin	 species: Ecadherin
saturation_constant_array[21,50] = 0.5;	# Binding_Ecadherin_Bcatenin: Ecadherin+Bcatenin =([])=> Ecadherin_Bcatenin	 species: Bcatenin
saturation_constant_array[22,51] = 1.0;	# Binding_Ecadherin_Bcatenin: Ecadherin_Bcatenin =([])=> Ecadherin+Bcatenin (reverse)	 species: Ecadherin_Bcatenin
saturation_constant_array[23,41] = 2.0;	# Binding_GSK3_APC_AXIN: GSK3_APC_AXIN+Bcatenin =([])=> GSK3_APC_AXIN_Bcatenin	 species: GSK3_APC_AXIN
saturation_constant_array[23,50] = 0.5;	# Binding_GSK3_APC_AXIN: GSK3_APC_AXIN+Bcatenin =([])=> GSK3_APC_AXIN_Bcatenin	 species: Bcatenin
saturation_constant_array[24,52] = 1.0;	# Binding_GSK3_APC_AXIN: GSK3_APC_AXIN_Bcatenin =([])=> GSK3_APC_AXIN+Bcatenin (reverse)	 species: GSK3_APC_AXIN_Bcatenin
saturation_constant_array[25,53] = 0.5;	# TCF4_Bcatenin_complex_formation: TCF4+Bcatenin =([])=> Active_TCF4	 species: TCF4
saturation_constant_array[25,50] = 2.0;	# TCF4_Bcatenin_complex_formation: TCF4+Bcatenin =([])=> Active_TCF4	 species: Bcatenin
saturation_constant_array[26,54] = 1.0;	# TCF4_Bcatenin_complex_formation: Active_TCF4 =([])=> TCF4+Bcatenin (reverse)	 species: Active_TCF4
saturation_constant_array[27,55] = 1.0;	# LEF1_Bcatenin_complex_formation: LEF1+Bcatenin =([])=> Active_LEF1	 species: LEF1
saturation_constant_array[27,50] = 1.0;	# LEF1_Bcatenin_complex_formation: LEF1+Bcatenin =([])=> Active_LEF1	 species: Bcatenin
saturation_constant_array[28,56] = 1.0;	# LEF1_Bcatenin_complex_formation: Active_LEF1 =([])=> LEF1+Bcatenin (reverse)	 species: Active_LEF1
saturation_constant_array[29,38] = 1.0;	# deactivation_pSmad: pSmad =(PPase)=> Smad	 species: pSmad
saturation_constant_array[30,36] = 1.0;	# deactivation_RAF_P: RAF_P =(PPase)=> RAF	 species: RAF_P
saturation_constant_array[31,44] = 1.0;	# deactivation_RAS_GTP: RAS_GTP =([])=> RAS	 species: RAS_GTP
saturation_constant_array[32,46] = 1.0;	# deactivation_pMAPK: pMAPK =(PPase)=> MAPK	 species: pMAPK
saturation_constant_array[33,48] = 1.0;	# deactivation_AP1_SP1: AP1_SP1_P =(PPase)=> AP1_SP1	 species: AP1_SP1_P
saturation_constant_array[34,28] = 1.0;	# deactivation_Active_PLCy: Active_PLCy =([])=> PLCy	 species: Active_PLCy
saturation_constant_array[35,34] = 1.0;	# deactivation_Active_PKC: Active_PKC =([])=> PKC	 species: Active_PKC
saturation_constant_array[36,30] = 1.0;	# deactivation_Active_Calcineurin: Active_Calcineurin =([])=> Calcineurin	 species: Active_Calcineurin
saturation_constant_array[37,32] = 1.0;	# deactivation_Active_NFATc: Active_NFATc =([])=> NFATc	 species: Active_NFATc
saturation_constant_array[38,42] = 1.0;	# deactivation_GSK3_APC_AXIN_P: GSK3_APC_AXIN_P =(PPase)=> GSK3_APC_AXIN	 species: GSK3_APC_AXIN_P

# Formulate control parameter array -
control_parameter_array = zeros(14,2);
# TGFB3_inhibition: TGFB3_Ab inhibition; TGFB3_binding
control_parameter_array[1,1] = 0.1;	#	1 Gain: 	TGFB3_inhibition target: TGFB3_binding actor: TGFB3_Ab type: inhibition
control_parameter_array[1,2] = 1.0;	#	1 Order: 	TGFB3_inhibition target: TGFB3_binding actor: TGFB3_Ab type: inhibition

# activation_Ecadherin_by_Active_NFATc: Active_NFATc induction induction_gene_Ecadherin
control_parameter_array[2,1] = 0.1;	#	2 Gain: 	activation_Ecadherin_by_Active_NFATc target: induction_gene_Ecadherin actor: Active_NFATc type: induction
control_parameter_array[2,2] = 1.0;	#	2 Order: 	activation_Ecadherin_by_Active_NFATc target: induction_gene_Ecadherin actor: Active_NFATc type: induction

# repression_Ecadherin_by_pSmad: pSmad repression induction_gene_Ecadherin
control_parameter_array[3,1] = 0.1;	#	3 Gain: 	repression_Ecadherin_by_pSmad target: induction_gene_Ecadherin actor: pSmad type: repression
control_parameter_array[3,2] = 1.0;	#	3 Order: 	repression_Ecadherin_by_pSmad target: induction_gene_Ecadherin actor: pSmad type: repression

# repression_Ecadherin_by_SNAIL_SLUG: SNAIL_SLUG repression induction_gene_Ecadherin
control_parameter_array[4,1] = 0.1;	#	4 Gain: 	repression_Ecadherin_by_SNAIL_SLUG target: induction_gene_Ecadherin actor: SNAIL_SLUG type: repression
control_parameter_array[4,2] = 1.0;	#	4 Order: 	repression_Ecadherin_by_SNAIL_SLUG target: induction_gene_Ecadherin actor: SNAIL_SLUG type: repression

# repression_Ecadherin_by_Active_LEF1: Active_LEF1 repression induction_gene_Ecadherin
control_parameter_array[5,1] = 0.1;	#	5 Gain: 	repression_Ecadherin_by_Active_LEF1 target: induction_gene_Ecadherin actor: Active_LEF1 type: repression
control_parameter_array[5,2] = 1.0;	#	5 Order: 	repression_Ecadherin_by_Active_LEF1 target: induction_gene_Ecadherin actor: Active_LEF1 type: repression

# activation_TGFB3_by_TCF4: Active_TCF4 induction induction_gene_TGFB3
control_parameter_array[6,1] = 0.1;	#	6 Gain: 	activation_TGFB3_by_TCF4 target: induction_gene_TGFB3 actor: Active_TCF4 type: induction
control_parameter_array[6,2] = 1.0;	#	6 Order: 	activation_TGFB3_by_TCF4 target: induction_gene_TGFB3 actor: Active_TCF4 type: induction

# repression_YREG1_by_SNAIL_SLUG: SNAIL_SLUG repression induction_gene_YREG1
control_parameter_array[7,1] = 0.1;	#	7 Gain: 	repression_YREG1_by_SNAIL_SLUG target: induction_gene_YREG1 actor: SNAIL_SLUG type: repression
control_parameter_array[7,2] = 1.0;	#	7 Order: 	repression_YREG1_by_SNAIL_SLUG target: induction_gene_YREG1 actor: SNAIL_SLUG type: repression

# activation_LEF1_by_pSmad: pSmad induction induction_gene_LEF1
control_parameter_array[8,1] = 0.1;	#	8 Gain: 	activation_LEF1_by_pSmad target: induction_gene_LEF1 actor: pSmad type: induction
control_parameter_array[8,2] = 1.0;	#	8 Order: 	activation_LEF1_by_pSmad target: induction_gene_LEF1 actor: pSmad type: induction

# repression_LEF1_by_YREG1: YREG1 repression induction_gene_LEF1
control_parameter_array[9,1] = 0.1;	#	9 Gain: 	repression_LEF1_by_YREG1 target: induction_gene_LEF1 actor: YREG1 type: repression
control_parameter_array[9,2] = 1.0;	#	9 Order: 	repression_LEF1_by_YREG1 target: induction_gene_LEF1 actor: YREG1 type: repression

# activation_vimentin_by_Active_LEF1: Active_LEF1 induction induction_gene_vimentin
control_parameter_array[10,1] = 0.1;	#	10 Gain: 	activation_vimentin_by_Active_LEF1 target: induction_gene_vimentin actor: Active_LEF1 type: induction
control_parameter_array[10,2] = 1.0;	#	10 Order: 	activation_vimentin_by_Active_LEF1 target: induction_gene_vimentin actor: Active_LEF1 type: induction

# activation_vimentin_by_AP1_SP1_P: AP1_SP1_P induction induction_gene_vimentin
control_parameter_array[11,1] = 0.1;	#	11 Gain: 	activation_vimentin_by_AP1_SP1_P target: induction_gene_vimentin actor: AP1_SP1_P type: induction
control_parameter_array[11,2] = 1.0;	#	11 Order: 	activation_vimentin_by_AP1_SP1_P target: induction_gene_vimentin actor: AP1_SP1_P type: induction

# activation_SNAIL_SLUG_by_AP1_SP1_P: AP1_SP1_P induction induction_gene_SNAIL_SLUG
control_parameter_array[12,1] = 0.1;	#	12 Gain: 	activation_SNAIL_SLUG_by_AP1_SP1_P target: induction_gene_SNAIL_SLUG actor: AP1_SP1_P type: induction
control_parameter_array[12,2] = 1.0;	#	12 Order: 	activation_SNAIL_SLUG_by_AP1_SP1_P target: induction_gene_SNAIL_SLUG actor: AP1_SP1_P type: induction

# activation_SNAIL_SLUG_by_ss_virus: ss_virus induction induction_gene_SNAIL_SLUG
control_parameter_array[13,1] = 0.1;	#	13 Gain: 	activation_SNAIL_SLUG_by_ss_virus target: induction_gene_SNAIL_SLUG actor: ss_virus type: induction
control_parameter_array[13,2] = 1.0;	#	13 Order: 	activation_SNAIL_SLUG_by_ss_virus target: induction_gene_SNAIL_SLUG actor: ss_virus type: induction


# Dilution selection array -
dilution_selection_array = ones(Int,NSPECIES)
dilution_selection_array[1] = 0.0;	#	gene_Smad
dilution_selection_array[2] = 0.0;	#	gene_Ecadherin
dilution_selection_array[3] = 0.0;	#	gene_Bcatenin
dilution_selection_array[4] = 0.0;	#	gene_PLCy
dilution_selection_array[5] = 0.0;	#	gene_PKC
dilution_selection_array[6] = 0.0;	#	gene_RAF
dilution_selection_array[7] = 0.0;	#	gene_RAS
dilution_selection_array[8] = 0.0;	#	gene_AP1_SP1
dilution_selection_array[9] = 0.0;	#	gene_tubulin
dilution_selection_array[10] = 0.0;	#	gene_SNAIL_SLUG
dilution_selection_array[11] = 0.0;	#	gene_Calcineurin
dilution_selection_array[12] = 0.0;	#	gene_GSK3_APC_AXIN
dilution_selection_array[13] = 0.0;	#	gene_PI3K
dilution_selection_array[69] = 0.0;	#	gene_TCF4
dilution_selection_array[70] = 0.0;	#	gene_TGFB3
dilution_selection_array[71] = 0.0;	#	gene_YREG1
dilution_selection_array[72] = 0.0;	#	gene_LEF1
dilution_selection_array[73] = 0.0;	#	gene_vimentin
dilution_selection_array[74] = 0.0;	#	gene_R
dilution_selection_array[75] = 0.0;	#	gene_VEGFR
dilution_selection_array[76] = 0.0;	#	gene_NFATc
dilution_selection_array[77] = 0.0;	#	gene_MAPK

# Set the maximum specific growth rate -
maximum_specific_growth_rate = 0.5;

# ---------------------------- DO NOT EDIT BELOW THIS LINE -------------------------- #
data_dictionary = Dict();
data_dictionary["STOICHIOMETRIC_MATRIX"] = S;
data_dictionary["RATE_CONSTANT_ARRAY"] = rate_constant_array;
data_dictionary["SATURATION_CONSTANT_ARRAY"] = saturation_constant_array;
data_dictionary["INITIAL_CONDITION_ARRAY"] = initial_condition_array;
data_dictionary["TIME_CONSTANT_ARRAY"] = time_constant_array;
data_dictionary["CONTROL_PARAMETER_ARRAY"] = control_parameter_array;
data_dictionary["MAXIMUM_SPECIFIC_GROWTH_RATE"] = maximum_specific_growth_rate;
data_dictionary["DILUTION_SELECTION_ARRAY"] = dilution_selection_array;
# ----------------------------------------------------------------------------------- #
return data_dictionary;
end
