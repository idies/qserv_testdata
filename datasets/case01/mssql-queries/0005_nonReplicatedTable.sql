-- MS SQL version of test query infile with same name in https://github.com/lsst/qserv_testdata.git/trunk/datasets/case02/queries


-- trivial query, should return one row (some cleverness
-- is needed to execute this query on one node only!)

-- pragma sortresult
SELECT offset, mjdRef, drift 
FROM LeapSeconds 
where 
    offset = 10
