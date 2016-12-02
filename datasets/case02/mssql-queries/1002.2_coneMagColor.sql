-- MS SQL version of test query infile with same name in https://github.com/lsst/qserv_testdata.git/trunk/datasets/case02/queries

-- Cone-magnitude-color search
-- See https://dev.lsstcorp.org/trac/wiki/db/queries/003

-- See ticket #2051

DECLARE @circle VARBINARY(MAX)
SET @circle = region.Parse( 'REGION CIRCLE J2000 1.2749 3.179 1.5' )

SELECT COUNT(*) AS OBJ_COUNT
FROM   [Object] 
WHERE  region.ContainsEq( @circle, ra_PS, decl_PS) > 0 -- noQserv
-- withQserv WHERE qserv_areaspec_circle(1.2, 3.2, 0.5)
   AND dbo.scisql_fluxToAbMag(zFlux_PS) BETWEEN 20 AND 24
   AND dbo.scisql_fluxToAbMag(gFlux_PS)-dbo.scisql_fluxToAbMag(rFlux_PS) BETWEEN 0.1 AND 0.6
   AND dbo.scisql_fluxToAbMag(iFlux_PS)-dbo.scisql_fluxToAbMag(zFlux_PS) BETWEEN 0.1 AND 0.6



