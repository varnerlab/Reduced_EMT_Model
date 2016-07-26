execfile('/home/dbassen/Dropbox/pyprgs/in_out_line.py')

read = lin.reader('edit_file_global.jl')
old = lin.writer('old_edit_file_global.jl_old',read)

comments = [line for line in read if line.count("#") == 1 and line.count("=")>=1 and line.index("#") > line.index("=") and line.count("push")==0 and line.count("index")==1]

comments = []
lnums = []
for line,i in zip(read,range(len(read))):
    if line.count("#") == 1 and line.count("=")>=1 and line.index("#") > line.index("=") and line.count("push")==0 and line.count("index")==1:
        comments.append(line)
        lnums.append(i)
                      

comments = comments[2:] # get rid of initial condition indeces 
lnums = lnums[2:]
# retrieve value strings that need indeces

search = []
for line in comments:
    hash   = line.index('#')
    eq     = line.index('=')
    index  = int ( line[eq+2:hash-1] )
    string = line[hash+2:]
    print(index,string)
    search.append((index,string))

read_df = lin.reader('DataFile.jl')

# get new indecies 

cnt = 0
indeces = []
for x in search:
    for line in read_df:
        if x[1] in line and 'saturation' not in line:
            print('x[1]',x[1])
            cnt = cnt + 1 
            hash   = line.index('#')            
            tmp    = line[hash:]
            tab    = tmp.index('\t')
            new_index = int ( tmp[2:tab] )
            print(line,new_index)
            indeces.append(new_index)

print cnt

comments_2 = comments[:]

read2 = read[:]

for i,new_index in zip(lnums,indeces):
    hash   = read[i].index('#')
    eq     = read[i].index('=')
    print(read[i][eq+2:hash-1]) # old value
    print(read[i][:eq+1]+' '+str(new_index)+' '+read[i][hash:])
    read2[i] = read[i][:eq+1]+' '+str(new_index)+' '+read[i][hash:]
    #= new_index

lin.writer('edit_file_global.jl',read2)
