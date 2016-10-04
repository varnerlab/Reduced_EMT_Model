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
# Generation timestamp: 08-08-2016 20:01:41
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
S = float(open(readdlm,"../Network.dat"));
(NSPECIES,NREACTIONS) = size(S);

# How many genes do we have in the model? -
number_of_genes = 23;

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
push!(initial_condition_array,1.0);	#	9	gene_GSK3
push!(initial_condition_array,1.0);	#	10	gene_tubulin
push!(initial_condition_array,1.0);	#	11	gene_SNAIL_SLUG
push!(initial_condition_array,1.0);	#	12	gene_Calcineurin
push!(initial_condition_array,1.0);	#	13	gene_APC_AXIN
push!(initial_condition_array,1.0);	#	14	gene_PI3K
push!(initial_condition_array,0.1);	#	15	mRNA_Smad
push!(initial_condition_array,0.1);	#	16	mRNA_Ecadherin
push!(initial_condition_array,0.1);	#	17	mRNA_Bcatenin
push!(initial_condition_array,0.1);	#	18	mRNA_PLCy
push!(initial_condition_array,0.1);	#	19	mRNA_PKC
push!(initial_condition_array,0.1);	#	20	mRNA_RAF
push!(initial_condition_array,0.1);	#	21	mRNA_RAS
push!(initial_condition_array,0.1);	#	22	mRNA_AP1_SP1
push!(initial_condition_array,0.1);	#	23	mRNA_Calcineurin
push!(initial_condition_array,0.0);	#	24	mRNA_SNAIL_SLUG
push!(initial_condition_array,0.1);	#	25	mRNA_tubulin
push!(initial_condition_array,0.1);	#	26	mRNA_APC_AXIN
push!(initial_condition_array,0.1);	#	27	mRNA_GSK3
push!(initial_condition_array,0.1);	#	28	mRNA_PI3K
push!(initial_condition_array,1.0);	#	29	PLCy
push!(initial_condition_array,0.0);	#	30	Active_PLCy
push!(initial_condition_array,1.0);	#	31	Calcineurin
push!(initial_condition_array,0.0);	#	32	Active_Calcineurin
push!(initial_condition_array,1.0);	#	33	NFATc
push!(initial_condition_array,0.0);	#	34	Active_NFATc
push!(initial_condition_array,1.0);	#	35	PKC
push!(initial_condition_array,0.0);	#	36	Active_PKC
push!(initial_condition_array,1.0);	#	37	RAF
push!(initial_condition_array,0.0);	#	38	RAF_P
push!(initial_condition_array,1.0);	#	39	Smad
push!(initial_condition_array,0.0);	#	40	pSmad
push!(initial_condition_array,1.0);	#	41	PI3K
push!(initial_condition_array,0.0);	#	42	PI3K_P
push!(initial_condition_array,1.0);	#	43	GSK3
push!(initial_condition_array,0.0);	#	44	GSK3_P
push!(initial_condition_array,1.0);	#	45	RAS
push!(initial_condition_array,0.0);	#	46	RAS_GTP
push!(initial_condition_array,1.0);	#	47	MAPK
push!(initial_condition_array,0.0);	#	48	pMAPK
push!(initial_condition_array,1.0);	#	49	AP1_SP1
push!(initial_condition_array,0.0);	#	50	AP1_SP1_P
push!(initial_condition_array,1.0);	#	51	Ecadherin
push!(initial_condition_array,1.0);	#	52	Bcatenin
push!(initial_condition_array,0.0);	#	53	Ecadherin_Bcatenin
push!(initial_condition_array,1.0);	#	54	APC_AXIN
push!(initial_condition_array,0.0);	#	55	APC_AXIN_Bcatenin
push!(initial_condition_array,1.0);	#	56	TCF4
push!(initial_condition_array,0.0);	#	57	Active_TCF4
push!(initial_condition_array,0.0);	#	58	LEF1
push!(initial_condition_array,0.0);	#	59	Active_LEF1
push!(initial_condition_array,100.0+10.0);	#	60	PPase
push!(initial_condition_array,1.0);	#	61	YREG1
push!(initial_condition_array,0.0);	#	62	SNAIL_SLUG
push!(initial_condition_array,0.0);	#	63	vimentin
push!(initial_condition_array,1.0);	#	64	tubulin
push!(initial_condition_array,270.0);	#	65	RNAP
push!(initial_condition_array,3599.9);	#	66	RIBOSOME
push!(initial_condition_array,0.0);	#	67	TGFB3_Ab
push!(initial_condition_array,0.0);	#	68	ss_virus
push!(initial_condition_array,0.0);	#	69	ecad_virus
push!(initial_condition_array,0.0);	#	70	U0126
push!(initial_condition_array,0.0);	#	71	vivit
push!(initial_condition_array,1.0);	#	72	gene_TCF4
push!(initial_condition_array,1.0);	#	73	gene_TGFB3
push!(initial_condition_array,1.0);	#	74	gene_YREG1
push!(initial_condition_array,1.0);	#	75	gene_LEF1
push!(initial_condition_array,1.0);	#	76	gene_vimentin
push!(initial_condition_array,1.0);	#	77	gene_R
push!(initial_condition_array,1.0);	#	78	gene_VEGFR
push!(initial_condition_array,1.0);	#	79	gene_NFATc
push!(initial_condition_array,1.0);	#	80	gene_MAPK
push!(initial_condition_array,0.1);	#	81	mRNA_TCF4
push!(initial_condition_array,0.0);	#	82	mRNA_TGFB3
push!(initial_condition_array,0.1);	#	83	mRNA_YREG1
push!(initial_condition_array,0.0);	#	84	mRNA_LEF1
push!(initial_condition_array,0.0);	#	85	mRNA_vimentin
push!(initial_condition_array,0.1);	#	86	mRNA_R
push!(initial_condition_array,0.1);	#	87	mRNA_VEGFR
push!(initial_condition_array,0.1);	#	88	mRNA_NFATc
push!(initial_condition_array,0.1);	#	89	mRNA_MAPK
push!(initial_condition_array,0.1);	#	90	R
push!(initial_condition_array,0.0);	#	91	TGFB12
push!(initial_condition_array,0.0);	#	92	TGFB3
push!(initial_condition_array,0.0);	#	93	VEGF
push!(initial_condition_array,0.1);	#	94	TGFB12_R
push!(initial_condition_array,0.1);	#	95	TGFB3_R
push!(initial_condition_array,0.1);	#	96	VEGFR
push!(initial_condition_array,0.0);	#	97	VEGF_VEGFR

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
push!(time_constant_array,1.0);	#	9	 time constant: gene_GSK3
push!(time_constant_array,1.0);	#	10	 time constant: gene_tubulin
push!(time_constant_array,1.0);	#	11	 time constant: gene_SNAIL_SLUG
push!(time_constant_array,1.0);	#	12	 time constant: gene_Calcineurin
push!(time_constant_array,1.0);	#	13	 time constant: gene_APC_AXIN
push!(time_constant_array,1.0);	#	14	 time constant: gene_PI3K
push!(time_constant_array,0.1);	#	15	 time constant: mRNA_Smad
push!(time_constant_array,0.1);	#	16	 time constant: mRNA_Ecadherin
push!(time_constant_array,0.1);	#	17	 time constant: mRNA_Bcatenin
push!(time_constant_array,0.1);	#	18	 time constant: mRNA_PLCy
push!(time_constant_array,0.1);	#	19	 time constant: mRNA_PKC
push!(time_constant_array,0.1);	#	20	 time constant: mRNA_RAF
push!(time_constant_array,0.1);	#	21	 time constant: mRNA_RAS
push!(time_constant_array,0.1);	#	22	 time constant: mRNA_AP1_SP1
push!(time_constant_array,0.1);	#	23	 time constant: mRNA_Calcineurin
push!(time_constant_array,0.1);	#	24	 time constant: mRNA_SNAIL_SLUG
push!(time_constant_array,0.1);	#	25	 time constant: mRNA_tubulin
push!(time_constant_array,0.1);	#	26	 time constant: mRNA_APC_AXIN
push!(time_constant_array,0.1);	#	27	 time constant: mRNA_GSK3
push!(time_constant_array,0.1);	#	28	 time constant: mRNA_PI3K
push!(time_constant_array,1.0);	#	29	 time constant: PLCy
push!(time_constant_array,1.0);	#	30	 time constant: Active_PLCy
push!(time_constant_array,1.0);	#	31	 time constant: Calcineurin
push!(time_constant_array,1.0);	#	32	 time constant: Active_Calcineurin
push!(time_constant_array,1.0);	#	33	 time constant: NFATc
push!(time_constant_array,1.0);	#	34	 time constant: Active_NFATc
push!(time_constant_array,1.0);	#	35	 time constant: PKC
push!(time_constant_array,1.0);	#	36	 time constant: Active_PKC
push!(time_constant_array,1.0);	#	37	 time constant: RAF
push!(time_constant_array,1.0);	#	38	 time constant: RAF_P
push!(time_constant_array,1.0);	#	39	 time constant: Smad
push!(time_constant_array,1.0);	#	40	 time constant: pSmad
push!(time_constant_array,1.0);	#	41	 time constant: PI3K
push!(time_constant_array,1.0);	#	42	 time constant: PI3K_P
push!(time_constant_array,1.0);	#	43	 time constant: GSK3
push!(time_constant_array,1.0);	#	44	 time constant: GSK3_P
push!(time_constant_array,1.0);	#	45	 time constant: RAS
push!(time_constant_array,1.0);	#	46	 time constant: RAS_GTP
push!(time_constant_array,1.0);	#	47	 time constant: MAPK
push!(time_constant_array,1.0);	#	48	 time constant: pMAPK
push!(time_constant_array,1.0);	#	49	 time constant: AP1_SP1
push!(time_constant_array,1.0);	#	50	 time constant: AP1_SP1_P
push!(time_constant_array,1.0);	#	51	 time constant: Ecadherin
push!(time_constant_array,1.0);	#	52	 time constant: Bcatenin
push!(time_constant_array,1.0);	#	53	 time constant: Ecadherin_Bcatenin
push!(time_constant_array,1.0);	#	54	 time constant: APC_AXIN
push!(time_constant_array,1.0);	#	55	 time constant: APC_AXIN_Bcatenin
push!(time_constant_array,1.0);	#	56	 time constant: TCF4
push!(time_constant_array,1.0);	#	57	 time constant: Active_TCF4
push!(time_constant_array,1.0);	#	58	 time constant: LEF1
push!(time_constant_array,1.0);	#	59	 time constant: Active_LEF1
push!(time_constant_array,1.0);	#	60	 time constant: PPase
push!(time_constant_array,1.0);	#	61	 time constant: YREG1
push!(time_constant_array,1.0);	#	62	 time constant: SNAIL_SLUG
push!(time_constant_array,1.0);	#	63	 time constant: vimentin
push!(time_constant_array,1.0);	#	64	 time constant: tubulin
push!(time_constant_array,1.0);	#	65	 time constant: RNAP
push!(time_constant_array,1.0);	#	66	 time constant: RIBOSOME
push!(time_constant_array,1.0);	#	67	 time constant: TGFB3_Ab
push!(time_constant_array,1.0);	#	68	 time constant: ss_virus
push!(time_constant_array,1.0);	#	69	 time constant: ecad_virus
push!(time_constant_array,1.0);	#	70	 time constant: U0126
push!(time_constant_array,1.0);	#	71	 time constant: vivit
push!(time_constant_array,1.0);	#	72	 time constant: gene_TCF4
push!(time_constant_array,1.0);	#	73	 time constant: gene_TGFB3
push!(time_constant_array,1.0);	#	74	 time constant: gene_YREG1
push!(time_constant_array,1.0);	#	75	 time constant: gene_LEF1
push!(time_constant_array,1.0);	#	76	 time constant: gene_vimentin
push!(time_constant_array,1.0);	#	77	 time constant: gene_R
push!(time_constant_array,1.0);	#	78	 time constant: gene_VEGFR
push!(time_constant_array,1.0);	#	79	 time constant: gene_NFATc
push!(time_constant_array,1.0);	#	80	 time constant: gene_MAPK
push!(time_constant_array,0.1);	#	81	 time constant: mRNA_TCF4
push!(time_constant_array,0.1);	#	82	 time constant: mRNA_TGFB3
push!(time_constant_array,0.1);	#	83	 time constant: mRNA_YREG1
push!(time_constant_array,0.1);	#	84	 time constant: mRNA_LEF1
push!(time_constant_array,0.1);	#	85	 time constant: mRNA_vimentin
push!(time_constant_array,0.1);	#	86	 time constant: mRNA_R
push!(time_constant_array,0.1);	#	87	 time constant: mRNA_VEGFR
push!(time_constant_array,0.1);	#	88	 time constant: mRNA_NFATc
push!(time_constant_array,0.1);	#	89	 time constant: mRNA_MAPK
push!(time_constant_array,1.0);	#	90	 time constant: R
push!(time_constant_array,1.0);	#	91	 time constant: TGFB12
push!(time_constant_array,1.0);	#	92	 time constant: TGFB3
push!(time_constant_array,1.0);	#	93	 time constant: VEGF
push!(time_constant_array,1.0);	#	94	 time constant: TGFB12_R
push!(time_constant_array,1.0);	#	95	 time constant: TGFB3_R
push!(time_constant_array,1.0);	#	96	 time constant: VEGFR
push!(time_constant_array,1.0);	#	97	 time constant: VEGF_VEGFR

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
push!(rate_constant_array,1.0);	# 15	PI3K_phosphorylation_GSK3: GSK3 =(PI3K_P)=> GSK3_P
push!(rate_constant_array,1.0);	# 16	TGFB12_R_activation_RAS: RAS =(TGFB12_R)=> RAS_GTP
push!(rate_constant_array,1.0);	# 17	RAS_GTP_phosphorylation_RAF: RAF =(RAS_GTP)=> RAF_P
push!(rate_constant_array,1.0);	# 18	RAF_P_phosphorylation_MAPK: MAPK =(RAF_P)=> pMAPK
push!(rate_constant_array,1.0);	# 19	MAPK_phosphorylation_Smad: Smad =(pMAPK)=> pSmad
push!(rate_constant_array,1.0);	# 20	MAPK_phosphorylation_AP1_SP1: AP1_SP1 =(pMAPK)=> AP1_SP1_P
push!(rate_constant_array,1.0);	# 21	Binding_Ecadherin_Bcatenin: Ecadherin+Bcatenin =([])=> Ecadherin_Bcatenin
push!(rate_constant_array,1.0);	# 22	Binding_Ecadherin_Bcatenin: Ecadherin_Bcatenin =([])=> Ecadherin+Bcatenin (reverse)
push!(rate_constant_array,1.0);	# 23	Binding_APC_AXIN_forw: APC_AXIN+Bcatenin =([])=> APC_AXIN_Bcatenin
push!(rate_constant_array,1.0);	# 24	Binding_APC_AXIN_revs: APC_AXIN_Bcatenin =([])=> APC_AXIN+Bcatenin
push!(rate_constant_array,1.0);	# 25	TCF4_Bcatenin_complex_formation: TCF4+Bcatenin =([])=> Active_TCF4
push!(rate_constant_array,1.0);	# 26	TCF4_Bcatenin_complex_formation: Active_TCF4 =([])=> TCF4+Bcatenin (reverse)
push!(rate_constant_array,1.0);	# 27	LEF1_Bcatenin_complex_formation: LEF1+Bcatenin =([])=> Active_LEF1
push!(rate_constant_array,1.0);	# 28	LEF1_Bcatenin_complex_formation: Active_LEF1 =([])=> LEF1+Bcatenin (reverse)
push!(rate_constant_array,0.9);	# 29	deactivation_pSmad: pSmad =(PPase)=> Smad
push!(rate_constant_array,1.0);	# 30	deactivation_RAF_P: RAF_P =(PPase)=> RAF
push!(rate_constant_array,1.0);	# 31	deactivation_RAS_GTP: RAS_GTP =([])=> RAS
push!(rate_constant_array,1.0);	# 32	deactivation_pMAPK: pMAPK =(PPase)=> MAPK
push!(rate_constant_array,1.0);	# 33	deactivation_AP1_SP1: AP1_SP1_P =(PPase)=> AP1_SP1
push!(rate_constant_array,25.0);	# 34	deactivation_Active_PLCy: Active_PLCy =([])=> PLCy
push!(rate_constant_array,1.0);	# 35	deactivation_Active_PKC: Active_PKC =([])=> PKC
push!(rate_constant_array,100.0);	# 36	deactivation_Active_Calcineurin: Active_Calcineurin =([])=> Calcineurin
push!(rate_constant_array,100.0);	# 37	deactivation_Active_NFATc: Active_NFATc =([])=> NFATc
push!(rate_constant_array,1.0);	# 38	deactivation_GSK3_P: GSK3_P =(PPase)=> GSK3
push!(rate_constant_array,0.1);	# 39	degradation_TGFB12_R: TGFB12_R =([])=> []
push!(rate_constant_array,0.1);	# 40	degradation_TGFB3_R: TGFB3_R =([])=> []
push!(rate_constant_array,0.1);	# 41	degradation_TGFB3: TGFB3 =([])=> []
push!(rate_constant_array,0.1);	# 42	VEGF_VEGFR_degradation: VEGF_VEGFR =([])=> []
push!(rate_constant_array,0.1);	# 43	Bcatenin_degradation: Bcatenin =([])=> []
push!(rate_constant_array,0.1);	# 44	Ecadherin_degrdation: Ecadherin =([])=> []
push!(rate_constant_array,0.1);	# 45	Smad_degradation: Smad =([])=> []
push!(rate_constant_array,0.1);	# 46	TCF4_degradation: TCF4 =([])=> []
push!(rate_constant_array,0.1);	# 47	Active_TCF4_degradation: Active_TCF4 =([])=> []
push!(rate_constant_array,0.1);	# 48	YREG1_degradation: YREG1 =([])=> []
push!(rate_constant_array,0.1);	# 49	SNAIL_SLUG_degradation: SNAIL_SLUG =([])=> []
push!(rate_constant_array,0.1);	# 50	LEF1_degradation: LEF1 =([])=> []
push!(rate_constant_array,0.1);	# 51	Active_LEF1_degradation: Active_LEF1 =([])=> []
push!(rate_constant_array,0.1);	# 52	vimentin_degradation: vimentin =([])=> []
push!(rate_constant_array,0.1);	# 53	VEGFR_degradation: VEGFR =([])=> []
push!(rate_constant_array,0.1);	# 54	NFATc_degradation: NFATc =([])=> []
push!(rate_constant_array,0.1);	# 55	Active_NFATc_degradation: Active_NFATc =([])=> []
push!(rate_constant_array,0.1);	# 56	degradation_MAPK: MAPK =([])=> []
push!(rate_constant_array,0.1);	# 57	degradation_R: R =([])=> []
push!(rate_constant_array,0.1);	# 58	Ecadherin_Bcatenin_degradation: Ecadherin_Bcatenin =([])=> []
push!(rate_constant_array,0.1);	# 59	AP1_SP1_degradation: AP1_SP1 =([])=> []
push!(rate_constant_array,0.1);	# 60	AP1_SP1_P_degradation: AP1_SP1_P =([])=> []
push!(rate_constant_array,0.1);	# 61	RAS_degradation: RAS =([])=> []
push!(rate_constant_array,0.1);	# 62	RAF_degradation: RAF =([])=> []
push!(rate_constant_array,0.1);	# 63	RAS_GTP_degradation: RAS_GTP =([])=> []
push!(rate_constant_array,0.1);	# 64	RAF_P_degradation: RAF_P =([])=> []
push!(rate_constant_array,0.1);	# 65	pMAPK_degradation: pMAPK =([])=> []
push!(rate_constant_array,0.1);	# 66	pSmad_degradation: pSmad =([])=> []
push!(rate_constant_array,0.1);	# 67	PLCy_degradation: PLCy =([])=> []
push!(rate_constant_array,0.1);	# 68	Active_PLCy_degradation: Active_PLCy =([])=> []
push!(rate_constant_array,0.1);	# 69	PKC_degradation: PKC =([])=> []
push!(rate_constant_array,0.1);	# 70	Active_PKC_degradation: Active_PKC =([])=> []
push!(rate_constant_array,0.1);	# 71	Calcineurin_degradation: Calcineurin =([])=> []
push!(rate_constant_array,0.1);	# 72	Active_Calcineurin_degradation: Active_Calcineurin =([])=> []
push!(rate_constant_array,0.1);	# 73	degradation_APC_AXIN: APC_AXIN =([])=> []
push!(rate_constant_array,0.1);	# 74	degradation_GSK3_P: GSK3_P =([])=> []
push!(rate_constant_array,0.1);	# 75	degradation_GSK3: GSK3 =([])=> []
push!(rate_constant_array,0.1);	# 76	degradation_PI3K: PI3K =([])=> []
push!(rate_constant_array,0.1);	# 77	degradation_APC_AXIN_Bcatenin: APC_AXIN_Bcatenin =([])=> []
push!(rate_constant_array,0.1);	# 78	tubulin_degradation: tubulin =([])=> []
push!(rate_constant_array,0.1);	# 79	generation_RNAP: RNAP =([])=> []
push!(rate_constant_array,1.0);	# 80	generation_RNAP: [] =([])=> RNAP (reverse)
push!(rate_constant_array,0.1);	# 81	generation_RIBOSOME: RIBOSOME =([])=> []
push!(rate_constant_array,1.0);	# 82	generation_RIBOSOME: [] =([])=> RIBOSOME (reverse)
push!(rate_constant_array,0.1);	# 83	generation_PPase: PPase =([])=> []
push!(rate_constant_array,1.0);	# 84	generation_PPase: [] =([])=> PPase (reverse)
push!(rate_constant_array,0.1);	# 85	addition_TGFB3_Ab: TGFB3_Ab =([])=> []
push!(rate_constant_array,1.0);	# 86	addition_TGFB3_Ab: [] =([])=> TGFB3_Ab (reverse)
push!(rate_constant_array,0.1);	# 87	addition_ss_virus: ss_virus =([])=> []
push!(rate_constant_array,1.0);	# 88	addition_ss_virus: [] =([])=> ss_virus (reverse)
push!(rate_constant_array,0.1);	# 89	addition_ecad_virus: ecad_virus =([])=> []
push!(rate_constant_array,1.0);	# 90	addition_ecad_virus: [] =([])=> ecad_virus (reverse)
push!(rate_constant_array,1.0);	# 91	addition_TGFb12: [] =([])=> TGFB12
push!(rate_constant_array,0.1);	# 92	addition_TGFb12: TGFB12 =([])=> [] (reverse)
push!(rate_constant_array,1.0);	# 93	addition_VEGF: [] =([])=> VEGF
push!(rate_constant_array,0.1);	# 94	addition_VEGF: VEGF =([])=> [] (reverse)
push!(rate_constant_array,1.0);	# 95	addition_TGFB3: [] =([])=> TGFB3
push!(rate_constant_array,0.1);	# 96	addition_TGFB3: TGFB3 =([])=> [] (reverse)
push!(rate_constant_array,0.1);	# 97	addition_U0126: U0126 =([])=> []
push!(rate_constant_array,1.0);	# 98	addition_U0126: [] =([])=> U0126 (reverse)
push!(rate_constant_array,0.1);	# 99	addition_vivit: vivit =([])=> []
push!(rate_constant_array,1.0);	# 100	addition_vivit: [] =([])=> vivit (reverse)
push!(rate_constant_array,0.1);	# 101	degradation_mRNA_Smad: mRNA_Smad = []
push!(rate_constant_array,0.1);	# 102	degradation_mRNA_Ecadherin: mRNA_Ecadherin = []
push!(rate_constant_array,0.1);	# 103	degradation_mRNA_Bcatenin: mRNA_Bcatenin = []
push!(rate_constant_array,0.1);	# 104	degradation_mRNA_TCF4: mRNA_TCF4 = []
push!(rate_constant_array,0.1);	# 105	degradation_mRNA_TGFB3: mRNA_TGFB3 = []
push!(rate_constant_array,0.1);	# 106	degradation_mRNA_YREG1: mRNA_YREG1 = []
push!(rate_constant_array,0.1);	# 107	degradation_mRNA_LEF1: mRNA_LEF1 = []
push!(rate_constant_array,0.1);	# 108	degradation_mRNA_vimentin: mRNA_vimentin = []
push!(rate_constant_array,0.1);	# 109	degradation_mRNA_VEGFR: mRNA_VEGFR = []
push!(rate_constant_array,0.1);	# 110	degradation_mRNA_NFATc: mRNA_NFATc = []
push!(rate_constant_array,0.1);	# 111	degradation_mRNA_MAPK: mRNA_MAPK = []
push!(rate_constant_array,0.1);	# 112	degradation_mRNA_R: mRNA_R = []
push!(rate_constant_array,0.1);	# 113	degradation_mRNA_PLCy: mRNA_PLCy = []
push!(rate_constant_array,0.1);	# 114	degradation_mRNA_PKC: mRNA_PKC = []
push!(rate_constant_array,0.1);	# 115	degradation_mRNA_RAF: mRNA_RAF = []
push!(rate_constant_array,0.1);	# 116	degradation_mRNA_RAS: mRNA_RAS = []
push!(rate_constant_array,0.1);	# 117	degradation_mRNA_AP1_SP1: mRNA_AP1_SP1 = []
push!(rate_constant_array,0.1);	# 118	degradation_mRNA_Calcineurin: mRNA_Calcineurin = []
push!(rate_constant_array,0.1);	# 119	degradation_mRNA_SNAIL_SLUG: mRNA_SNAIL_SLUG = []
push!(rate_constant_array,0.1);	# 120	degradation_mRNA_tubulin: mRNA_tubulin = []
push!(rate_constant_array,0.1);	# 121	degradation_mRNA_APC_AXIN: mRNA_APC_AXIN = []
push!(rate_constant_array,0.1);	# 122	degradation_mRNA_GSK3: mRNA_GSK3 = []
push!(rate_constant_array,0.1);	# 123	degradation_mRNA_PI3K: mRNA_PI3K = []
push!(rate_constant_array,1.0);	# 124	induction_gene_Smad: gene_Smad = mRNA_Smad
push!(rate_constant_array,1.0);	# 125	induction_gene_Ecadherin: gene_Ecadherin = mRNA_Ecadherin
push!(rate_constant_array,1.0);	# 126	induction_gene_Bcatenin: gene_Bcatenin = mRNA_Bcatenin
push!(rate_constant_array,1.0);	# 127	induction_gene_TCF4: gene_TCF4 = mRNA_TCF4
push!(rate_constant_array,1.0);	# 128	induction_gene_TGFB3: gene_TGFB3 = mRNA_TGFB3
push!(rate_constant_array,1.0);	# 129	induction_gene_YREG1: gene_YREG1 = mRNA_YREG1
push!(rate_constant_array,1.0);	# 130	induction_gene_LEF1: gene_LEF1 = mRNA_LEF1
push!(rate_constant_array,1.0);	# 131	induction_gene_R: gene_R = mRNA_R
push!(rate_constant_array,1.0);	# 132	induction_gene_vimentin: gene_vimentin = mRNA_vimentin
push!(rate_constant_array,1.0);	# 133	induction_gene_VEGFR: gene_VEGFR = mRNA_VEGFR
push!(rate_constant_array,1.0);	# 134	induction_gene_NFATc: gene_NFATc = mRNA_NFATc
push!(rate_constant_array,1.0);	# 135	induction_gene_PLCy: gene_PLCy = mRNA_PLCy
push!(rate_constant_array,1.0);	# 136	induction_gene_PKC: gene_PKC = mRNA_PKC
push!(rate_constant_array,1.0);	# 137	induction_gene_RAF: gene_RAF = mRNA_RAF
push!(rate_constant_array,1.0);	# 138	induction_gene_RAS: gene_RAS = mRNA_RAS
push!(rate_constant_array,1.0);	# 139	induction_gene_MAPK: gene_MAPK = mRNA_MAPK
push!(rate_constant_array,1.0);	# 140	induction_gene_AP1_SP1: gene_AP1_SP1 = mRNA_AP1_SP1
push!(rate_constant_array,1.0);	# 141	induction_gene_GSK3: gene_GSK3 = mRNA_GSK3
push!(rate_constant_array,1.0);	# 142	induction_gene_tubulin: gene_tubulin = mRNA_tubulin
push!(rate_constant_array,1.0);	# 143	induction_gene_SNAIL_SLUG: gene_SNAIL_SLUG = mRNA_SNAIL_SLUG
push!(rate_constant_array,1.0);	# 144	induction_gene_Calcineurin: gene_Calcineurin = mRNA_Calcineurin
push!(rate_constant_array,1.0);	# 145	induction_gene_APC_AXIN: gene_APC_AXIN = mRNA_APC_AXIN
push!(rate_constant_array,1.0);	# 146	induction_gene_PI3K: gene_PI3K = mRNA_PI3K
push!(rate_constant_array,1.0);	# 147	translation_mRNA_Smad: mRNA_Smad = Smad
push!(rate_constant_array,1.0);	# 148	translation_mRNA_Ecadherin: mRNA_Ecadherin = Ecadherin
push!(rate_constant_array,1.0);	# 149	translation_mRNA_Bcatenin: mRNA_Bcatenin = Bcatenin
push!(rate_constant_array,1.0);	# 150	translation_mRNA_TCF4: mRNA_TCF4 = TCF4
push!(rate_constant_array,1.0);	# 151	translation_mRNA_TGFB3: mRNA_TGFB3 = TGFB3
push!(rate_constant_array,1.0);	# 152	translation_mRNA_YREG1: mRNA_YREG1 = YREG1
push!(rate_constant_array,1.0);	# 153	translation_mRNA_LEF1: mRNA_LEF1 = LEF1
push!(rate_constant_array,1.0);	# 154	translation_mRNA_vimentin: mRNA_vimentin = vimentin
push!(rate_constant_array,1.0);	# 155	translation_mRNA_VEGFR: mRNA_VEGFR = VEGFR
push!(rate_constant_array,1.0);	# 156	translation_mRNA_NFATc: mRNA_NFATc = NFATc
push!(rate_constant_array,1.0);	# 157	translation_mRNA_MAPK: mRNA_MAPK = MAPK
push!(rate_constant_array,1.0);	# 158	translation_mRNA_R: mRNA_R = R
push!(rate_constant_array,1.0);	# 159	translation_mRNA_PLCy: mRNA_PLCy = PLCy
push!(rate_constant_array,1.0);	# 160	translation_mRNA_PKC: mRNA_PKC = PKC
push!(rate_constant_array,1.0);	# 161	translation_mRNA_RAF: mRNA_RAF = RAF
push!(rate_constant_array,1.0);	# 162	translation_mRNA_RAS: mRNA_RAS = RAS
push!(rate_constant_array,1.0);	# 163	translation_mRNA_AP1_SP1: mRNA_AP1_SP1 = AP1_SP1
push!(rate_constant_array,1.0);	# 164	translation_mRNA_Calcineurin: mRNA_Calcineurin = Calcineurin
push!(rate_constant_array,1.0);	# 165	translation_mRNA_SNAIL_SLUG: mRNA_SNAIL_SLUG = SNAIL_SLUG
push!(rate_constant_array,1.0);	# 166	translation_mRNA_tubulin: mRNA_tubulin = tubulin
push!(rate_constant_array,1.0);	# 167	translation_mRNA_APC_AXIN: mRNA_APC_AXIN = APC_AXIN
push!(rate_constant_array,1.0);	# 168	translation_mRNA_GSK3: mRNA_GSK3 = GSK3
push!(rate_constant_array,1.0);	# 169	translation_mRNA_PI3K: mRNA_PI3K = PI3K

