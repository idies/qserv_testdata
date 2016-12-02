-- MS SQL version of test query infile with same name in https://github.com/lsst/qserv_testdata.git/trunk/datasets/case02/queries
-- 
-- Select all variable objects in given area
-- http://dev.lsstcorp.org/trac/wiki/dbQuery008


DECLARE @circle VARBINARY(MAX)
SET @circle = region.Parse( N'REGION CIRCLE J2000 1.5 3 15' )

SELECT objectId
FROM   [Object] 
WHERE region.ContainsEq( @circle, ra_PS, decl_PS) > 0

-- withQserv WHERE qserv_areaspec_circle(1.5, 3, 1)
--   AND variability > 0.8
ORDER BY objectId
