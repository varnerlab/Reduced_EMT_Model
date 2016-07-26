# Program to parse raw output from Control.jl print statements for plotting in R

execfile('/Users/dbassen/Dropbox/pyprgs/in_out_line.py')
execfile('/Users/dbassen/Dropbox/code/arg_beaster.py')

if exp == "no input":
    raw=lin.reader('output_tmp')
    print('WARNING LOADED DEFAULT')
    outname = 'output_delim'
else:
    raw=lin.reader(exp)
    outname = exp+'_delim'


outlines = []
outlines.append('AVERAGE,cNFATc,cpSmad,cSnailSlug,cActive_LEF1,pSmad,LEF1,Active_LEF1,TGFB3_R,Active_TCF4,Ecadherin,Ecadherin_Bcatenin,APC_AXIN_Bcatenin,tmp,YREG1,SNAIL_SLUG,test')

for x in raw:
    if x.count('[')!=0:
        newstr = x.replace("[", "")
        newstr = newstr.replace("]", "")
        outlines.append(newstr)

lin.writer(outname,outlines)
