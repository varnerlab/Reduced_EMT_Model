# Resources to makey heatmap
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
execfile('../pyprgs/in_out_line.py')
execfile('../pyprgs/in_out_csv.py')

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

execfile('../Results/ez_sorter.py')

dirp = '../poets/results_poets/'
dirp1 = dirp 
dir_out= '../poets/results_poets/'
# Read means and standard deviations for figure 2 training bars

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
dirp = dirp + "/cross_validation/fold_pop_obj_"
# Cross validation bars
F2A_cv = csv.listToFlt(lin.reader(dirp+"11/F2A.dat"))

F2B_cv = csv.listToFlt(lin.reader(dirp+"10/F2B.dat"))

F2C_cv = csv.listToFlt(lin.reader(dirp+"6/F2C.dat"))
F2D_cv = csv.listToFlt(lin.reader(dirp+"6/F2D.dat"))

F2E_cv = csv.listToFlt(lin.reader(dirp+"4/F2E.dat"))

F2F_cv = csv.listToFlt(lin.reader(dirp+"2/F2F.dat"))

F2G_cv = csv.listToFlt(lin.reader(dirp+"8/F2G.dat"))

F2H_cv = csv.listToFlt(lin.reader(dirp+"9/F2H.dat"))
F2I_cv = csv.listToFlt(lin.reader(dirp+"9/F2I.dat"))

dirp= dirp1+"/cross_validation/"
F2J_exp = csv.listToFlt(lin.reader(dirp+"F2J.dat"))
F2K_exp = csv.listToFlt(lin.reader(dirp+"F2K.dat"))
F2L_exp = csv.listToFlt(lin.reader(dirp+"F2L.dat"))


# Init matplotlib figure
fig = plt.figure(1,figsize=(30,25))

#HARDCODED REFERENCE COORDINATE FOR FIRST BLOT

refposx,refposy = 450+20,fig.bbox.ymax+480
displacex,displacey=1000,-650
refxf,refyf = -0.115,1.225
# Fig 2 A & B                                                                                                                                                                                                                                                                     
xlab = u'TGF-${\\beta}$12\nU0126\n '
objects = ('\n-\n-\n','\n+\n-\n','\n-\n+\n')
y_pos = np.arange(len(objects))

# A 
title = 'Snail/Slug'
blotpic = '../Results/figblotimages/FigA.png'
blotposx,blotposy=0,0
figlab_x, figlab_y, figlab = refxf, refyf, "A"

Abundance = [ F2A[0], F2A[1], F2A[2] ]
sds       = [ F2A[3], F2A[4], F2A[5] ]

Abundance2 = [ F2A_cv[0], F2A_cv[1], F2A_cv[2] ]
sds2       = [ F2A_cv[3], F2A_cv[4], F2A_cv[5] ]

plt.subplot(431)
ylab_opt = True
execfile('../Results/barplot_sd_two_bars.py')
ylab_opt = False
# B
title = 'LEF-1'
blotpic = '../Results/figblotimages/FigB.png'
blotposx,blotposy=displacex,0
figlab_x, figlab_y, figlab = refxf, refyf, "B"

Abundance = [ F2B[0], F2B[1], F2B[2] ]
sds       = [ F2B[3], F2B[4], F2B[5] ]

Abundance2 = [ F2B_cv[0], F2B_cv[1], F2B_cv[2] ]
sds2       = [ F2B_cv[3], F2B_cv[4], F2B_cv[5] ]

plt.subplot(432)
execfile('../Results/barplot_sd_two_bars.py')

# Fig 2 C & D 
xlab = 'Snail/Slug\nEcad\n '
objects = ('\n-\n-\n','\n+\n-\n','\n+\n+\n')
y_pos = np.arange(len(objects))

# C 
title = u'TGF-${\\beta}$3'
blotpic = '../Results/figblotimages/FigC_2.png'
blotposx,blotposy=displacex*2,0
figlab_x, figlab_y, figlab = refxf, refyf, "C"


Abundance = [ F2C[0], F2C[1], F2C[2] ]
sds       = [ F2C[3], F2C[4], F2C[5] ]

Abundance2 = [ F2C_cv[0], F2C_cv[1], F2C_cv[2] ]
sds2       = [ F2C_cv[3], F2C_cv[4], F2C_cv[5] ]

plt.subplot(433)
execfile('../Results/barplot_sd_two_bars.py')
# D
title = 'Vimentin'
blotpic = '../Results/figblotimages/FigD_2.png'
blotposx,blotposy=0,displacey
figlab_x, figlab_y, figlab = refxf, refyf, "D"

Abundance = [ F2D[0], F2D[1], F2D[2] ]
sds       = [ F2D[3], F2D[4], F2D[5] ]

Abundance2 = [ F2D_cv[0], F2D_cv[1], F2D_cv[2] ]
sds2       = [ F2D_cv[3], F2D_cv[4], F2D_cv[5] ]

