import matplotlib.pyplot as plt
import numpy as np

execfile('/home/dbassen/Dropbox/pyprgs/in_out_line.py')
execfile('/home/dbassen/Dropbox/pyprgs/in_out_csv.py')
dat = lin.reader("../poets/results_poets/Robustness_training_set.dat")
population = csv.nestedToFlt([( string.replace('Any[' ,'').replace(']','')).split(',') for string in dat]) # python

dir_out= '/home/dbassen/Dropbox/server_swap_space/gen_2_model/poets/results_poets/'

# robustness  indices
# 1 edit_file_tgfb.jl (0,1)
# 2 edit_file_vegf.jl (2,3)
# 3 edit_file_tgfb_vegf.jl (4,5)
# 4 edit_file_tgfb_vegf_vi.jl (6,7)
# 5 edit_file_tgfb_vi.jl (8,9)
# 6 edit_file_vegf_vi.jl (10,11)

# to plot, create x,y pairing out of (e.g.) population[i][1],population[i][0]

def build_lists(A,i,j):
    out1 = []
    out2 = []
    for x in A:
        out1.append(x[i])
        out2.append(x[j])
    return out1,out2    

# create figure
fig = plt.figure(1,figsize=(30,20))

# plot settings
ylab = "Ecadherin Robustness"
xlab = "Vimentin Robustness" 

# 1 vegf plot
plt.subplot(321)
title = "VEGF"
ecad_index = 2
vim_index = 3
#r1 = plt.Rectangle( (0,0),10,10,facecolor='orange',alpha=0.5,zorder=1)

execfile("scatter.py")
#ax.add_patch(r1)
# 2 tgfb plot
plt.subplot(323)
title = u'TGF${\\beta}$12'
ecad_index = 0
vim_index = 1

execfile("scatter.py")

# 3 tgfb vegf plot
plt.subplot(325)
title = u'TGF${\\beta}$12 + VEGF'
ecad_index = 4
vim_index = 5

execfile("scatter.py")

# 4 vegf+vi plot
plt.subplot(322)
title = 'VEGF + VIVIT'
ecad_index = 10
vim_index = 11

execfile("scatter.py")

# 5 tgfb+vi plot
title = u'TGF${\\beta}$12 + VIVIT'
plt.subplot(324)
ecad_index = 8
vim_index = 9

execfile("scatter.py")

# 6 tgfb+vegf+vi plot
plt.subplot(326)
title = u'TGF${\\beta}$12 + VEGF \n+ VIVIT'
ecad_index = 6
vim_index = 7

execfile("scatter.py")


# Save figure
label = 'robustness_fig_4'
fname = dir_out+'%s.png'%(label)
plt.savefig(fname,bbox_inches='tight') # dpi=100      y
