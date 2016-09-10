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

# Read simulation time series data

# Load species names
execfile('/home/dbassen/Dropbox/server_swap_space/gen_2_model/Results/df_parser.py')
csv.out('species.csv',species)
species = [X[1:][0] for X in species] # go from list of lists to list of strings

# ??? Duplicates exist in species when sorted

execfile('/home/dbassen/Dropbox/server_swap_space/gen_2_model/Results/ez_sorter.py')


def load(inpath,species): 
    data = lin.reader(inpath) 
    data = [x.split('\t') for x in data]
    data = lin.nestedToFlt(data) 
    data = map(list, zip(*data))

    # Load selected species to plot
#    kwd_list = lin.reader('select_regulated.csv')
#    kwd_list = [x[0] for x in csv.In('select_regulated.csv')]
#    kwd_list.reverse()

    # Subset and order data
#    data,species = subset(data,species,kwd_list)
#    species,data=zip(*ez_sort(zip(species,data),kwd_list))
    csv.out('verbose_species.csv',species)
    return species,data
dirp = '/Users/dbassen/work/varner_gould_emt_model/emt_grn_bassen_model/Results/Fig2Simulations/' # used to be TGFb simulation dir
dirp = '/home/dbassen/Dropbox/server_swap_space/gen_2_model/output/Fig2Simulations/' # used to be TGFb simulation dir

#numsp=58
# alias species (total number of species select minus line number) 

# gen2 model
snail_slug_index = 62-1
lef1_index = 58-1 # 
tgfb3_index = 92-1
vim_index = 63-1
ecad_index = 51-1
ecad_mrna_index = 16-1 
psmad_index = 40-1
lef1_mrna_index = 84-1
# 
lef1_active_index = 59-1
ecad_bcat_index = 53-1 
tgfb3_r_index = 95-1


# ubuntu 6 21 2016 gen 1 model

#snail_slug_index = 59-1 
#lef1_index = 55-1 # 
#tgfb3_index = 89-1
#vim_index = 60-1
#ecad_index = 49-1
#ecad_mrna_index = 15-1 
#psmad_index = 38-1
#lef1_mrna_index = 81-1
## 
#lef1_active_index = 56-1
#ecad_bcat_index = 51-1 
#tgfb3_r_index = 92-1


# 


# timestep to plot for 48hr time point
#step_48hr = 528
#step_24hr = 264
#step_72hr = 792
step_24hr = 74
step_48hr = 149
step_72hr = 224

# No treatment
species,dnone = load(dirp+'X_none.dat',species)
# TGFb12
species,dtgfb12 = load(dirp+'X_tgfb.dat',species) # A,BJ-L # was X.dat
# mapk inhibitor
species,dmapkin = load(dirp+'X_mapkin.dat',species)
# snail slug
species,dss = load(dirp+'X_ss.dat',species)
# snail slug ecad
species,dssec = load(dirp+'X_ssecad.dat',species) #'X_ss_ec.dat'
# snail slug tgfb3 AB
species,dssab = load(dirp+'X_ss_tgfb3ab.dat',species) #X_ss_ab.dat
# snail slug DN LEF1
species,dssdnlef = load(dirp+'X_ss_dnlef1.dat',species) # X_ss_dn_lef1.dat
# tgfb3
species,dtgfb3 = load(dirp+'X_tgfb3.dat',species) # ss tag should have been deleted X_ss_tgfb3.dat
# dn smad
species,ddnsmad = load(dirp+'X_dnsmad.dat',species) # ss... X_ss_dn_smad.dat
# tgfb3 DN LEf1
species,dtgfb3dnlef = load(dirp+'X_tgfb3_dnlef1.dat',species) # ss again...X_ss_tgfb3_dn_lef1.dat
# tgfb12 w/ tgfb3_AB # not plotted here
species,dtgfb12tgfb3ab = load(dirp+'X_tgfb_tgfb3ab.dat',species)


# Initialize a figure to put all the plots onto