plt.subplot(434)
ylab_opt = True
execfile('../Results/barplot_sd_two_bars.py')
ylab_opt = False
# Fig 2 E  
xlab = u'Snail/Slug\nTGF-${\\beta}$3 Ab\n '
y_pos = np.arange(len(objects))
objects = ('\n-\n-\n','\n+\n-\n','\n+\n+\n')
# E 
title = 'LEF-1'
blotpic = '../Results/figblotimages/FigE_2.png'
blotposx,blotposy=displacex,displacey
figlab_x, figlab_y, figlab = refxf, refyf, "E"


Abundance = [ F2E[0], F2E[1], F2E[2] ]
sds       = [ F2E[3], F2E[4], F2E[5] ]

Abundance2 = [ F2E_cv[0], F2E_cv[1], F2E_cv[2] ]
sds2       = [ F2E_cv[3], F2E_cv[4], F2E_cv[5] ]

plt.subplot(435)
execfile('../Results/barplot_sd_two_bars.py')
# Fig 2 F
xlab = 'Snail/Slug\nDN LEF-1\n '
objects = ('\n-\n-\n','\n+\n-\n','\n+\n+\n')
y_pos = np.arange(len(objects))
# F
title = 'E-cadherin'
blotpic = '../Results/figblotimages/FigF_2.png'
blotposx,blotposy=displacex*2,displacey
figlab_x, figlab_y, figlab = refxf, refyf, "F"
Abundance = [ F2F[0], F2F[1], F2F[2] ]
sds       = [ F2F[3], F2F[4], F2F[5] ]

Abundance2 = [ F2F_cv[0], F2F_cv[1], F2F_cv[2] ]
sds2       = [ F2F_cv[3], F2F_cv[4], F2F_cv[5] ]

plt.subplot(436)
execfile('../Results/barplot_sd_two_bars.py')
# Fig 2 G
xlab = u'TGF-${\\beta}$3\nDN Smad\n '
objects = ('\n-\n-\n','\n+\n-\n','\n+\n+\n')
y_pos = np.arange(len(objects))
# G
title = 'LEF-1'
blotpic = '../Results/figblotimages/FigG.png'
blotposx,blotposy=0,displacey*2
figlab_x, figlab_y, figlab = refxf, refyf, "G"

Abundance = [ F2G[0], F2G[1], F2G[2] ]
sds       = [ F2G[3], F2G[4], F2G[5] ]

Abundance2 = [ F2G_cv[0], F2G_cv[1], F2G_cv[2] ]
sds2       = [ F2G_cv[3], F2G_cv[4], F2G_cv[5] ]

plt.subplot(437)
ylab_opt = True
execfile('../Results/barplot_sd_two_bars.py')
ylab_opt = False
# Fig 2 H & I 
xlab = u'TGF-${\\beta}$3\nDN Smad\nDN LEF-1\n'
objects = ('\n-\n-\n-\n','\n+\n-\n-\n','\n+\n+\n-\n','\n+\n-\n+\n')
y_pos = np.arange(len(objects))

# # On to the 4-bar plots
 
# H
title = 'Vimentin'
blotpic = '../Results/figblotimages/FigH.png'
blotposx,blotposy=displacex,displacey*2
figlab_x, figlab_y, figlab = refxf, refyf, "H"

Abundance = [ F2H[0], F2H[1], F2H[2], F2H[3] ]
sds       = [ F2H[4], F2H[5], F2H[6], F2H[7] ]

Abundance2 = [ F2H_cv[0], F2H_cv[1], F2H_cv[2], F2H_cv[3] ]
sds2       = [ F2H_cv[4], F2H_cv[5], F2H_cv[6], F2H_cv[7] ]

plt.subplot(438)
execfile('../Results/barplot_sd_two_bars.py')
# I 
title = 'E-cadherin'
blotpic = '../Results/figblotimages/FigI.png'
blotposx,blotposy=displacex*2,displacey*2
figlab_x, figlab_y, figlab = refxf, refyf, "I"

Abundance = [ F2I[0], F2I[1], F2I[2], F2I[3] ]
sds       = [ F2I[4], F2I[5], F2I[6], F2I[7] ]

Abundance2 = [ F2I_cv[0], F2I_cv[1], F2I_cv[2], F2I_cv[3] ]
sds2       = [ F2I_cv[4], F2I_cv[5], F2I_cv[6], F2I_cv[7] ]

plt.subplot(439)
execfile('../Results/barplot_sd_two_bars.py')

# Dynamics J & K & L
objects = ('\n0','\n24','\n48','\n72')
y_pos = np.arange(len(objects))
xlab = '\n                                              Time (hrs) '

# J
title = 'E-cadherin\nmRNA'
figlab_x, figlab_y, figlab = refxf, refyf, "J"

Abundance = [ F2J[0], F2J[1], F2J[2], F2J[3] ]
sds       = [ F2J[4], F2J[5], F2J[6], F2J[7] ]

