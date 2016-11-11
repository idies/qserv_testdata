IF EXISTS (
    SELECT * FROM sysobjects WHERE id = object_id(N'scisql_fluxToAbMag') 
    AND xtype IN (N'FN', N'IF', N'TF')
)
    DROP FUNCTION scisql_fluxToAbMag
GO

CREATE FUNCTION scisql_fluxToAbMag (@flux float) RETURNS float AS BEGIN
RETURN  -2.5 * log10(@flux) - 48.6;
END

GO

IF EXISTS (
    SELECT * FROM sysobjects WHERE id = object_id(N'spDist') 
    AND xtype IN (N'FN', N'IF', N'TF')
)
    DROP FUNCTION spDist
GO

create function spDist(@ra1 float,@decl1 float, @ra2 float , @decl2 float) returns float 
as
begin
return @ra1-@ra2
end

GO


-- need porting function for scisql_s2PtInCircle(ra_PS, decl_PS, 1.2, 3.2, 0.5) = 1 