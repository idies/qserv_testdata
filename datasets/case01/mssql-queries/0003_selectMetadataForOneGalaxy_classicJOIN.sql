-- MS SQL version of test query infile with same name in https://github.com/lsst/qserv_testdata.git/trunk/datasets/case02/queries


-- pragma sortresult
SELECT s.ra, s.decl, o.raRange, o.declRange 
FROM Object o
     JOIN Source s ON (o.objectId = s.objectId AND o.latestObsTime = s.taiMidPoint;)
WHERE 
     o.objectId = 390034570102582