Abundance2 = [ F2J_exp[0], F2J_exp[1], F2J_exp[2], F2J_exp[3] ]
sds2       = [ F2J_exp[4], F2J_exp[5], F2J_exp[6], F2J_exp[7] ]

plt.subplot(4,3,10)
ylab_opt = True
execfile('../Results/barplot_sd_two_bars.py')
ylab_opt = False
# K
title = 'pSmad'
figlab_x, figlab_y, figlab = refxf, refyf, "K"

Abundance = [ F2K[0], F2K[1], F2K[2], F2K[3] ]
sds       = [ F2K[4], F2K[5], F2K[6], F2K[7] ]

Abundance2 = [ F2K_exp[0], F2K_exp[1], F2K_exp[2], F2K_exp[3] ]
sds2       = [ F2K_exp[4], F2K_exp[5], F2K_exp[6], F2K_exp[7] ]
plt.subplot(4,3,11)
execfile('../Results/barplot_sd_two_bars.py')
# L
title = 'LEF-1\nmRNA'
figlab_x, figlab_y, figlab = refxf, refyf, "L"

Abundance = [ F2L[0], F2L[1], F2L[2], F2L[3] ]
sds       = [ F2L[4], F2L[5], F2L[6], F2L[7] ]

Abundance2 = [ F2L_exp[0], F2L_exp[1], F2L_exp[2], F2L_exp[3] ]
sds2       = [ F2L_exp[4], F2L_exp[5], F2L_exp[6], F2L_exp[7] ]
plt.subplot(4,3,12)
execfile('../Results/barplot_sd_two_bars.py')


# # # add box around last row

import Image
if True:
    rootdir = '../Results/figblotimages/' 
    im = Image.open(rootdir+"block.png")
    width = im.size[0]
    height = im.size[1]
    scalex,scaley= 1.515,1.2
    size = int(width*scalex),int(height*scaley)
    im=im.resize(size,Image.ANTIALIAS)
    width = im.size[0]
    height = im.size[1]
    im = np.array(im).astype(np.float) / 255
    #blot_x=0.1
    #blot_y=1.4 
    #print(height,width)
    #ax.imshow(im, aspect='auto', extent=(blot_x, blot_x + 2.4, blot_y, blot_y +0.24), zorder=1)

    plt.text(0.5, 1.3,'.',
    horizontalalignment='left',
    fontsize=1,
    transform = ax.transAxes)
    posx,posy = refposx-200,refposy+blotposy*2
    fig.figimage(im, posx,  posy,zorder=-1,alpha=0.15)


# re-init
refposx,refposy = 450,fig.bbox.ymax+480

# # # add legend for top rows
if True:
    rootdir = '../Results/figblotimages/' 
    im = Image.open(rootdir+"TrainingValidationLegend_vert.png")
    width = im.size[0]
    height = im.size[1]
    scalex,scaley= 0.44,0.44
    size = int(width*scalex),int(height*scaley)
    im=im.resize(size,Image.ANTIALIAS)
    width = im.size[0]
    height = im.size[1]
    im = np.array(im).astype(np.float) / 255
    #blot_x=0.1
    #blot_y=1.4 
    #print(height,width)
    #ax.imshow(im, aspect='auto', extent=(blot_x, blot_x + 2.4, blot_y, blot_y +0.24), zorder=1)

    plt.text(0.5, 1.3,'.',
    horizontalalignment='left',
    fontsize=1,
    transform = ax.transAxes)
    posx,posy = refposx - 415,refposy-50
    fig.figimage(im, posx,  posy,zorder=1,alpha=1.0)

# # # add legend for prediction row
if True:
    rootdir = '../Results/figblotimages/' 
    im = Image.open(rootdir+"PredictionLegend_vert.png")
    width = im.size[0]
    height = im.size[1]
    scalex,scaley= 2.0,2.0
    size = int(width*scalex),int(height*scaley)
    im=im.resize(size,Image.ANTIALIAS)
    width = im.size[0]
    height = im.size[1]
    im = np.array(im).astype(np.float) / 255
    #blot_x=0.1
    #blot_y=1.4 
    #print(height,width)
    #ax.imshow(im, aspect='auto', extent=(blot_x, blot_x + 2.4, blot_y, blot_y +0.24), zorder=1)

    plt.text(0.5, 1.3,'.',
    horizontalalignment='left',
    fontsize=1,
    transform = ax.transAxes)
    posx,posy = refposx - 400,refposy - 2125
    fig.figimage(im, posx,  posy,zorder=1,alpha=1.0)
    
# # # 

# Save figure
label = 'fig2_full_emt_grn_poets'
fname = dir_out+'%s.png'%(label)
plt.savefig(fname,bbox_inches='tight') # dpi=100

print '[WROTE]\n','open',fname

#plt.show()


def pltlive():
    execfile("half_life_plot.mpl")

# use to get shared axes http://matplotlib.org/examples/pylab_examples/subplots_demo.html