#print dtgfb3[47][step_48hr]

plt.figure(1,figsize=(30,25))

#plt.figure(1,figsize=(9,7))

# Fig 2 A & B
xlab = 'TGFb12\nU0126\n '
objects = ('\n-\n-\n','\n+\n-\n','\n+\n+\n')
y_pos = np.arange(len(objects))
d1 = dnone
d2 = dtgfb12
d3 = dmapkin
# A
species_index = snail_slug_index # A  
Abundance = [d1[species_index][step_48hr],d2[species_index][step_48hr],d3[species_index][step_48hr]]
plt.subplot(431)
execfile('/home/dbassen/Dropbox/server_swap_space/gen_2_model/Results/barplot.py')
# B
species_index = lef1_index # B & E & G
s2_index  = lef1_active_index
p1 = d1[species_index][step_48hr] + d1[s2_index][step_48hr]
p2 = d2[species_index][step_48hr] + d2[s2_index][step_48hr]
p3 = d3[species_index][step_48hr] + d3[s2_index][step_48hr]
Abundance = [p1,p2,p3]
plt.subplot(432)
#print d1[species_index][step_48hr]
execfile('/home/dbassen/Dropbox/server_swap_space/gen_2_model/Results/barplot.py')
# Fig 2 C & D 
xlab = 'Snail Slug\nEcad\n '
objects = ('\n-\n-\n','\n+\n-\n','\n+\n+\n')
y_pos = np.arange(len(objects))
d2 = dss
d3 = dssec
# C%
species_index = tgfb3_index # C
s2_index  = tgfb3_r_index
p1 = d1[species_index][step_48hr] + d1[s2_index][step_48hr]
p2 = d2[species_index][step_48hr] + d2[s2_index][step_48hr]
p3 = d3[species_index][step_48hr] + d3[s2_index][step_48hr]
Abundance = [p1,p2,p3]
plt.subplot(433)
execfile('/home/dbassen/Dropbox/server_swap_space/gen_2_model/Results/barplot.py')
# D
species_index = vim_index # D & H
Abundance = [d1[species_index][step_48hr],d2[species_index][step_48hr],d3[species_index][step_48hr]]
plt.subplot(434)
execfile('/home/dbassen/Dropbox/server_swap_space/gen_2_model/Results/barplot.py')
# Fig 2 E  
xlab = 'Snail Slug\nTGFb3 Ab\n '
y_pos = np.arange(len(objects))
objects = ('\n-\n-\n','\n+\n-\n','\n+\n+\n')
d2 = dss
d3 = dssab
# E 
species_index = lef1_index # B & E & G
s2_index  = lef1_active_index
p1 = d1[species_index][step_48hr] + d1[s2_index][step_48hr]
p2 = d2[species_index][step_48hr] + d2[s2_index][step_48hr]
p3 = d3[species_index][step_48hr] + d3[s2_index][step_48hr]
Abundance = [p1,p2,p3]
plt.subplot(435)
execfile('/home/dbassen/Dropbox/server_swap_space/gen_2_model/Results/barplot.py')
# Fig 2 F
xlab = 'Snail Slug\nDN LEF-1\n '
objects = ('\n-\n-\n','\n+\n-\n','\n+\n+\n')
y_pos = np.arange(len(objects))
d2 = dss
d3 = dssdnlef
# F
species_index = ecad_index # F & I
s2_index  = ecad_bcat_index
p1 = d1[species_index][step_48hr] + d1[s2_index][step_48hr]
p2 = d2[species_index][step_48hr] + d2[s2_index][step_48hr]
p3 = d3[species_index][step_48hr] + d3[s2_index][step_48hr]
Abundance = [p1,p2,p3]
plt.subplot(436)
execfile('/home/dbassen/Dropbox/server_swap_space/gen_2_model/Results/barplot.py')
# Fig 2 G
xlab = 'TGFb3\nDN Smad\n '
objects = ('\n-\n-\n','\n+\n-\n','\n+\n+\n')
y_pos = np.arange(len(objects))
d2 = dtgfb3
d3 = ddnsmad
#print dtgfb3[47][step_48hr],species[47],d2[47][step_48hr]
# G
species_index = lef1_index # B & E & G
s2_index  = lef1_active_index
p1 = d1[species_index][step_48hr] + d1[s2_index][step_48hr]
p2 = d2[species_index][step_48hr] + d2[s2_index][step_48hr]
p3 = d3[species_index][step_48hr] + d3[s2_index][step_48hr]
Abundance = [p1,p2,p3]
plt.subplot(437)
execfile('/home/dbassen/Dropbox/server_swap_space/gen_2_model/Results/barplot.py')
# Fig 2 H & I 
xlab = 'TGFb3\nDN Smad\nDN LEF-1\n'
objects = ('\n-\n-\n-\n','\n+\n-\n-\n','\n+\n+\n-\n','\n+\n-\n+\n')
y_pos = np.arange(len(objects))
d2 = dtgfb3
d3 = ddnsmad 
d4 = dtgfb3dnlef
# H
species_index = vim_index # D & H
Abundance = [d1[species_index][step_48hr],d2[species_index][step_48hr],d3[species_index][step_48hr],d4[species_index][step_48hr]]
plt.subplot(438)
execfile('/home/dbassen/Dropbox/server_swap_space/gen_2_model/Results/barplot.py')
# I 
species_index = ecad_index # F & I
s2_index  = ecad_bcat_index
p1 = d1[species_index][step_48hr] + d1[s2_index][step_48hr]
p2 = d2[species_index][step_48hr] + d2[s2_index][step_48hr]
p3 = d3[species_index][step_48hr] + d3[s2_index][step_48hr]
p4 = d4[species_index][step_48hr] + d4[s2_index][step_48hr]
Abundance = [p1,p2,p3,p4]
plt.subplot(439)
execfile('/home/dbassen/Dropbox/server_swap_space/gen_2_model/Results/barplot.py')