# Formulate the saturation constant array -
saturation_constant_array = zeros(NREACTIONS,NSPECIES);
saturation_constant_array[1,91] = 1.0;	# TGFB12_binding: TGFB12+R =([])=> TGFB12_R	 species: TGFB12
saturation_constant_array[1,90] = 1.0;	# TGFB12_binding: TGFB12+R =([])=> TGFB12_R	 species: R
saturation_constant_array[2,94] = 1.0;	# TGFB12_binding: TGFB12_R =([])=> TGFB12+R (reverse)	 species: TGFB12_R
saturation_constant_array[3,92] = 1.0;	# TGFB3_binding: TGFB3+R =([])=> TGFB3_R	 species: TGFB3
saturation_constant_array[3,90] = 1.0;	# TGFB3_binding: TGFB3+R =([])=> TGFB3_R	 species: R
saturation_constant_array[4,95] = 1.0;	# TGFB3_binding: TGFB3_R =([])=> TGFB3+R (reverse)	 species: TGFB3_R
saturation_constant_array[5,93] = 1.0;	# VEGF_binding: VEGF+VEGFR =([])=> VEGF_VEGFR	 species: VEGF
saturation_constant_array[5,96] = 1.0;	# VEGF_binding: VEGF+VEGFR =([])=> VEGF_VEGFR	 species: VEGFR
saturation_constant_array[6,97] = 1.0;	# VEGF_binding: VEGF_VEGFR =([])=> VEGF+VEGFR (reverse)	 species: VEGF_VEGFR
saturation_constant_array[7,29] = 1.0;	# VEGF_VEGFR_PLCy: PLCy =(VEGF_VEGFR)=> Active_PLCy	 species: PLCy
saturation_constant_array[8,31] = 1.0;	# PLCy_activation_Calcineurin: Calcineurin =(Active_PLCy)=> Active_Calcineurin	 species: Calcineurin
saturation_constant_array[9,33] = 1.0;	# Calcineurin_activation_NFATc: NFATc =(Active_Calcineurin)=> Active_NFATc	 species: NFATc
saturation_constant_array[10,35] = 1.0;	# PLCy_activatation_PKC: PKC =(Active_PLCy)=> Active_PKC	 species: PKC
saturation_constant_array[11,37] = 1.0;	# PKC_activation_RAF: RAF =(Active_PKC)=> RAF_P	 species: RAF
saturation_constant_array[12,39] = 1.0;	# TGFB12_R_phosphorylation_Smad: Smad =(TGFB12_R)=> pSmad	 species: Smad
saturation_constant_array[13,39] = 1.0;	# TGFB3_R_phosphorylation_Smad: Smad =(TGFB3_R)=> pSmad	 species: Smad
saturation_constant_array[14,41] = 1.0;	# TGFB3_R_phosphorylation_PI3K: PI3K =(TGFB3_R)=> PI3K_P	 species: PI3K
saturation_constant_array[15,43] = 1.0;	# PI3K_phosphorylation_GSK3: GSK3 =(PI3K_P)=> GSK3_P	 species: GSK3
saturation_constant_array[16,45] = 1.0;	# TGFB12_R_activation_RAS: RAS =(TGFB12_R)=> RAS_GTP	 species: RAS
saturation_constant_array[17,37] = 1.0;	# RAS_GTP_phosphorylation_RAF: RAF =(RAS_GTP)=> RAF_P	 species: RAF
saturation_constant_array[18,47] = 1.0;	# RAF_P_phosphorylation_MAPK: MAPK =(RAF_P)=> pMAPK	 species: MAPK
saturation_constant_array[19,39] = 1.0;	# MAPK_phosphorylation_Smad: Smad =(pMAPK)=> pSmad	 species: Smad
saturation_constant_array[20,49] = 1.0;	# MAPK_phosphorylation_AP1_SP1: AP1_SP1 =(pMAPK)=> AP1_SP1_P	 species: AP1_SP1
saturation_constant_array[21,51] = 2.0;	# Binding_Ecadherin_Bcatenin: Ecadherin+Bcatenin =([])=> Ecadherin_Bcatenin	 species: Ecadherin
saturation_constant_array[21,52] = 0.5;	# Binding_Ecadherin_Bcatenin: Ecadherin+Bcatenin =([])=> Ecadherin_Bcatenin	 species: Bcatenin
saturation_constant_array[22,53] = 1.0;	# Binding_Ecadherin_Bcatenin: Ecadherin_Bcatenin =([])=> Ecadherin+Bcatenin (reverse)	 species: Ecadherin_Bcatenin
saturation_constant_array[23,54] = 1.0;	# Binding_APC_AXIN_forw: APC_AXIN+Bcatenin =([])=> APC_AXIN_Bcatenin	 species: APC_AXIN
saturation_constant_array[23,52] = 1.0;	# Binding_APC_AXIN_forw: APC_AXIN+Bcatenin =([])=> APC_AXIN_Bcatenin	 species: Bcatenin
saturation_constant_array[24,55] = 1.0;	# Binding_APC_AXIN_revs: APC_AXIN_Bcatenin =([])=> APC_AXIN+Bcatenin	 species: APC_AXIN_Bcatenin
saturation_constant_array[25,56] = 1.0;	# TCF4_Bcatenin_complex_formation: TCF4+Bcatenin =([])=> Active_TCF4	 species: TCF4
saturation_constant_array[25,52] = 1.0;	# TCF4_Bcatenin_complex_formation: TCF4+Bcatenin =([])=> Active_TCF4	 species: Bcatenin
saturation_constant_array[26,57] = 1.0;	# TCF4_Bcatenin_complex_formation: Active_TCF4 =([])=> TCF4+Bcatenin (reverse)	 species: Active_TCF4
saturation_constant_array[27,58] = 1.0;	# LEF1_Bcatenin_complex_formation: LEF1+Bcatenin =([])=> Active_LEF1	 species: LEF1
saturation_constant_array[27,52] = 1.0;	# LEF1_Bcatenin_complex_formation: LEF1+Bcatenin =([])=> Active_LEF1	 species: Bcatenin
saturation_constant_array[28,59] = 1.0;	# LEF1_Bcatenin_complex_formation: Active_LEF1 =([])=> LEF1+Bcatenin (reverse)	 species: Active_LEF1
saturation_constant_array[29,40] = 1.0;	# deactivation_pSmad: pSmad =(PPase)=> Smad	 species: pSmad
saturation_constant_array[30,38] = 1.0;	# deactivation_RAF_P: RAF_P =(PPase)=> RAF	 species: RAF_P
saturation_constant_array[31,46] = 1.0;	# deactivation_RAS_GTP: RAS_GTP =([])=> RAS	 species: RAS_GTP
saturation_constant_array[32,48] = 1.0;	# deactivation_pMAPK: pMAPK =(PPase)=> MAPK	 species: pMAPK
saturation_constant_array[33,50] = 1.0;	# deactivation_AP1_SP1: AP1_SP1_P =(PPase)=> AP1_SP1	 species: AP1_SP1_P
saturation_constant_array[34,30] = 1.0;	# deactivation_Active_PLCy: Active_PLCy =([])=> PLCy	 species: Active_PLCy
saturation_constant_array[35,36] = 1.0;	# deactivation_Active_PKC: Active_PKC =([])=> PKC	 species: Active_PKC
saturation_constant_array[36,32] = 1.0;	# deactivation_Active_Calcineurin: Active_Calcineurin =([])=> Calcineurin	 species: Active_Calcineurin
saturation_constant_array[37,34] = 1.0;	# deactivation_Active_NFATc: Active_NFATc =([])=> NFATc	 species: Active_NFATc
saturation_constant_array[38,44] = 1.0;	# deactivation_GSK3_P: GSK3_P =(PPase)=> GSK3	 species: GSK3_P

