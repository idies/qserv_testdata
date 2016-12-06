-- MS SQL version of test query infile with same name in https://github.com/lsst/qserv_testdata.git/trunk/datasets/case02/queries


-- Test ORDER BY ... LIMIT ... against 
-- non-chunked data

SELECT TOP 5
   filterId, filterName
FROM   Science_Ccd_Exposure 
WHERE  
   visit = 887404831
   AND raftName = '3,3'
   AND ccdName LIKE '%'
ORDER BY filterId
