(x,y) = build_lists(population,vim_index,ecad_index)

# plot

plt.loglog(x,y,"o",color='darkgray')
#plt.plot(x,y,"o",color='darkgray')
#plt.plot(x,y,"o")

#plt.title(title)

# original
xmin,xmax = 10**-2,10**6
ymin,ymax = 10**-2,10**3

# correct dosages and VEGf system
xmin,xmax = 10**-1,10**5
ymin,ymax = 10**-1,10**2



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
plt.text(0.7, texty-a, title,
                           horizontalalignment='left',
                           fontsize=32,
                           transform = ax.transAxes)


# Label epithelial quadrant 
plt.text(0.02, texty,"Epithelial",
                                    horizontalalignment='left',
                                    fontsize=28,
                                    transform = ax.transAxes)

# Label mesenchymal quadrant 
plt.text(0.7, 0.1, "Mesenchymal",
                                    horizontalalignment='left',
                                    fontsize=28,
                                    transform = ax.transAxes)

r1=plt.Rectangle( (xmin,1), 1-xmin,ymax ,color='gray',alpha=0.2,zorder=1)
r2=plt.Rectangle( (1,ymin), xmax,1-ymin ,color='orange',alpha=0.2,zorder=1)


ax.add_patch(r1)
ax.add_patch(r2)


plt.rcParams.update({'font.size': 32})
plt.tight_layout(pad=0.2, w_pad=0.5, h_pad=1.0)