# Formulate control parameter array -
control_parameter_array = zeros(20,2);
# TGFB3_inhibition: TGFB3_Ab inhibition; TGFB3_binding
control_parameter_array[1,1] = 0.1;	#	1 Gain: 	TGFB3_inhibition target: TGFB3_binding actor: TGFB3_Ab type: inhibition
control_parameter_array[1,2] = 1.0;	#	1 Order: 	TGFB3_inhibition target: TGFB3_binding actor: TGFB3_Ab type: inhibition

# NFATc_inhibition: vivit inhibition; Calcineurin_activation_NFATc
control_parameter_array[2,1] = 0.1;	#	2 Gain: 	NFATc_inhibition target: Calcineurin_activation_NFATc actor: vivit type: inhibition
control_parameter_array[2,2] = 1.0;	#	2 Order: 	NFATc_inhibition target: Calcineurin_activation_NFATc actor: vivit type: inhibition

# GSK3_P_inhibition_Binding_APC_AXIN_forw: GSK3_P inhibition; Binding_APC_AXIN_forw
control_parameter_array[3,1] = 0.1;	#	3 Gain: 	GSK3_P_inhibition_Binding_APC_AXIN_forw target: Binding_APC_AXIN_forw actor: GSK3_P type: inhibition
control_parameter_array[3,2] = 1.0;	#	3 Order: 	GSK3_P_inhibition_Binding_APC_AXIN_forw target: Binding_APC_AXIN_forw actor: GSK3_P type: inhibition

