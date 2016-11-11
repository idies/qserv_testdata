-- MS SQL version of test query infile with same name in https://github.com/lsst/qserv_testdata.git/trunk/datasets/case02/queries
-- needs a function spDist that calculates the sperical distance between two points on the sphere and 

-- Select transient variable objects near a known galaxy
-- http://dev.lsstcorp.org/trac/wiki/dbQuery015

-- we don't have variability and extendedParamer columns



declare @objectId bigint = 1234567
declare @dist float = 0.1


SELECT v.objectId, v.ra_PS, v.decl_PS
FROM   [Object] v, [Object] o
WHERE  o.objectId = @objectId
   AND dbo.spDist(v.ra_PS, v.decl_PS, o.ra_PS, o.decl_PS) < @dist
   AND v.variability > 0.8
   AND o.extendedParameter > 0.8

