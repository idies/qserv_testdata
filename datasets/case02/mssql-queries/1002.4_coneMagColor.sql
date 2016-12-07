-- MS SQL version of test query infile with same name in https://github.com/lsst/qserv_testdata.git/trunk/datasets/case02/queries
-- 

-- Cone-magnitude-color search
-- See http://dev.lsstcorp.org/trac/wiki/db/queries/003

-- See ticket #2051


DECLARE @poly VARBINARY(MAX)
SET @poly = region.Parse( N'REGION POLY J2000 1.0 3.0 1.5 2.0 2.0 4.0' )


SELECT COUNT(*) AS OBJ_COUNT
FROM   [Object] 
WHERE region.ContainsEq( @poly, ra_PS, decl_PS ) > 0
   AND dbo.scisql_fluxToAbMag(zFlux_PS) BETWEEN 20 AND 24
   AND dbo.scisql_fluxToAbMag(gFlux_PS)-dbo.scisql_fluxToAbMag(rFlux_PS) BETWEEN 0.1 AND 0.6
   AND dbo.scisql_fluxToAbMag(iFlux_PS)-dbo.scisql_fluxToAbMag(zFlux_PS) BETWEEN 0.1 AND 0.6


