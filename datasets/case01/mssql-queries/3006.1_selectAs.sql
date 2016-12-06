-- MS SQL version of test query infile with same name in https://github.com/lsst/qserv_testdata.git/trunk/datasets/case02/queries


-- Test support for multiple ORDER BY fields

SELECT ra_PS AS ra,
       decl_PS AS decl
FROM Object
WHERE ra_PS BETWEEN 0. AND 1.
    AND decl_PS BETWEEN 0. AND 1.
ORDER BY ra, decl
