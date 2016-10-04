class line_dp:
    
    def reader(self,FileName): #puts each line of a file into an entry of a list, removing "\n"
        f = open(FileName,'r')
        out =[]
        i = 0
        for lin in f:
            out.append(lin)
            if out[i].count("\n") != 0: #removes "\n"
                out[i] = out[i].replace("\n","")
            i = i + 1

        numlines = len(out)
        return out

    def writer(self,FileName, linelist):
        f = open(FileName,'w')
        f.seek(0)
        for line in linelist:
            f.write(line)
            f.write("\n")
### Some handy tools
    def STR(self,linelist):
        ''' converts all elements in a list to strings '''
        out = []
        for x in linelist:
            out.append(str(x))
        return out

    def reducespaces(self,line): 
        ''' removes excessive spaces; separates  '''
        i = 0
        out = []
        for string in line:
            if line[i] == ' ' and line[i-1] == ' ':
                pass
            else:
                out.append(line[i])
            i = i + 1
        s_out = ''.join(out)
        ready_out = s_out.split(' ')
        return ready_out

    def redspfile(self,linelist):
        '''extension of reducespaces(): converts a linelist to a list of nested lists'''
        newlist = []
        for line in linelist:
            newlist.append(self.reducespaces(line)) #should be in line I/O
        return newlist

    def getlineslists(self,listnl):
        new = []
        for List in listnl:
            new.append(' '.join(List))
        return new

    def listToFlt(self,List):
        convert = []
        for y in List:
            try:
                convert.append(float(y))
            except:
                convert.append(y)
        #convert = [float(y) for y in List] #
        return convert

    def nestedToFlt(self,ListNestedLists):
        convert = ListNestedLists #placeholder
        i= 0 #counter
        for x in convert:
            convert[i]= self.listToFlt(x)#returns a list to replace the original 
            i = i + 1 #...nested list
        return convert

#    def Indir(self, path, ftype):
 #       return path, self.reader(path+'/'ftype+'_ls.dir')
        
            
lin = line_dp()