# Dynamics
d1 = dtgfb12
objects = ('\n0','\n24','\n48','\n72')
y_pos = np.arange(len(objects))
xlab = 'Time (hrs)\n '

# J
species_index = ecad_mrna_index 
Abundance = [d1[species_index][0],d1[species_index][step_24hr],d1[species_index][step_48hr],d1[species_index][step_72hr]]
plt.subplot(4,3,10)
execfile('/home/dbassen/Dropbox/server_swap_space/gen_2_model/Results/barplot.py')
# K
species_index = psmad_index 
Abundance = [d1[species_index][0],d1[species_index][step_24hr],d1[species_index][step_48hr],d1[species_index][step_72hr]]
plt.subplot(4,3,11)
execfile('/home/dbassen/Dropbox/server_swap_space/gen_2_model/Results/barplot.py')
# L
species_index = lef1_mrna_index
Abundance = [d1[species_index][0],d1[species_index][step_24hr],d1[species_index][step_48hr],d1[species_index][step_72hr]]
plt.subplot(4,3,12)
execfile('/home/dbassen/Dropbox/server_swap_space/gen_2_model/Results/barplot.py')

#fig = plt.gcf()
#fig.set_size_inches(15,15)

# Save figure
#import datetime as dt
#fname = 'Fig2Simulations/%s_%s.png'%(label,dt.datetime.now().strftime("%m_%d_%y_%H_%M"))
#fname = 'Fig2Simulations/%s.png'%(label)


fname = '/home/dbassen/Dropbox/server_swap_space/gen_2_model/Results/fig2_hand_fit%s.png'%(label)
plt.savefig(fname,bbox_inches='tight',dpi=50) # dpi=100

print '[WROTE]\n','open',fname

#plt.show()


#def pltlive():
#    execfile("half_life_plot.mpl")

# use to get shared axes http://matplotlib.org/examples/pylab_examples/subplots_demo.html
