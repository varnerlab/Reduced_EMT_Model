# Medici et al. Western blot data
# BACKGROUND SUBTRACTED VALUES FROM RAG

# Figure 1B # Ojb1

Fig1B = [
12,207,18, #Snail # 1
12,18,207, #Slug  # 4
1,182,191, #LEF-1 # 7
212,209,224 #a-tubulin #11
]
#Snail,-,+,-,,
#Slug,-,-,+,,

# Figure 1F # Ojb2

Fig1F = [
208,1,1,184,    #E-cadherin # 1
1,197,203,32,   #Vimentin  # 5
1,180,176,30,   #Fibronectin # 9
190,203,202,199 #a-tubulin # 13
]
#Snail,-,'+,-,'+,
#Slug,-,-,'+,-,
#DN LEF-1,-,-,-,'+,

# Figure 2A # Ojb3
Fig2A = [
11,225,221,30, #TGF-b3
209,216,212 #a-tubulin
]
#Snail,-,+,-,fig3F(+ECAD),
#Slug,-,-,+,fig3F(+ECAD),

#Figure 2E # Ojb4
Fig2E = [
1,184,184,18,21, #LEF-1 # 1
169,1,1,173,170, #E-cadherin # 6
1,182,193,36,39, #Vimentin   # 11
1,178,178,38,39, #Fibronectin # 16
201,201,201,201,201, #a-tubulin
]
#Snail,-,'+,-,'+,-
#Slug,-,-,'+,-,'+
#TGF-b3 Ab,-,-,-,'+,'+

#Figure 3D # Ojb5
Fig3D = [
1,141,164,1,1, #b-catenin #1
149,149,149,149,149 #TCF-4 #6
]
#Snail,-,'+,-,'+,-
#Slug,-,-,'+,-,'+
#E-cadherin,-,-,-,'+,'+

#Figure 3F # Ojb6
Fig3F = [
17,188,190,30,32, #TGF-b3 # 1
172,1,1,185,189, #E-cadherin # 6
1,154,159,1,1, #Vimentin #  11
1,160,158,1,1, #Fibronectin #
184,184,184,184,184 #a-tubulin #
]
#Snail,-,'+,-,'+,-
#Slug,-,-,'+,-,'+
#E-cadherin,-,-,-,'+,'+

#Figure 4D # Ojb7

Fig4D = [
10,25, #Snail
5,10, #Slug
217,213 #a-tubulin
]
#TGF-b3,-,'+,,,

#Figure 4E # Ojb8
Fig4E = [
1,186,11, #LEF-1
216,229,223 #a-tubulin
]
#TGF-b3,-,'+,'+,,
#DN Smad4,-,-,'+,,

#Figure 4G # Ojb9
Fig4G = [
192,1,199,183, #E-cadherin # 1
1,182,27,26, #Vimentin     # 5
1,183,9,6, #Fibronectin    # 9
222,228,198,206 #a-tubulin #
]
#TGF-b3,-,'+,'+,'+,
#DN Smad4,-,-,'+,-,
#DN LEF-1,-,-,-,'+,

#Figure 5A # Ojb10
Fig5A = [
48,211,22,209,35, #Snail
40,213,20,211,21, #Slug
204,220,213,224,209 #a-tubulin
]
#TGF-b1,-,'+,'+,-,-
#TGF-b2,-,'+,-,'+,'+
#U0126,-,-,'+,-,'+

#Figure 5C # # Ojb11 # NOT FIGURE 5 C
Fig5C = [
1,217,20,200, #LEF-1
196,199,210,214 #a-tubulin
]

#TGF-b1,-,'+,'+,-,
#TGF-b2,-,'+,-,'+,
#MEKINH,-,-,'+,-,
# WARNING according to paper, 3rd condition is actually TGFB3_AB
# different from RAG excel sheet
# THE OBJECTIVE IS FORMULATED CORRECTLY BUT IT DOES NOT RELATE TO FIGURE 5C WHICH IS NOT TRAIED TO

Fig4F = [
56,224,31 #GSK3_P
]
#TGF-b3,-,+,-
#PI3Kin,-,-,+
