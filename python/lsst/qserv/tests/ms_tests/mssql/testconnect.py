##jBN6kt3C4NZZfxpY / pytest / suetest

import pypyodbc


def main():

    cs16 = 'DRIVER={ODBC Driver 11 for SQL Server};SERVER=dsp016;DATABASE=suetest;UID=pytest;PWD=jBN6kt3C4NZZfxpY'
    cs18 = 'DRIVER={ODBC Driver 11 for SQL Server};SERVER=dsp018;DATABASE=suetest;UID=pytest;PWD=jBN6kt3C4NZZfxpY'

    print 'connecting to dsp016 (windows)'
    conn = pypyodbc.connect(cs16)

    cur = conn.cursor()
    result = cur.execute('select top 5 * from test1' )
    for (row) in result:
        print row

    cur.close()
    conn.close()

    print 'connecting to dsp018 (linux)'
    conn2 = pypyodbc.connect(cs18)

    cur2 = conn2.cursor()
    result2 = cur2.execute('select top 5 * from test1' )
    for (row) in result2:
        print row

    cur2.close()
    conn2.close()








if __name__ == '__main__':
    main()

