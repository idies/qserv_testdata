-- MS SQL version of test query infile with same name in https://github.com/lsst/qserv_testdata.git/trunk/datasets/case02/queries


-- Find an object with a particular object id
-- http://dev.lsstcorp.org/trac/wiki/dbQuery009

-- not working, see ticket #1847

-- pragma sortresult
SELECT *
FROM   Object
WHERE  objectId = 430213989000
