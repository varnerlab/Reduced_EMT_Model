execfile('../pyprgs/in_out_line.py')
execfile('../pyprgs/in_out_csv.py')

dat = csv.In("../poets/results_poets/fig_error_table.csv")

#dat = [[( string.replace('[' ,'').replace(']',''))  for line in dat] for string in line]

dat_new = []
for line in dat:
    dat_new.append([round(float(string.replace('[' ,'').replace(']','')),3)  for string in line])


# Format data as strings
# switch to column editing
import numpy as np
RAW=np.array(dat_new).transpose()
RAW=RAW.tolist() # now we have columns
# RAW[0] = nominal
# RAW[1] = mean training
col3=[]
for x in RAW[1]:
    col3.append(str(x))
# RAW[2] = sd training
for i in range(len(RAW[2])):
    col3[i]=col3[i]+' $\pm$ '+str(RAW[2][i])
# RAW[3] = mean prediction
col4=[]
for x in RAW[3]:
        col4.append(str(x))
# RAW[4] = sd prediction
for i in range(len(RAW[4])):
        col4[i]=col4[i]+' $\pm$ '+str(RAW[4][i])
# RAW[5] = mean random
col5=[]
for x in RAW[5]:
        col5.append(str(x))
# RAW[6] = sd random
for i in range(len(RAW[6])):
        col5[i]=col5[i]+' $\pm$ '+str(RAW[6][i])
# 
row_labels = ['O1','O2','O3','O4','O5','O6','O7','O8','O9','O10','O11']
species = ['LEF1','Vimentin',r'TGF$\beta$3','E-cadherin',r'$\beta$-catenin',r'TGF$\beta$3','GSK3-P','LEF1','E-Cadherin','Snail/Slug','LEF1']
cell_type = ['DLD1 CC,MDCKII,A375 MC']*11
formated = [row_labels,species,cell_type,col3,col4,col5]# RAW[0]

formated=np.array(formated).transpose()
formated=formated.tolist() # now we have columns

#dat = []

#for x,y in zip(dat_new,row_labels):
#    dat.append([y]+x)

head = ['O#','Species (protein)','Cell Type','Training','Prediction','Random'] # 'Nominal',
#dat= [head]+dat


#csv.out("../poets/results_poets/formated_error_table.csv",dat)

#dat = csv.nestedToFlt(dat)
#dat = csv.nestedToFlt([( string.replace('Any[' ,'').replace(']','')) for line in dat for string in line]) # python

import matplotlib.pyplot as plt
#plt.figure(1,figsize=(30,25))
ax = plt.figure()
fig, ax =plt.subplots(1,1)
ax.xaxis.set_visible(False)
ax.yaxis.set_visible(False)

cell_text= formated
collabs = head
#rowlabs = row_labels

table = ax.table(cellText=cell_text,
                     colLabels=collabs,
                     cellLoc='center',
                     loc='center')
#row_labels = ['O1','O2','O3','O4','O5','O6','O7','O8','O9','O10','O11']
for i in range(len(head)):
    c=table.get_celld()[(0,i)].get_text().set_weight('bold')

#c=table.get_celld()[(1,1)].get_text().set_weight('bold')

#plt.subplots_adjust(left=0.2, top=0.8)

dir_out = '../poets/results_poets/'
label = 'error_ytable'
fname = dir_out+'%s.png'%(label)
plt.savefig(fname,bbox_inches='tight',dpi=300) # dpi=100

print '[WROTE]\n','open',fname
