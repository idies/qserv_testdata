-- MS SQL version of test query infile with same name in https://github.com/lsst/qserv_testdata.git/trunk/datasets/case02/queries

-- Count the number of object with a color flux greater than a constant
-- See https://dev.lsstcorp.org/trac/wiki/db/Qserv/IN2P3/BenchmarkMarch2013
-- Based on https://dev.lsstcorp.org/trac/wiki/db/queries/026

SELECT COUNT(*) AS OBJ_COUNT
 FROM Object
 WHERE gFlux_PS>1e-25