# Active_TCF4_inhibition_Ecad: Ecadherin_Bcatenin inhibition; TCF4_Bcatenin_complex_formation
control_parameter_array[4,1] = 0.1;	#	4 Gain: 	Active_TCF4_inhibition_Ecad target: TCF4_Bcatenin_complex_formation actor: Ecadherin_Bcatenin type: inhibition
control_parameter_array[4,2] = 1.0;	#	4 Order: 	Active_TCF4_inhibition_Ecad target: TCF4_Bcatenin_complex_formation actor: Ecadherin_Bcatenin type: inhibition

# Active_TCF4_inhibition_APC: APC_AXIN_Bcatenin inhibition; TCF4_Bcatenin_complex_formation
control_parameter_array[5,1] = 0.1;	#	5 Gain: 	Active_TCF4_inhibition_APC target: TCF4_Bcatenin_complex_formation actor: APC_AXIN_Bcatenin type: inhibition
control_parameter_array[5,2] = 1.0;	#	5 Order: 	Active_TCF4_inhibition_APC target: TCF4_Bcatenin_complex_formation actor: APC_AXIN_Bcatenin type: inhibition

# activation_Ecadherin_by_Active_NFATc: Active_NFATc induction induction_gene_Ecadherin
control_parameter_array[6,1] = 0.1;	#	6 Gain: 	activation_Ecadherin_by_Active_NFATc target: induction_gene_Ecadherin actor: Active_NFATc type: induction
control_parameter_array[6,2] = 1.0;	#	6 Order: 	activation_Ecadherin_by_Active_NFATc target: induction_gene_Ecadherin actor: Active_NFATc type: induction

