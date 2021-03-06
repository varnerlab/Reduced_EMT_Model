# take linear julia list of lists and convert to julia array format

execfile('../pyprgs/in_out_line.py')
execfile('../pyprgs/in_out_csv.py')

dat1 = lin.reader("../poets/results_poets/cross_validation/EC1.dat")
dat2 = lin.reader("../poets/results_poets/cross_validation/EC2.dat")
dat3 = lin.reader("../poets/results_poets/cross_validation/EC3.dat")
dat4 = lin.reader("../poets/results_poets/cross_validation/EC4.dat")
dat5 = lin.reader("../poets/results_poets/cross_validation/EC5.dat")
dat6 = lin.reader("../poets/results_poets/cross_validation/EC6.dat")
dat7 = lin.reader("../poets/results_poets/cross_validation/EC7.dat")
dat8 = lin.reader("../poets/results_poets/cross_validation/EC8.dat")
dat9 = lin.reader("../poets/results_poets/cross_validation/EC9.dat")
dat10 = lin.reader("../poets/results_poets/cross_validation/EC10.dat")
dat11 = lin.reader("../poets/results_poets/cross_validation/EC11.dat")
# map X1 (size e.g. 772) to x1 within x2 from X2 (size 11)

def julia_listlist_to_array(dat):
    dat_new = [[],[],[],[],[],[],[],[],[],[],[]] # number of objectives (x2space)
    counter = 0
    for LINE in dat:
        if LINE.count('[') == 1:
            counter = 0
        dat_new[counter].append(LINE.replace('[','').replace(']',''))
        counter = counter + 1
    outlines = []
    for LIST in dat_new:
        outlines.append('\t'.join(LIST))
    return outlines 

outlines = julia_listlist_to_array(dat1)
lin.writer("../poets/results_poets/cross_validation/EC1_jl_array.dat",outlines)
outlines = julia_listlist_to_array(dat2)
lin.writer("../poets/results_poets/cross_validation/EC2_jl_array.dat",outlines)
outlines = julia_listlist_to_array(dat3)
lin.writer("../poets/results_poets/cross_validation/EC3_jl_array.dat",outlines)
outlines = julia_listlist_to_array(dat4)
lin.writer("../poets/results_poets/cross_validation/EC4_jl_array.dat",outlines)
outlines = julia_listlist_to_array(dat5)
lin.writer("../poets/results_poets/cross_validation/EC5_jl_array.dat",outlines)
outlines = julia_listlist_to_array(dat6)
lin.writer("../poets/results_poets/cross_validation/EC6_jl_array.dat",outlines)
outlines = julia_listlist_to_array(dat7)
lin.writer("../poets/results_poets/cross_validation/EC7_jl_array.dat",outlines)
outlines = julia_listlist_to_array(dat8)
lin.writer("../poets/results_poets/cross_validation/EC8_jl_array.dat",outlines)
outlines = julia_listlist_to_array(dat9)
lin.writer("../poets/results_poets/cross_validation/EC9_jl_array.dat",outlines)
outlines = julia_listlist_to_array(dat10)
lin.writer("../poets/results_poets/cross_validation/EC10_jl_array.dat",outlines)
outlines = julia_listlist_to_array(dat11)
lin.writer("../poets/results_poets/cross_validation/EC11_jl_array.dat",outlines)


# need to reformat random as well
datr = lin.reader("../poets/results_poets/random_set/EC.dat")

outlines = julia_listlist_to_array(datr)
lin.writer("../poets/results_poets/random_set/EC_jl_array.dat",outlines)

datrf = lin.reader("../poets/results_poets/random_set/EC_full.dat")

outlines = julia_listlist_to_array(datrf)
lin.writer("../poets/results_poets/random_set/EC_full_jl_array.dat",outlines)


#for line in dat:
#    dat_new.append([float(string.replace('[' ,'').replace(']',''))  for string in line])

#datx = lin.reader("../poets/results_poets/cross_validation/fold_pop_obj_1/EC.dat")




