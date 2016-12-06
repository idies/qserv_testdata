-- MS SQL version of test query infile with same name in https://github.com/lsst/qserv_testdata.git/trunk/datasets/case02/queries

-- Select object with IZ magnitude greater than a constant
-- https://dev.lsstcorp.org/trac/wiki/db/Qserv/IN2P3/BenchmarkMarch2013
-- Based on https://dev.lsstcorp.org/trac/wiki/db/queries/051

-- pragma sortresult
SELECT objectId, ra_PS, decl_PS,
        uFlux_PS, gFlux_PS, rFlux_PS, 
        iFlux_PS, zFlux_PS, yFlux_PS 
 FROM Object
 WHERE dbo.scisql_fluxToAbMag(iFlux_PS)
       - dbo.scisql_fluxToAbMag(zFlux_PS) > 0.08