
IF (OBJECT_ID('region.ConvexHullXyz') IS NOT NULL)
BEGIN
    DROP AGGREGATE [region].[ConvexHullXyz]
END

GO


IF (OBJECT_ID('region.ConvexHullEq') IS NOT NULL)
BEGIN
    DROP AGGREGATE [region].[ConvexHullEq]
END

GO


IF (OBJECT_ID('region.IntersectEvery') IS NOT NULL)
BEGIN
    DROP AGGREGATE [region].[IntersectEvery]
END

GO


IF (OBJECT_ID('region.UnionEvery') IS NOT NULL)
BEGIN
    DROP AGGREGATE [region].[UnionEvery]
END

GO


IF (OBJECT_ID('point.AvgXyz') IS NOT NULL)
BEGIN
    DROP AGGREGATE [point].[AvgXyz]
END

GO


IF (OBJECT_ID('point.AvgEq') IS NOT NULL)
BEGIN
    DROP AGGREGATE [point].[AvgEq]
END

GO


IF (OBJECT_ID('htmid.Parse') IS NOT NULL)
BEGIN
    DROP FUNCTION [htmid].[Parse]
END

GO


IF (OBJECT_ID('htmid.ToString') IS NOT NULL)
BEGIN
    DROP FUNCTION [htmid].[ToString]
END

GO


IF (OBJECT_ID('htmid.FromXyz') IS NOT NULL)
BEGIN
    DROP FUNCTION [htmid].[FromXyz]
END

GO


IF (OBJECT_ID('htmid.FromEq') IS NOT NULL)
BEGIN
    DROP FUNCTION [htmid].[FromEq]
END

GO


IF (OBJECT_ID('htmid.FromRange') IS NOT NULL)
BEGIN
    DROP FUNCTION [htmid].[FromRange]
END

GO


IF (OBJECT_ID('htmid.GetLevel') IS NOT NULL)
BEGIN
    DROP FUNCTION [htmid].[GetLevel]
END

GO


IF (OBJECT_ID('htmid.GetCenter') IS NOT NULL)
BEGIN
    DROP FUNCTION [htmid].[GetCenter]
END

GO


IF (OBJECT_ID('htmid.GetCorners') IS NOT NULL)
BEGIN
    DROP FUNCTION [htmid].[GetCorners]
END

GO


IF (OBJECT_ID('htmid.GetTriangle') IS NOT NULL)
BEGIN
    DROP FUNCTION [htmid].[GetTriangle]
END

GO


IF (OBJECT_ID('point.EqToXyz') IS NOT NULL)
BEGIN
    DROP FUNCTION [point].[EqToXyz]
END

GO


IF (OBJECT_ID('point.XyzToEq') IS NOT NULL)
BEGIN
    DROP FUNCTION [point].[XyzToEq]
END

GO


IF (OBJECT_ID('point.GetAngleXyz') IS NOT NULL)
BEGIN
    DROP FUNCTION [point].[GetAngleXyz]
END

GO


IF (OBJECT_ID('point.GetAngleEq') IS NOT NULL)
BEGIN
    DROP FUNCTION [point].[GetAngleEq]
END

GO


IF (OBJECT_ID('region.Parse') IS NOT NULL)
BEGIN
    DROP FUNCTION [region].[Parse]
END

GO


IF (OBJECT_ID('region.ParseAdvanced') IS NOT NULL)
BEGIN
    DROP FUNCTION [region].[ParseAdvanced]
END

GO


IF (OBJECT_ID('region.ToString') IS NOT NULL)
BEGIN
    DROP FUNCTION [region].[ToString]
END

GO


IF (OBJECT_ID('region.ToUdt') IS NOT NULL)
BEGIN
    DROP FUNCTION [region].[ToUdt]
END

GO


IF (OBJECT_ID('region.HasError') IS NOT NULL)
BEGIN
    DROP FUNCTION [region].[HasError]
END

GO


IF (OBJECT_ID('region.Error') IS NOT NULL)
BEGIN
    DROP FUNCTION [region].[Error]
END

GO


IF (OBJECT_ID('region.Area') IS NOT NULL)
BEGIN
    DROP FUNCTION [region].[Area]
END

GO


IF (OBJECT_ID('region.ContainsXyz') IS NOT NULL)
BEGIN
    DROP FUNCTION [region].[ContainsXyz]
END

GO


IF (OBJECT_ID('region.ContainsEq') IS NOT NULL)
BEGIN
    DROP FUNCTION [region].[ContainsEq]
END

GO


IF (OBJECT_ID('region.Difference') IS NOT NULL)
BEGIN
    DROP FUNCTION [region].[Difference]
END

GO


IF (OBJECT_ID('region.DifferenceAdvanced') IS NOT NULL)
BEGIN
    DROP FUNCTION [region].[DifferenceAdvanced]
