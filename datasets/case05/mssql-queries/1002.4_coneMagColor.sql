-- MS SQL version of test query infile with same name in https://github.com/lsst/qserv_testdata.git/trunk/datasets/case02/queries


-- Cone-magnitude-color search
-- See http://dev.lsstcorp.org/trac/wiki/db/queries/003

/*
DECLARE @poly VARBINARY(MAX)
SET @poly = dbo.Region::Parse( 'REGION POLY J2000 70, 3, 75, 3.5, 70, 4.0' )
*/
 
DECLARE @poly VARBINARY(MAX)
SET @poly = sph.fSimplifyString( 'REGION POLY J2000 70, 3, 75, 3.5, 70, 4.0' )


SELECT COUNT(*) AS OBJ_COUNT
FROM   Object o
   CROSS APPLY dbo.fHtmEqToXyz( ra_PS, decl_PS ) p 
WHERE 
   sph.fRegionContainsXYZ( @poly, p.x, p.y, p.z ) > 0
-- region.ContainsEq(@poly, ra_PS, decl_PS) > 0 -- noQserv
   AND dbo.scisql_fluxToAbMag(zFlux_PS) BETWEEN 20 AND 24
   AND (dbo.scisql_fluxToAbMag(gFlux_PS) - dbo.scisql_fluxToAbMag(rFlux_PS)) BETWEEN 0.1 AND 0.9
   AND (dbo.scisql_fluxToAbMag(iFlux_PS) - dbo.scisql_fluxToAbMag(zFlux_PS)) BETWEEN 0.1 AND 1.0