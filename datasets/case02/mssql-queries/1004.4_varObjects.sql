-- MS SQL version of test query infile with same name in https://github.com/lsst/qserv_testdata.git/trunk/datasets/case02/queries


-- Select all variable objects in given area
-- http://dev.lsstcorp.org/trac/wiki/dbQuery008


-- NOTE INCORRECT POLYGON SPEC
DECLARE @poly VARBINARY(MAX)
SET @poly = region.Parse( N'REGION POLY J2000  0 0 3 10 0 5 3 1' )


SELECT objectId
FROM   Object
WHERE region.ContainsEq( @poly, ra_PS, decl_PS ) > 0
-- withQserv WHERE qserv_areaspec_poly(0, 0, 3, 10, 0, 5, 3, 1)
--   AND variability > 0.8
ORDER BY objectId
