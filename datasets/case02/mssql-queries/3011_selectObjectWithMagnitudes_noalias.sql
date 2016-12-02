-- MS SQL version of test query infile with same name in https://github.com/lsst/qserv_testdata.git/trunk/datasets/case02/queries

-- Select object with magnitudes between 20 and 24
-- https://dev.lsstcorp.org/trac/wiki/db/Qserv/IN2P3/BenchmarkMarch2013
-- Based on https://dev.lsstcorp.org/trac/wiki/db/Qserv/OptimalPartitionSize

-- pragma noheader sortresult
SELECT objectId, ra_PS, decl_PS, 
       dbo.scisql_fluxToAbMag(zFlux_PS)
 FROM Object 
 WHERE dbo.scisql_fluxToAbMag(zFlux_PS)
       BETWEEN 20 AND 24