# repression_Ecadherin_by_pSmad: pSmad repression induction_gene_Ecadherin
control_parameter_array[7,1] = 0.1;	#	7 Gain: 	repression_Ecadherin_by_pSmad target: induction_gene_Ecadherin actor: pSmad type: repression
control_parameter_array[7,2] = 1.0;	#	7 Order: 	repression_Ecadherin_by_pSmad target: induction_gene_Ecadherin actor: pSmad type: repression

# repression_Ecadherin_by_SNAIL_SLUG: SNAIL_SLUG repression induction_gene_Ecadherin
control_parameter_array[8,1] = 0.1;	#	8 Gain: 	repression_Ecadherin_by_SNAIL_SLUG target: induction_gene_Ecadherin actor: SNAIL_SLUG type: repression
control_parameter_array[8,2] = 1.0;	#	8 Order: 	repression_Ecadherin_by_SNAIL_SLUG target: induction_gene_Ecadherin actor: SNAIL_SLUG type: repression

# repression_Ecadherin_by_Active_LEF1: Active_LEF1 repression induction_gene_Ecadherin
control_parameter_array[9,1] = 0.1;	#	9 Gain: 	repression_Ecadherin_by_Active_LEF1 target: induction_gene_Ecadherin actor: Active_LEF1 type: repression
control_parameter_array[9,2] = 1.0;	#	9 Order: 	repression_Ecadherin_by_Active_LEF1 target: induction_gene_Ecadherin actor: Active_LEF1 type: repression

