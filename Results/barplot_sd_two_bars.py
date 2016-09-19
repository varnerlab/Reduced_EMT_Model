def matadd(A,s):
    return [x+s for x in A]


# Plotting begins
Abundance = [x+0.001 for x in Abundance]

barsize = 0.35
spacer=0.01

barlist= plt.bar(y_pos, Abundance,width=barsize, align='center', alpha=0.9,yerr=sds,error_kw=dict(ecolor='black', lw=1, capsize=5, capthick=2))

Abundance2 = [x+0.001 for x in Abundance2]
barlist2= plt.bar(matadd(y_pos,barsize+spacer), Abundance2,width=barsize, align='center', alpha=0.5,yerr=sds2,error_kw=dict(ecolor='black', lw=1, capsize=5, capthick=2))

for i in range(len(objects)):
    barlist[i].set_color('black')


for i in range(len(objects)):
    barlist2[i].set_color('lightgray')
    barlist2[i].set_hatch('/\\')
    barlist2[i].set_edgecolor('black')

ax = plt.gca()
ax.xaxis.set_label_coords(-0.083, -0.18)

ax.spines['right'].set_visible(False) # get rid of box
ax.spines['top'].set_visible(False)
ax.xaxis.set_ticks_position('bottom')
ax.yaxis.set_ticks_position('left')

plt.xticks(matadd(y_pos,barsize/2.), objects)
plt.rcParams.update({'font.size': 30})
x1,x2,y1,y2 = plt.axis()
plt.axis((x1,x2,0,1.5))
plt.xlabel(xlab)
if ylab_opt == True:
    plt.ylabel('Scaled \nAbundance (0-1)')
#plt.ylabel('Abundance')
#plt.title(title)


import matplotlib.ticker as plticker

loc = plticker.MultipleLocator(base=0.3) # this locator puts ticks at regular intervals
ax.yaxis.set_major_locator(loc)

plt.text(0.5, 0.82, title,
                  horizontalalignment='left',
                  fontsize=28,
                  transform = ax.transAxes)

import Image
if blotpic != '':
    im = Image.open(blotpic)
    width = im.size[0]
    height = im.size[1]
    rootdir = '/home/dbassen/Dropbox/server_swap_space/gen_2_model/Results/figblotimages/'
    if blotpic==rootdir+'FigC_2.png' or blotpic ==rootdir+'FigD_2.png' or blotpic ==rootdir+'FigE_2.png' or blotpic ==rootdir+'FigF_2.png':
        scalex,scaley = 0.45,0.3    
    else:
        scalex,scaley= 0.3,0.3
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
    posx,posy = refposx+blotposx,refposy+blotposy
    fig.figimage(im, posx,  posy,zorder=1)
    
    
plt.tight_layout(pad=0.2, w_pad=0.5, h_pad=1.0)
# add space to the top
#fig.subplots_adjust(top=1.2)
#plt.tight_layout(pad=0.4, w_pad=0.5, h_pad=1.0)
