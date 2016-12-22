-- MS SQL version of test query infile with same name in https://github.com/lsst/qserv_testdata.git/trunk/datasets/case02/queries


-- Count the number of Objects
-- https://dev.lsstcorp.org/trac/wiki/db/Qserv/IN2P3/BenchmarkMarch2013

-- pragma sortresult
SELECT count(*) AS OBJ_COUNT 
FROM Object