# activation_Ecadherin_by_ecad_virus: ecad_virus induction induction_gene_Ecadherin
control_parameter_array[10,1] = 0.1;	#	10 Gain: 	activation_Ecadherin_by_ecad_virus target: induction_gene_Ecadherin actor: ecad_virus type: induction
control_parameter_array[10,2] = 1.0;	#	10 Order: 	activation_Ecadherin_by_ecad_virus target: induction_gene_Ecadherin actor: ecad_virus type: induction

# activation_TGFB3_by_TCF4: Active_TCF4 induction induction_gene_TGFB3
control_parameter_array[11,1] = 0.1;	#	11 Gain: 	activation_TGFB3_by_TCF4 target: induction_gene_TGFB3 actor: Active_TCF4 type: induction
control_parameter_array[11,2] = 1.0;	#	11 Order: 	activation_TGFB3_by_TCF4 target: induction_gene_TGFB3 actor: Active_TCF4 type: induction

# repression_TGFB3_by_YREG1: YREG1 repression induction_gene_TGFB3
control_parameter_array[12,1] = 0.1;	#	12 Gain: 	repression_TGFB3_by_YREG1 target: induction_gene_TGFB3 actor: YREG1 type: repression
control_parameter_array[12,2] = 1.0;	#	12 Order: 	repression_TGFB3_by_YREG1 target: induction_gene_TGFB3 actor: YREG1 type: repression

