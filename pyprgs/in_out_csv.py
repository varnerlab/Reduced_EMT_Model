import csv as csv2
class csv_dp:
    
##    backupdir = ''
    
    def In(self, FileName): 
        f = open(FileName,"rb") 
        reader = csv2.reader(f,delimiter=",")
        out = []
        for row in reader:
            out.append(row)            
        f.close()
        return out
    
    def out(self, FileName, linelist):
        f = open(FileName,'wb')
        c = csv2.writer(f,delimiter=',')
        for lin in linelist:
            if type(lin) != type([]) and lin != []:#solves solve entry per line problem
                c.writerow([lin])
            else:
                c.writerow(lin)
        f.close()

    def Indir(self, MetaFname, path):
        fnames = self.In(path+MetaFname)
        files = []
        for x in fnames:
            files.append(self.In(x[0]))
        return files

##### From old data processing class (somewhat of a design redundency)
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

##    def overwrite(self,OldFileName,NewFileName,Backup_T_F):
##    
##        if backup == 'True':
##            self.out(self.backupdir+'/backup_'+OldFileName)
##            
##        self.out(old,self.In(new))
        
csv = csv_dp()

