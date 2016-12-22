-- MS SQL version of test query infile with same name in https://github.com/lsst/qserv_testdata.git/trunk/datasets/case02/queries


-- Cone-magnitude-color search
-- See http://dev.lsstcorp.org/trac/wiki/db/queries/003

-- pragma sortresult
SELECT COUNT(*) AS OBJ_COUNT
FROM   Object
WHERE  ra_PS BETWEEN 70 AND 75  -- noQserv
AND    decl_PS BETWEEN 3 AND 3.5 -- noQserv
-- withQserv WHERE qserv_areaspec_box(70, 3, 75, 3.5)
   AND dbo.scisql_fluxToAbMag(zFlux_PS) BETWEEN 20 AND 24
   AND dbo.scisql_fluxToAbMag(gFlux_PS)-scisql_fluxToAbMag(rFlux_PS) BETWEEN 0.1 AND 0.9
   AND dbo.scisql_fluxToAbMag(iFlux_PS)-scisql_fluxToAbMag(zFlux_PS) BETWEEN 0.1 AND 1.0
