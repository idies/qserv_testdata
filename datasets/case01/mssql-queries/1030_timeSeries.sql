-- MS SQL version of test query infile with same name in https://github.com/lss


t/qserv_testdata.git/trunk/datasets/case02/queries
-- Select time series data for all objects 
-- in a given area of the sky, 
-- in a given photometric band 
-- Similar query: http://dev.lsstcorp.org/trac/wiki/dbQuery007

-- See ticket #2052: https://dev.lsstcorp.org/trac/ticket/2052

-- pragma noheader
SELECT o.objectId, taiMidPoint, dbo.scisql_fluxToAbMag(psfFlux)
FROM   Source s
       JOIN   Object o ON s.objectId = o.objectId
       JOIN   Filter f ON f.filterId = s.filterId
 WHERE ra_PS BETWEEN 355 AND 360 -- noQserv
   and decl_PS BETWEEN 0 AND 20  -- noQserv
-- withQserv WHERE qserv_areaspec_box(355, 0, 360, 20)
   AND filterName = 'g'
ORDER BY objectId, taiMidPoint ASC
