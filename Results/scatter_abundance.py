(x,y) = build_lists(population,vim_index,ecad_index)

# plot
ecad_base_index,vim_base_index = 12,13

(xbase,ybase) = build_lists(population,vim_base_index,ecad_base_index)

plt.plot(xbase,ybase,"o",color="gray")

plt.hold(True)
plt.plot(x,y,"o",color='black')
plt.hold(False)

#plt.plot(x,y,"o",color='darkgray')
#plt.plot(x,y,"o")

#plt.title(title)

xmin,xmax = 0,400
ymin,ymax = 0,400

#loglog
#xmin,xmax = 0.001,500
#ymin,ymax = 00.001,500

ax = plt.gca()
ax.set_ylim(ymin=ymin)
ax.set_xlim(xmin=xmin)
ax.set_ylim(ymax=ymax)
ax.set_xlim(xmax=xmax)

ax.set_xlabel(xlab)
ax.set_ylabel(ylab)

plt.axhline(y=1,color='black')
plt.axvline(x=1,color='black')

# Title
texty = 0.88
a = 0.00
if title==u'TGF${\\beta}$12 + VEGFA \n+ VIVIT':
    a = 0.08
plt.text(0.5, texty-a, title,
                           horizontalalignment='left',
                           fontsize=32,
                           transform = ax.transAxes)


# Label epithelial quadrant 
#plt.text(0.02, texty,"Epithelial",
#                                    horizontalalignment='left',
#                                    fontsize=28,
#                                    transform = ax.transAxes)

# Label mesenchymal quadrant 
#plt.text(0.7, 0.1, "Mesenchymal",
#                                    horizontalalignment='left',
#                                    fontsize=28,
#                                    transform = ax.transAxes)

#r1=plt.Rectangle( (xmin,1), 1-xmin,ymax ,color='gray',alpha=0.2,zorder=1)
#r2=plt.Rectangle( (1,ymin), xmax,1-ymin ,color='orange',alpha=0.2,zorder=1)


#ax.add_patch(r1)
#ax.add_patch(r2)

plt.xticks(np.arange(xmin, xmax+1, 100))
plt.yticks(np.arange(ymin, ymax+1, 100))
           

plt.rcParams.update({'font.size': 32})
plt.tight_layout(pad=0.2, w_pad=0.5, h_pad=1.0)
