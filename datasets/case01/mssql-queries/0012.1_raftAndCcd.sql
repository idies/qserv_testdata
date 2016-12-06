-- MS SQL version of test query infile with same name in https://github.com/lsst/qserv_testdata.git/trunk/datasets/case02/queries


-- Test ORDER BY against non-chunked data

SELECT sce.filterId, sce.filterName
FROM   Science_Ccd_Exposure AS sce
WHERE  
   sce.visit = 887404831
   AND sce.raftName = '3,3'
   AND sce.ccdName LIKE '%'
ORDER BY filterId
