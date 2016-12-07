-- MS SQL version of test query infile with same name in https://github.com/lss


t/qserv_testdata.git/trunk/datasets/case02/queries
-- interesting syntax

-- pragma sortresult
SELECT filterId, filterName
FROM   Science_Ccd_Exposure
WHERE  (visit = 887404831)
   AND (raftName = '3,3')
   AND (ccdName LIKE '%')
