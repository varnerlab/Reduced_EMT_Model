# Resources to make heatmap
import matplotlib.pyplot as plt
import numpy as np

# Pass argument
import sys

try:
    inpath = sys.argv[1]
    label = sys.argv[2]
except:
    inpath = 'no input'
    label = 'no_label'
# File handling 
execfile('/home/dbassen/Dropbox/pyprgs/in_out_line.py')
execfile('/home/dbassen/Dropbox/pyprgs/in_out_csv.py')

# subsets data based on list of species 
def subset(data,labels,kwd_list):
    SubDat = []
    SubLab = []
    for x,y in zip(labels,range(len(labels))):
        if x in kwd_list:
#            print x
            SubLab.append(x)
            SubDat.append(data[y])
    # put in kwd list order
#    for x in kwd_list:
#        for y,i in zip(SubDat,range(len(SubDat))):
#            if x == y:

    return  SubDat,SubLab    

execfile('/home/dbassen/Dropbox/server_swap_space/gen_2_model/Results/ez_sorter.py')

dirp = '/home/dbassen/work/varner_gould_emt_model/emt_grn_bassen_model/Results/results_poets/' # storage for data and plots
dirp = '/home/dbassen/Dropbox/server_swap_space/gen_2_model/poets/results_poets/'

# Read means and standard deviations for figure 2

F2A = csv.listToFlt(lin.reader(dirp+"F2A.dat"))
F2B = csv.listToFlt(lin.reader(dirp+"F2B.dat"))
F2C = csv.listToFlt(lin.reader(dirp+"F2C.dat"))
F2D = csv.listToFlt(lin.reader(dirp+"F2D.dat"))
F2E = csv.listToFlt(lin.reader(dirp+"F2E.dat"))
F2F = csv.listToFlt(lin.reader(dirp+"F2F.dat"))
F2G = csv.listToFlt(lin.reader(dirp+"F2G.dat"))
F2H = csv.listToFlt(lin.reader(dirp+"F2H.dat"))
F2I = csv.listToFlt(lin.reader(dirp+"F2I.dat"))
F2J = csv.listToFlt(lin.reader(dirp+"F2J.dat"))
F2K = csv.listToFlt(lin.reader(dirp+"F2K.dat"))
F2L = csv.listToFlt(lin.reader(dirp+"F2L.dat"))

# Init matplotlib figure
plt.figure(1,figsize=(30,25))

# Fig 2 A & B                                                                                                                                                                                                                                                                     
xlab = 'TGF-beta-12\nU0126\n '
objects = ('\n-\n-\n','\n+\n-\n','\n-\n+\n')
y_pos = np.arange(len(objects))

# A 
title = 'Snail/Slug'
Abundance = [ F2A[0], F2A[1], F2A[2] ]
sds       = [ F2A[3], F2A[4], F2A[5] ]

plt.subplot(431)
execfile('/home/dbassen/Dropbox/server_swap_space/gen_2_model/Results/barplot_sd.py')

# B

title = 'LEF1'
Abundance = [ F2B[0], F2B[1], F2B[2] ]
sds       = [ F2B[3], F2B[4], F2B[5] ]

plt.subplot(432)
execfile('/home/dbassen/Dropbox/server_swap_space/gen_2_model/Results/barplot_sd.py')

# Fig 2 C & D 
xlab = 'Snail Slug\nEcad\n '
objects = ('\n-\n-\n','\n+\n-\n','\n+\n+\n')
y_pos = np.arange(len(objects))

# C 
title = 'TGF-beta-3'
Abundance = [ F2C[0], F2C[1], F2C[2] ]
sds       = [ F2C[3], F2C[4], F2C[5] ]

plt.subplot(433)
execfile('/home/dbassen/Dropbox/server_swap_space/gen_2_model/Results/barplot_sd.py')
# D
title = 'Vimentin'
Abundance = [ F2D[0], F2D[1], F2D[2] ]
sds       = [ F2D[3], F2D[4], F2D[5] ]

