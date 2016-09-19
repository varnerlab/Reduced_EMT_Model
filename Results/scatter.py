(x,y) = build_lists(population,vim_index,ecad_index)

# plot

plt.loglog(x,y,"o",color='darkgray')
#plt.plot(x,y,"o")

#plt.title(title)

xmin,xmax = 10**-2,10**6
ymin,ymax = 10**-2,10**3

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
plt.text(0.7, 0.82, title,
                           horizontalalignment='left',
                           fontsize=32,
                           transform = ax.transAxes)

# Label e[ithelial quadrant 
plt.text(0.05, 0.82,"Epithelial",
                                    horizontalalignment='left',
                                    fontsize=28,
                                    transform = ax.transAxes)

# Label mesenchymal quadrant 
plt.text(0.7, 0.1, "Mesenchymal",
                                    horizontalalignment='left',
                                    fontsize=28,
                                    transform = ax.transAxes)

r1=plt.Rectangle( (xmin,1), 1-xmin,ymax ,color='orange',alpha=0.2,zorder=1)
r2=plt.Rectangle( (1,ymin), xmax,1-ymin ,color='gray',alpha=0.2,zorder=1)


ax.add_patch(r1)
ax.add_patch(r2)


plt.rcParams.update({'font.size': 32})
plt.tight_layout(pad=0.2, w_pad=0.5, h_pad=1.0)
