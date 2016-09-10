
# Plotting begins
Abundance = [x+0.001 for x in Abundance]
barlist= plt.bar(y_pos, Abundance, align='center', alpha=0.9,yerr=sds)

for i in range(len(objects)):
    barlist[i].set_color('black')

ax = plt.gca()
ax.xaxis.set_label_coords(-0.053, -0.18)
plt.xticks(y_pos, objects)
plt.rcParams.update({'font.size': 30})


plt.xlabel(xlab)
plt.ylabel('Scaled \nAbundance (0-1)')
#plt.ylabel('Abundance')
plt.title(title)
plt.tight_layout(pad=1.0, w_pad=1.0, h_pad=1.0)
#plt.tight_layout(pad=0.4, w_pad=0.5, h_pad=1.0)
