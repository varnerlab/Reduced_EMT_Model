import matplotlib.pyplot as plt
import numpy as np

execfile('../pyprgs/in_out_line.py')
execfile('../pyprgs/in_out_csv.py')
dat = lin.reader("../poets/results_poets/active_nfat_ap_sp1_p_training_set.dat")
population = csv.nestedToFlt([( string.replace('Any[' ,'').replace(']','')).split(',') for string in dat]) # python

dir_out= '../poets/results_poets/'

# robustness  indices
# 1 edit_file_tgfb.jl (0,1)
# 2 edit_file_vegf.jl (2,3)
# 3 edit_file_tgfb_vegf.jl (4,5)
# 4 edit_file_tgfb_vegf_vi.jl (6,7)
# 5 edit_file_tgfb_vi.jl (8,9)
# 6 edit_file_vegf_vi.jl (10,11)

# to plot, create x,y pairing out of (e.g.) population[i][1],population[i][0]
refx,refy = 0.025,0.95

def build_lists(A,i,j):
    out1 = []
    out2 = []
    for x in A:
        out1.append(x[i])
        out2.append(x[j])
    return out1,out2    

# create figure
fig = plt.figure(1,figsize=(20,20))

current_panel = 1

# plot settings
ylab = "Active NFATc1 [nM]"
xlab = "Active pSp1 [nM]"

#ylab = "Active NFATc nM"
#xlab = "Vimentin nM" 

# 1 vegf plot
plt.subplot(321)
title = "+ VEGFA"
ecad_index = 2
vim_index = 3

figlab_x, figlab_y, figlab = refx, refy, "A"

#r1 =plt.Rectangle( (0,0),10,10,facecolor='orange',alpha=0.5,zorder=1)

execfile("scatter_abundance_2.py")
#ax.add_patch(r1)
# 2 tgfb plot
plt.subplot(323)
title = u'+ TGF${\\beta}$12'
ecad_index = 0
vim_index = 1
figlab_x, figlab_y, figlab = refx, refy, "B"
execfile("scatter_abundance_2.py")

# 3 tgfb vegf plot
plt.subplot(325)
title = ''# u'+ TGF${\\beta}$12\n+ VEGFA'
ecad_index = 4
vim_index = 5
figlab_x, figlab_y, figlab = refx, refy, "C"

execfile("scatter_abundance_2.py")

# 4 vegf+vi plot
plt.subplot(322)
title = '+ VEGFA\n+ VIVIT'
ecad_index = 10
vim_index = 11
figlab_x, figlab_y, figlab = refx, refy, "D"
execfile("scatter_abundance_2.py")

# 5 tgfb+vi plot
title = u'+ TGF${\\beta}$12\n+ VIVIT'
plt.subplot(324)
ecad_index = 8
vim_index = 9
figlab_x, figlab_y, figlab = refx, refy, "E"

execfile("scatter_abundance_2.py")

# 6 tgfb+vegf+vi plot
plt.subplot(326)
title = u'+ TGF${\\beta}$12\n+ VEGFA\n+ VIVIT'
ecad_index = 6
vim_index = 7
figlab_x, figlab_y, figlab = refx, refy, "F"
execfile("scatter_abundance_2.py")


# Save figure
label = 'anfat_psp1_phenotype_abundance_fig_4'
fname = dir_out+'%s.png'%(label)
plt.savefig(fname,bbox_inches='tight') # dpi=100      y