plt.subplot(434)
execfile('/home/dbassen/Dropbox/server_swap_space/gen_2_model/Results/barplot_sd.py')
# Fig 2 E  
xlab = 'Snail Slug\nTGF-beta-3 Ab\n '
y_pos = np.arange(len(objects))
objects = ('\n-\n-\n','\n+\n-\n','\n+\n+\n')
# E 
title = 'LEF1'

Abundance = [ F2E[0], F2E[1], F2E[2] ]
sds       = [ F2E[3], F2E[4], F2E[5] ]

plt.subplot(435)
execfile('/home/dbassen/Dropbox/server_swap_space/gen_2_model/Results/barplot_sd.py')
# Fig 2 F
xlab = 'Snail Slug\nDN LEF-1\n '
objects = ('\n-\n-\n','\n+\n-\n','\n+\n+\n')
y_pos = np.arange(len(objects))
# F
title = 'E-Cadherin' 
Abundance = [ F2F[0], F2F[1], F2F[2] ]
sds       = [ F2F[3], F2F[4], F2F[5] ]

plt.subplot(436)
execfile('/home/dbassen/Dropbox/server_swap_space/gen_2_model/Results/barplot_sd.py')
# Fig 2 G
xlab = 'TGFb3\nDN Smad\n '
objects = ('\n-\n-\n','\n+\n-\n','\n+\n+\n')
y_pos = np.arange(len(objects))
# G
title = 'LEF1'
Abundance = [ F2G[0], F2G[1], F2G[2] ]
sds       = [ F2G[3], F2G[4], F2G[5] ]

plt.subplot(437)
execfile('/home/dbassen/Dropbox/server_swap_space/gen_2_model/Results/barplot_sd.py')
# Fig 2 H & I 
xlab = 'TGFb3\nDN Smad\nDN LEF-1\n'
objects = ('\n-\n-\n-\n','\n+\n-\n-\n','\n+\n+\n-\n','\n+\n-\n+\n')
y_pos = np.arange(len(objects))

# # On to the 4-bar plots
 
# H
title = 'Vimentin'
Abundance = [ F2H[0], F2H[1], F2H[2], F2H[3] ]
sds       = [ F2H[4], F2H[5], F2H[6], F2H[7] ]

plt.subplot(438)
execfile('/home/dbassen/Dropbox/server_swap_space/gen_2_model/Results/barplot_sd.py')
# I 
title = 'E-Cadherin'
Abundance = [ F2I[0], F2I[1], F2I[2], F2I[3] ]
sds       = [ F2I[4], F2I[5], F2I[6], F2I[7] ]

plt.subplot(439)
execfile('/home/dbassen/Dropbox/server_swap_space/gen_2_model/Results/barplot_sd.py')

# Dynamics J & K & L
objects = ('\n0','\n24','\n48','\n72')
y_pos = np.arange(len(objects))
xlab = 'Time (hrs)\n '

# J
title = 'E-Cadherin mRNA'
Abundance = [ F2J[0], F2J[1], F2J[2], F2J[3] ]
sds       = [ F2J[4], F2J[5], F2J[6], F2J[7] ]
plt.subplot(4,3,10)
execfile('/home/dbassen/Dropbox/server_swap_space/gen_2_model/Results/barplot_sd.py')
# K
title = 'pSmad'
Abundance = [ F2K[0], F2K[1], F2K[2], F2K[3] ]
sds       = [ F2K[4], F2K[5], F2K[6], F2K[7] ]
plt.subplot(4,3,11)
execfile('/home/dbassen/Dropbox/server_swap_space/gen_2_model/Results/barplot_sd.py')
# L
title = 'LEF1 mRNA'
Abundance = [ F2L[0], F2L[1], F2L[2], F2L[3] ]
sds       = [ F2L[4], F2L[5], F2L[6], F2L[7] ]
plt.subplot(4,3,12)
execfile('/home/dbassen/Dropbox/server_swap_space/gen_2_model/Results/barplot_sd.py')

# # # 

# Save figure
label = 'fig2_emt_grn_poets'
fname = dirp+'%s.png'%(label)
plt.savefig(fname,bbox_inches='tight') # dpi=100

print '[WROTE]\n','open',fname

#plt.show()


def pltlive():
    execfile("half_life_plot.mpl")

# use to get shared axes http://matplotlib.org/examples/pylab_examples/subplots_demo.html
