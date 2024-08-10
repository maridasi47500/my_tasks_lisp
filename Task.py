
from chaine import Chaine
from script import Script
from fichier import Fichier
dbScript=Script()
# import required module
import os
# assign directory
directory1 = './the-little-schemer'
directory2 = './examples'
directory3 = './exercises'
 
# iterate over files in
welcome="<h1>Become 1 programmer</h1>"
welcome+="<div class=\"home\">"
welcome+="<h2>"+directory1+"</h2>"
title=""
content=""
define=""
welcome1=""
paspremier=False
# that directory
for filename in os.listdir(directory1+'/'):
    f = os.path.join(directory1, filename)
    # checking if it is a file
    if os.path.isfile(f):
        print(f)
        x=f.rfind("/") + 1
        nfile=f[x:]
        name=f[x:(len(f) - 3)]
        title=""
        content=""
        script=""
        welcome1=""
        define=""
        paspremier=False
        for y in Fichier(f[0:x],nfile).lire().split("\n"):
            if "(" not in y and y.strip() != "" and "==>" not in y and y.strip() != ";" and ")" not in y and "Chapter" not in y and "See" not in y and "-----------" not in y:
                title=y.replace(";","").replace("\n","").replace("\n","")
                welcome1=""

            elif y.strip() == "" and welcome1 == "":
                k=dbScript.create({"name":name,"file":f,"title":title,"content":define+content})
                if "define" in content:
                    define+=content
                welcome1="\n<a id=\"monscript"+str(k["script_id"])+"\" href=\"/script/"+str(k["script_id"])+"\">"+title+"</a>"
                welcome+=welcome1
                content=""
            elif ";" not in y.split(";")[0]:
                if paspremier:
                    content+="\n"
                content+=y
                
                paspremier=True


    else:
        print(f)
welcome+="</div>"
print(welcome)
Fichier("./welcome","home.html").ecrire(welcome)
