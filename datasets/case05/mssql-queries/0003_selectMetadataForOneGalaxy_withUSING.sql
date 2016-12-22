-- MS SQL version of test query infile with same name in https://github.com/lsst/qserv_testdata.git/trunk/datasets/case02/queries


-- select the full color image of a single given galaxy
-- http://dev.lsstcorp.org/trac/wiki/dbQuery006

-- pragma sortresult
SELECT s.ra, s.decl, o.raRange, o.declRange
FROM   Object o
  JOIN Source s ON o.objectId = s.objectId
WHERE  o.objectId = 433327840428032 
-- AND    o.latestObsTime = s.taiMidPoint
