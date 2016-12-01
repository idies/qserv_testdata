-- Cone-magnitude-color search
-- See http://dev.lsstcorp.org/trac/wiki/db/queries/003

-- See ticket #2051


SELECT COUNT(*) AS OBJ_COUNT
FROM   Object
WHERE  ra_PS BETWEEN 0 AND 4  -- noQserv
 AND   decl_PS BETWEEN -6 AND -5 -- noQserv
-- withQserv WHERE qserv_areaspec_box(0, -6, 4, -5)
   AND dbo.scisql_fluxToAbMag(zFlux_PS) BETWEEN 20 AND 24
   AND dbo.scisql_fluxToAbMag(gFlux_PS)-dbo.scisql_fluxToAbMag(rFlux_PS) BETWEEN 0.1 AND 0.2
   AND dbo.scisql_fluxToAbMag(iFlux_PS)-dbo.scisql_fluxToAbMag(zFlux_PS) BETWEEN 0.1 AND 0.2
