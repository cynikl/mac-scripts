sourcefile = "/Volumes/bob/Users/cyril/Desktop/afpdeletedfiles.txt" 
filename2 = "/Volumes/bob/Users/cyril/Desktop/afpdeletedfilesreduced.txt" 

offending = ["Spotlight"]

def fixup( filename ): 
    fin = open( filename ) 
    fout = open( filename2 , "w") 
      for line in fin: 
        if True in [item in line for item in offending]:
            continue
        fout.write(line)
    fin.close() 
    fout.close() 

fixup(sourcefile)