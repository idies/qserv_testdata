-- MS SQL version of test query infile with same name in https://github.com/lsst/qserv_testdata.git/trunk/datasets/case02/queries


-- Join Object and Source on a given object and for a given time interval
-- https://dev.lsstcorp.org/trac/wiki/db/Qserv/IN2P3/BenchmarkMarch2013
-- Based on https://dev.lsstcorp.org/trac/wiki/db/queries/006

-- pragma sortresult
SELECT s.ra, s.decl
FROM   Object o
       JOIN   Source s ON s.objectId = o.objectId
WHERE  o.objectId = 433327840429024
       AND o.latestObsTime BETWEEN s.taiMidPoint - 300 
       AND s.taiMidPoint + 300
