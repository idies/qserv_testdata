-- MS SQL version of test query infile with same name in https://github.com/lsst/qserv_testdata.git/trunk/datasets/case02/queries
-- 

-- Cone-magnitude-color search
-- See http://dev.lsstcorp.org/trac/wiki/db/queries/003

-- See ticket #2051



DECLARE @poly VARBINARY(MAX)
SET @poly = sph.fSimplifyString( 'REGION POLY J2000 269.0 -0.1 270.0 -0.1 270.0 0.1 269.0 0.1' )

SELECT COUNT(*)
FROM #obj o
   CROSS APPLY dbo.fHtmEqToXyz( ra, [dec] ) p WHERE sph.fRegionContainsXYZ( @poly, p.x, p.y, p.z ) > 0

SELECT COUNT(*) AS OBJ_COUNT
FROM   Object
WHERE  scisql_s2PtInCPoly(ra_PS, decl_PS, 1.0, 3.0, 1.5, 2.0, 2.0, 4.0) = 1 -- noQserv
-- withQserv WHERE qserv_areaspec_poly(1.0, 3.0, 1.5, 2.0, 2.0, 4.0)
   AND dbo.scisql_fluxToAbMag(zFlux_PS) BETWEEN 20 AND 24
   AND dbo.scisql_fluxToAbMag(gFlux_PS)-dbo.scisql_fluxToAbMag(rFlux_PS) BETWEEN 0.1 AND 0.6
   AND dbo.scisql_fluxToAbMag(iFlux_PS)-dbo.scisql_fluxToAbMag(zFlux_PS) BETWEEN 0.1 AND 0.6