# repression_YREG1_by_SNAIL_SLUG: SNAIL_SLUG repression induction_gene_YREG1
control_parameter_array[13,1] = 0.1;	#	13 Gain: 	repression_YREG1_by_SNAIL_SLUG target: induction_gene_YREG1 actor: SNAIL_SLUG type: repression
control_parameter_array[13,2] = 1.0;	#	13 Order: 	repression_YREG1_by_SNAIL_SLUG target: induction_gene_YREG1 actor: SNAIL_SLUG type: repression

# activation_LEF1_by_pSmad: pSmad induction induction_gene_LEF1
control_parameter_array[14,1] = 0.1;	#	14 Gain: 	activation_LEF1_by_pSmad target: induction_gene_LEF1 actor: pSmad type: induction
control_parameter_array[14,2] = 1.0;	#	14 Order: 	activation_LEF1_by_pSmad target: induction_gene_LEF1 actor: pSmad type: induction

# repression_LEF1_by_YREG1: YREG1 repression induction_gene_LEF1
control_parameter_array[15,1] = 0.1;	#	15 Gain: 	repression_LEF1_by_YREG1 target: induction_gene_LEF1 actor: YREG1 type: repression
control_parameter_array[15,2] = 1.0;	#	15 Order: 	repression_LEF1_by_YREG1 target: induction_gene_LEF1 actor: YREG1 type: repression

