-- MS SQL version of test query infile with same name in https://github.com/lsst/qserv_testdata.git/trunk/datasets/case02/queries


-- Cone-magnitude-color search
-- See http://dev.lsstcorp.org/trac/wiki/db/queries/003

DECLARE @circle VARBINARY(MAX)
SET @circle = sph.fSimplifyString( 'REGION CIRCLE J2000 72.5, 3.25, 0.6' )

/*
DECLARE @circle VARBINARY(MAX)
SET @circle = dbo.Region::Parse( 'REGION CIRCLE J2000 72.5, 3.25, 0.6' )
*/
 
-- pragma sortresult
SELECT COUNT(*) AS OBJ_COUNT
FROM   Object o
 CROSS APPLY dbo.fHtmEqToXyz( ra_PS, decl_PS ) p 
WHERE 
   sph.fRegionContainsXYZ( @circle, p.x, p.y, p.z ) > 0  
-- region.ContainsEq(@circle, ra_PS, decl_PS) > 0 -- noQserv
-- withQserv WHERE qserv_areaspec_circle(72.5, 3.25, 0.6)
   AND dbo.scisql_fluxToAbMag(zFlux_PS) BETWEEN 20 AND 24
   AND dbo.scisql_fluxToAbMag(gFlux_PS)-scisql_fluxToAbMag(rFlux_PS) BETWEEN 0.1 AND 0.9
   AND dbo.scisql_fluxToAbMag(iFlux_PS)-scisql_fluxToAbMag(zFlux_PS) BETWEEN 0.1 AND 1.0
