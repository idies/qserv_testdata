from __future__ import print_function
import os
import pymysql
import gzip
import shutil




def main():

    #cleanup()
    compress_files('.sue')

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


def compress_files(extension=".dat"):
    rootDir = '.'
    for dirName, subdirList, fileList in os.walk(rootDir):
        #print('Found directory: %s' % dirName)
        parts = os.path.split(dirName)
        if parts[1] == "mssql-fixed-data":
            dlist = [d for d in os.listdir(dirName) if d.endswith(extension)]
            for d in dlist:
                print("compressing %s" % (os.path.join(dirName, d)))
                #os.remove( (os.path.join(dirName, d)))
                with open (os.path.join(dirName,d), "rb") as f_in, gzip.open(os.path.join(dirName,d+".gz"), "wb") as f_out:

                    shutil.copyfileobj(f_in, f_out)
                    print("removing %s" % (os.path.join(dirName, d)))
                    os.remove( (os.path.join(dirName, d)))


def export_data():

    connection = pymysql.connect(host='qserv01',
                                 user='capnsue',
                                 password='test',
                                 port='13306',
                                 db='suedb')

    try:
        with connection.cursor() as cursor:

            #execute the SP, get result table back
            sql = 'call exportMysql2MSSQL()'
            result = cursor.execute(sql)

            nrows = result.fetchall().length

            print("%s files exported", nrows)

    finally:
        connection.close()


























if __name__ == '__main__':
    main()