# activation_vimentin_by_Active_LEF1: Active_LEF1 induction induction_gene_vimentin
control_parameter_array[16,1] = 0.1;	#	16 Gain: 	activation_vimentin_by_Active_LEF1 target: induction_gene_vimentin actor: Active_LEF1 type: induction
control_parameter_array[16,2] = 1.0;	#	16 Order: 	activation_vimentin_by_Active_LEF1 target: induction_gene_vimentin actor: Active_LEF1 type: induction

# activation_vimentin_by_AP1_SP1_P: AP1_SP1_P induction induction_gene_vimentin
control_parameter_array[17,1] = 0.1;	#	17 Gain: 	activation_vimentin_by_AP1_SP1_P target: induction_gene_vimentin actor: AP1_SP1_P type: induction
control_parameter_array[17,2] = 1.0;	#	17 Order: 	activation_vimentin_by_AP1_SP1_P target: induction_gene_vimentin actor: AP1_SP1_P type: induction

# activation_SNAIL_SLUG_by_AP1_SP1_P: AP1_SP1_P induction induction_gene_SNAIL_SLUG
control_parameter_array[18,1] = 0.1;	#	18 Gain: 	activation_SNAIL_SLUG_by_AP1_SP1_P target: induction_gene_SNAIL_SLUG actor: AP1_SP1_P type: induction
control_parameter_array[18,2] = 1.0;	#	18 Order: 	activation_SNAIL_SLUG_by_AP1_SP1_P target: induction_gene_SNAIL_SLUG actor: AP1_SP1_P type: induction

# activation_SNAIL_SLUG_by_ss_virus: ss_virus induction induction_gene_SNAIL_SLUG
control_parameter_array[19,1] = 0.1;	#	19 Gain: 	activation_SNAIL_SLUG_by_ss_virus target: induction_gene_SNAIL_SLUG actor: ss_virus type: induction
control_parameter_array[19,2] = 1.0;	#	19 Order: 	activation_SNAIL_SLUG_by_ss_virus target: induction_gene_SNAIL_SLUG actor: ss_virus type: induction


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
dilution_selection_array[9] = 0.0;	#	gene_GSK3
dilution_selection_array[10] = 0.0;	#	gene_tubulin
dilution_selection_array[11] = 0.0;	#	gene_SNAIL_SLUG
dilution_selection_array[12] = 0.0;	#	gene_Calcineurin
dilution_selection_array[13] = 0.0;	#	gene_APC_AXIN
dilution_selection_array[14] = 0.0;	#	gene_PI3K
dilution_selection_array[72] = 0.0;	#	gene_TCF4
dilution_selection_array[73] = 0.0;	#	gene_TGFB3
dilution_selection_array[74] = 0.0;	#	gene_YREG1
dilution_selection_array[75] = 0.0;	#	gene_LEF1
dilution_selection_array[76] = 0.0;	#	gene_vimentin
dilution_selection_array[77] = 0.0;	#	gene_R
dilution_selection_array[78] = 0.0;	#	gene_VEGFR
dilution_selection_array[79] = 0.0;	#	gene_NFATc
dilution_selection_array[80] = 0.0;	#	gene_MAPK

# Set the maximum specific growth rate -
maximum_specific_growth_rate = 0.03; # hr^-1

# Set Bionumbers scaling constants
average_transcript_length = 15000 # n
average_protein_length = 5000     # aa

max_translation_rate = 5          # aa/sec
max_transcription_rate = 6.0       # n/sec

av_number = 6.02e23               # number/mol

hl60_diameter = 12                # \mum
fraction_nucleus = 0.49           # dimensionless
VOLUME = ((1-fraction_nucleus)*(1/6)*(3.14159)*(hl60_diameter)^3)*(1e-15)

kcat_transcription = max_transcription_rate*(3600/average_transcript_length)  # hr^-1
kcat_translation = max_translation_rate*(3600/average_protein_length)  # hr^-1

saturation_transcription = (46000*10.0)*(1/av_number)*(1/VOLUME)*1e9
saturation_translation = (100000*1.0)*(1/av_number)*(1/VOLUME)*1e9

mRNA_half_life_TF = 9             # hrs
protein_half_life = 46            # hrs

const global degradation_constant_mRNA = -(1/mRNA_half_life_TF)*log(0.5)
const global degradation_constant_protein = -(1/protein_half_life)*log(0.5)

const global const_transcription = kcat_transcription/saturation_transcription
const global const_translation   = kcat_translation/saturation_translation

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
