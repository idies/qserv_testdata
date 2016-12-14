from __future__ import print_function
import os
import pymysql



def main():

    cleanup()

def cleanup():
    rootDir = '.'
    for dirName, subdirList, fileList in os.walk(rootDir):
        #print('Found directory: %s' % dirName)
        parts = os.path.split(dirName)
        if parts[1] == "mssql-fixed-data":
            dlist = [d for d in os.listdir(dirName)]
            for d in dlist:
                print("removing %s" % (os.path.join(dirName, d)))
                os.remove( (os.path.join(dirName, d)))
                #os.remove(os.join(dirName,d)









if __name__ == '__main__':
    main()
