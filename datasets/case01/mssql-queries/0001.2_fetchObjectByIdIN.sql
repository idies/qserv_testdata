-- MS SQL version of test query infile with same name in https://github.com/lsst/qserv_testdata.git/trunk/datasets/case02/queries


-- Find objects with a particular object ids
-- http://dev.lsstcorp.org/trac/wiki/dbQuery009

-- pragma sortresult
select ra_Ps, decl_PS
FROM Object
WHERE objectId IN (390034570102582, 396210733076852, 393126946553816, 390030275138483)