END

GO


IF (OBJECT_ID('region.Union') IS NOT NULL)
BEGIN
    DROP FUNCTION [region].[Union]
END

GO


IF (OBJECT_ID('region.UnionAdvanced') IS NOT NULL)
BEGIN
    DROP FUNCTION [region].[UnionAdvanced]
END

GO


IF (OBJECT_ID('region.Intersect') IS NOT NULL)
BEGIN
    DROP FUNCTION [region].[Intersect]
END

GO


IF (OBJECT_ID('region.IntersectAdvanced') IS NOT NULL)
BEGIN
    DROP FUNCTION [region].[IntersectAdvanced]
END

GO


IF (OBJECT_ID('region.Simplify') IS NOT NULL)
BEGIN
    DROP FUNCTION [region].[Simplify]
END

GO


IF (OBJECT_ID('region.SimplifyAdvanced') IS NOT NULL)
BEGIN
    DROP FUNCTION [region].[SimplifyAdvanced]
END

GO


IF (OBJECT_ID('region.Grow') IS NOT NULL)
BEGIN
    DROP FUNCTION [region].[Grow]
END

GO


IF (OBJECT_ID('region.ConvexHull') IS NOT NULL)
BEGIN
    DROP FUNCTION [region].[ConvexHull]
END

GO


IF (OBJECT_ID('region.AddHalfspace') IS NOT NULL)
BEGIN
    DROP FUNCTION [region].[AddHalfspace]
END

GO


IF (OBJECT_ID('region.GetArcs') IS NOT NULL)
BEGIN
    DROP FUNCTION [region].[GetArcs]
END

GO


IF (OBJECT_ID('region.GetOutlineArcs') IS NOT NULL)
BEGIN
    DROP FUNCTION [region].[GetOutlineArcs]
END

GO


IF (OBJECT_ID('region.GetConvexes') IS NOT NULL)
BEGIN
    DROP FUNCTION [region].[GetConvexes]
END

GO


IF (OBJECT_ID('region.GetHalfspaces') IS NOT NULL)
BEGIN
    DROP FUNCTION [region].[GetHalfspaces]
END

GO


IF (OBJECT_ID('region.GetPatches') IS NOT NULL)
BEGIN
    DROP FUNCTION [region].[GetPatches]
END

GO


IF (OBJECT_ID('htm.Cover') IS NOT NULL)
BEGIN
    DROP FUNCTION [htm].[Cover]
END

GO


IF (OBJECT_ID('htm.CoverAdvanced') IS NOT NULL)
BEGIN
    DROP FUNCTION [htm].[CoverAdvanced]
END

GO


IF (OBJECT_ID('htm.CoverString') IS NOT NULL)
BEGIN
    DROP FUNCTION [htm].[CoverString]
END

GO


IF (OBJECT_ID('htm.CoverCircleXyz') IS NOT NULL)
BEGIN
    DROP FUNCTION [htm].[CoverCircleXyz]
END

GO


IF (OBJECT_ID('htm.CoverCircleEq') IS NOT NULL)
BEGIN
    DROP FUNCTION [htm].[CoverCircleEq]
END

GO


IF (OBJECT_ID('arc.GreatCircleEq') IS NOT NULL)
BEGIN
    DROP FUNCTION [arc].[GreatCircleEq]
END

GO


IF (TYPE_ID('dbo.Arc') IS NOT NULL)
BEGIN
    DROP TYPE [dbo].[Arc]
END

GO


IF (TYPE_ID('dbo.Point') IS NOT NULL)
BEGIN
    DROP TYPE [dbo].[Point]
END

GO


IF (TYPE_ID('dbo.Region') IS NOT NULL)
BEGIN
    DROP TYPE [dbo].[Region]
END

GO


IF (SELECT COUNT(*) FROM sys.assemblies WHERE name = 'Jhu.Spherical.Sql') > 0
DROP ASSEMBLY [Jhu.Spherical.Sql]

GO


IF (SELECT COUNT(*) FROM sys.assemblies WHERE name = 'Jhu.Spherical.Htm') > 0
DROP ASSEMBLY [Jhu.Spherical.Htm]

GO


IF (SELECT COUNT(*) FROM sys.assemblies WHERE name = 'Jhu.Spherical') > 0
DROP ASSEMBLY [Jhu.Spherical]

GO


IF SCHEMA_ID('htmid') IS NOT NULL
DROP SCHEMA [htmid]

GO


IF SCHEMA_ID('point') IS NOT NULL
DROP SCHEMA [point]

GO


IF SCHEMA_ID('region') IS NOT NULL
DROP SCHEMA [region]

GO


IF SCHEMA_ID('htm') IS NOT NULL
DROP SCHEMA [htm]

GO


IF SCHEMA_ID('arc') IS NOT NULL
DROP SCHEMA [arc]

GO

