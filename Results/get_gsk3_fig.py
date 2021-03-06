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

#F2A = csv.listToFlt(lin.reader(dirp+"F2A.dat"))
#F2B = csv.listToFlt(lin.reader(dirp+"F2B.dat"))
#F2C = csv.listToFlt(lin.reader(dirp+"F2C.dat"))
#F2D = csv.listToFlt(lin.reader(dirp+"F2D.dat"))
#F2E = csv.listToFlt(lin.reader(dirp+"F2E.dat"))
#F2F = csv.listToFlt(lin.reader(dirp+"F2F.dat"))
#F2G = csv.listToFlt(lin.reader(dirp+"F2G.dat"))
#F2H = csv.listToFlt(lin.reader(dirp+"F2H.dat"))
#F2I = csv.listToFlt(lin.reader(dirp+"F2I.dat"))
#F2J = csv.listToFlt(lin.reader(dirp+"F2J.dat"))
#F2K = csv.listToFlt(lin.reader(dirp+"F2K.dat"))
#F2L = csv.listToFlt(lin.reader(dirp+"F2L.dat"))

F3B = csv.listToFlt(lin.reader(dirp+"F3B.dat")) 

dirp = dirp + "/cross_validation/fold_pop_obj_"
# Cross validation bars
#F2A_cv = csv.listToFlt(lin.reader(dirp+"11/F2A.dat"))

#F2B_cv = csv.listToFlt(lin.reader(dirp+"10/F2B.dat"))

#F2C_cv = csv.listToFlt(lin.reader(dirp+"6/F2C.dat"))
#F2D_cv = csv.listToFlt(lin.reader(dirp+"6/F2D.dat"))

#F2E_cv = csv.listToFlt(lin.reader(dirp+"4/F2E.dat"))

#F2F_cv = csv.listToFlt(lin.reader(dirp+"2/F2F.dat"))

#F2G_cv = csv.listToFlt(lin.reader(dirp+"8/F2G.dat"))

#F2H_cv = csv.listToFlt(lin.reader(dirp+"9/F2H.dat"))
F3B_cv = csv.listToFlt(lin.reader(dirp+"7/F3B.dat"))

dirp= dirp1+"/cross_validation/"
#F2J_exp = csv.listToFlt(lin.reader(dirp+"F2J.dat"))
#F2K_exp = csv.listToFlt(lin.reader(dirp+"F2K.dat"))
#F2L_exp = csv.listToFlt(lin.reader(dirp+"F2L.dat"))


# Init matplotlib figure
fig = plt.figure(1,figsize=(30,25))

#HARDCODED REFERENCE COORDINATE FOR FIRST BLOT

refposx,refposy = 450+20,fig.bbox.ymax+480
displacex,displacey=1000,-650
refxf,refyf = -0.115,1.225
# Fig 2 A & B                                                                                                                                                                                                                                    
xlab = u'TGF-${\\beta}$1/2\nLY294002\n '
objects = ('\n-\n-\n','\n+\n-\n','\n-\n+\n')
y_pos = np.arange(len(objects))

# A 
title = 'GSK3-P'
blotpic = '../Results/figblotimages/Fig3B.png'
blotposx,blotposy=10,10
figlab_x, figlab_y, figlab = refxf, refyf, "B"

Abundance = [ F3B[0], F3B[1], F3B[2] ]
sds       = [ F3B[3], F3B[4], F3B[5] ]

Abundance2 = [ F3B_cv[0], F3B_cv[1], F3B_cv[2] ]
sds2       = [ F3B_cv[3], F3B_cv[4], F3B_cv[5] ]

plt.subplot(431)
ylab_opt = True
execfile('../Results/barplot_sd_two_bars.py')
ylab_opt = False
    
# # # 

# Save figure
label = 'fig_gsk3_plot'
fname = dir_out+'%s.png'%(label)
plt.savefig(fname,bbox_inches='tight') # dpi=100

print '[WROTE]\n','open',fname

#plt.show()


def pltlive():
    execfile("half_life_plot.mpl")

# use to get shared axes http://matplotlib.org/examples/pylab_examples/subplots_demo.html
