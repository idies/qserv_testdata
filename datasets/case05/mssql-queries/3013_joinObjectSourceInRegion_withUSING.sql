-- MS SQL version of test query infile with same name in https://github.com/lsst/qserv_testdata.git/trunk/datasets/case02/queries


-- Join Object/Source for all object in a region
-- https://dev.lsstcorp.org/trac/wiki/db/Qserv/IN2P3/BenchmarkMarch2013
-- Based on https://dev.lsstcorp.org/trac/ticket/2052

-- pragma sortresult
SELECT objectId 
FROM Source s
     JOIN Object o ON o.objectId = s.objectId 
WHERE ra_PS BETWEEN 1.28 AND 1.38
      AND decl_PS BETWEEN 3.18 AND 3.34

