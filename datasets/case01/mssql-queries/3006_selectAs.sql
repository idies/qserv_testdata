-- MS SQL version of test query infile with same name in https://github.com/lsst/qserv_testdata.git/trunk/datasets/case02/queries


SELECT ra_PS AS ra
FROM Object
WHERE ra_PS BETWEEN 0. AND 1.
    AND decl_PS BETWEEN 0. AND 1.
ORDER BY ra
