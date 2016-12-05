This folder contains java classes that:
- translate DDLs from MySQL to MS SQL form and execute them against the configured database 
- copy *.gz data files from data  folder to mssql-data folder, replaces '\N' characters with empty, and loads them using BULK INSERT statemetn
- executes test queries in mssql-queries
- returns log of all results to screen

Check and if necessary update the database connection properties in the default controller in the Database.java class.

To compile run following from within this folder, possibly changing the classpath separator to the one appropriate for your OS.
Also ensure the java version of the system is compatible with the specified JDBC driver.
If not replace the provided sqljdbc41.jar file with an appropriate alternative. 
> javac -cp ./src/;lib/sqljdbc41.jar src/*.java

To run, run following from within this folder:
> java -cp ./src/.;lib/sqljdbc41.jar Translator C:/workspaces/git/LSST/idies-qserv_testdata/datasets/case02
