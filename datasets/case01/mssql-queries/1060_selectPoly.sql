-- MS SQL version of test query infile with same name in https://github.com/lsst/qserv_testdata.git/trunk/datasets/case02/queries


-- Basic test to return [VAR]BINARY data.

-- pragma sortresult
SELECT scienceCcdExposureId, poly as hexPoly   -- binary columns displayed in hex format by default 
FROM Science_Ccd_Exposure



