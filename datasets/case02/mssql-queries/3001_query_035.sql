-- MS SQL version of test query infile with same name in https://github.com/lsst/qserv_testdata.git/trunk/datasets/case02/queries

-- Select object based on flux interval
-- https://dev.lsstcorp.org/trac/wiki/db/Qserv/IN2P3/BenchmarkMarch2013
-- Based on https://dev.lsstcorp.org/trac/wiki/db/queries/013

-- pragma sortresult
SELECT  objectId
FROM    Object
WHERE   dbo.scisql_fluxToAbMag(uFlux_PS)-dbo.scisql_fluxToAbMag(gFlux_PS) <  2.0
   AND  dbo.scisql_fluxToAbMag(gFlux_PS)-dbo.scisql_fluxToAbMag(rFlux_PS) <  0.1
   AND  dbo.scisql_fluxToAbMag(rFlux_PS)-dbo.scisql_fluxToAbMag(iFlux_PS) > -0.8
   AND  dbo.scisql_fluxToAbMag(iFlux_PS)-dbo.scisql_fluxToAbMag(zFlux_PS) <  1.4 
