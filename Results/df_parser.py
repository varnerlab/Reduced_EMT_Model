# requires execfile("in_out_line.py")

execfile('../pyprgs/in_out_line.py') #
execfile('../pyprgs/in_out_csv.py') #

def parse_DataFile(linlist):
    species = []
    for LINE in linlist:
        if '\t#\t' in LINE:
            i=LINE.index('\t#\t')
            species.append( LINE[i:].split('\t')[2:] ) # take from i till end and produce a list

        if 'time constant array' in LINE:
            break
    return species

def parse_XSS(linlist):
    outlines = []
    for LINE in linlist:
        outlines.append( LINE.split('\t') )
    return outlines


datfile_path = '../src/DataFile.jl'
#datfile_path = '/Users/dbassen/work/KwateeServer-v1.0/src/DataFile.jl'
#print('WARNING CHANGE DATAFILE PATH TO GEN SPECIES NAMES')
print('-- using gen_2_model/src/DataFile.jl')
#datfile_path = '/Users/dbassen/Dropbox/server_swap_space/gen_1_model/src/DataFile.jl'
DataFile = lin.reader(datfile_path)

species = parse_DataFile(DataFile)

species_OUT = [x[1] for x in species]
csv.out("df_names.dat",species_OUT) # 

species2 = []

for x in species_OUT:
    if x.count("gene") >0:
        species2.append(["gene",x])
    elif x == "RIBOSOME" or x == "RNAP" or x == "PPase":
        species2.append(["reg",x])
    elif x.count("virus") > 0:
        species2.append(["virus",x])
    elif x.count("mRNA") >0:
        species2.append(["mRNA",x])
    else:
        species2.append(["protein",x])
head = [["species_type","species_name"]]

species2 = head+species2

csv.out("df_names_r.csv",species2)
