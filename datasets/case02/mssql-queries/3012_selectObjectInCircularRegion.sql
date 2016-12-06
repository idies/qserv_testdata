-- MS SQL version of test query infile with same name in https://github.com/lsst/qserv_testdata.git/trunk/datasets/case02/queries

-- Select object in a circular region
-- https://dev.lsstcorp.org/trac/wiki/db/Qserv/IN2P3/BenchmarkMarch2013


SELECT count(*) AS OBJ_COUNT
 FROM Object
 WHERE dbo.scisql_angSep(ra_PS, decl_PS, 1.2, 3.2) < 0.2