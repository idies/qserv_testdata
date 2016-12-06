-- MS SQL version of test query infile with same name in https://github.com/lsst/qserv_testdata.git/trunk/datasets/case02/queries


-- this query exercises secondary index in an interesting way:
-- because Qserv needs to figure out what the director table
-- is and use it when setting up its secondary index.
--- This query returns some rows.

SELECT sourceId, objectId
FROM Source
WHERE 
    objectId IN (386942193651348)
ORDER BY sourceId

