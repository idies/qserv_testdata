-- MS SQL version of test query infile with same name in https://github.com/lss


t/qserv_testdata.git/trunk/datasets/case02/queries
-- Find near-neighbor objects in a given region


-- See ticket #1840
-- Test DM-1582: Qserv spatial restrictor names
--               must be case-insensitive

-- pragma sortresult
SELECT o1.objectId AS objId1,
       o2.objectId AS objId2,
       dbo.scisql_angSep(o1.ra_PS, o1.decl_PS, o2.ra_PS, o2.decl_PS) AS distance
  FROM Object o1
       JOIN Object o2 ON o1.objectId <> o2.objectId
 WHERE o1.ra_PS BETWEEN 0 AND 0.2 -- noQserv
   AND o1.decl_PS between 0 and 1 -- noQserv
-- withQserv WHERE qserv_areaspec_box(0, 0, 0.2, 1)
   AND dbo.scisql_angSep(o1.ra_PS, o1.decl_PS, o2.ra_PS, o2.decl_PS) < 0.05

