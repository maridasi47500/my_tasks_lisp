import subprocess
import os
from fichier import Fichier
class Scriptpython:
    def __init__(self,name):
        self.name=name
    def lancer(self):
        x=subprocess.check_output(["sh","./uploads/lancer_"+self.name.replace(".","")+".sh"])
        return x
    def lancer1(self):
        matermin=self.name.split(".")[-1]
        myprogram=""
        if matermin == "rb":
            myprogram="ruby"
        if matermin == "scm":
            myprogram="scheme < "
        if matermin == "cl":
            myprogram="sbcl --script "
        if matermin == "php":
            myprogram="php"
        if matermin == "py":
            myprogram="python3"
        wow=self.name.rfind("/")
        monfichier=Fichier("./uploads","lancer_"+self.name.replace("/","").replace(".","")+".sh").ecrire("""xterm  -fa 'Monospace' -fs 20 -l -hold -e "cd {myroot}/uploads && echo \\\"c'est  mon script\\\" && bash -l -c \\\"cat ./{name};echo '\n'; {program} ./{name}\\\""
                """.format(myroot=os.getcwd(),name=self.name,program=myprogram))
        x=subprocess.check_output(["sh","./uploads/lancer_"+self.name.replace("/","").replace(".","")+".sh"])

        return x

