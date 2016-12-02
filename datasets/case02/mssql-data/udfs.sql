IF EXISTS (
    SELECT * FROM sysobjects WHERE id = object_id(N'scisql_fluxToAbMag') 
    AND xtype IN (N'FN', N'IF', N'TF')
)
    DROP FUNCTION scisql_fluxToAbMag
GO

IF EXISTS (
    SELECT * FROM sysobjects WHERE id = object_id(N'spDist') 
    AND xtype IN (N'FN', N'IF', N'TF')
)
    DROP FUNCTION spDist
GO


IF EXISTS (
    SELECT * FROM sysobjects WHERE id = object_id(N'scisql_angSep') 
    AND xtype IN (N'FN', N'IF', N'TF')
)
    DROP FUNCTION scisql_angSep
GO


CREATE FUNCTION scisql_fluxToAbMag (@flux float) RETURNS float AS BEGIN
RETURN  -2.5 * log10(@flux) - 48.6;
END

GO


create function scisql_angSep(@ra1 float,@decl1 float, @ra2 float , @decl2 float) returns float 
as
begin
return acos(sin(@decl1)*sin(@decl2)+cos(@decl1)*cos(@decl2)*cos(@ra1-@ra2))
end

GO
create function spDist(@ra1 float,@decl1 float, @ra2 float , @decl2 float) returns float 
as
begin
return dbo.scisql_angSep(@ra1, @decl1, @ra2, @decl2)
end

GO




