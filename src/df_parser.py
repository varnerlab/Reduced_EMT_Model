# requires execfile("in_out_line.py")
execfile('../pyprgs/in_out_line.py')

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
datfile_path = '../src/DataFile.jl'
datfile_path = './DataFile.jl'

DataFile = lin.reader(datfile_path)

species = parse_DataFile(DataFile)
out = [x[1] for x in species]
out = 'newnames<-c('+str(out).replace("'",'"')[1:-1]+')'

lin.writer('names.dat',[out])
