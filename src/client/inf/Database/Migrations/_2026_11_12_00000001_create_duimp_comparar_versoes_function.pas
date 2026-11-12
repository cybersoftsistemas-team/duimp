unit _2026_11_12_00000001_create_duimp_comparar_versoes_function;

interface

uses
  cbsMigrations.Support.Migration;

type
  CreateDuimpCompararVersoesFunction = class(TMigration)
  protected
    procedure Up(const ASchema: IMigrationBuilder); override;
    procedure Down(const ASchema: IMigrationBuilder); override;
  end;

implementation

uses
  duimp.inf.Database.MigrationContext;

procedure CreateDuimpCompararVersoesFunction.Up(const ASchema: IMigrationBuilder);
begin
  ASchema.Sql(
    'CREATE FUNCTION [duimp].[CompararVersoes](@A nvarchar(max), @B nvarchar(max)) ' +
    'RETURNS int ' +
    'AS ' +
    'BEGIN ' +
    '    DECLARE @RestA nvarchar(max) = ISNULL(@A, N''''), @RestB nvarchar(max) = ISNULL(@B, N''''); ' +
    '    DECLARE @PartA nvarchar(max), @PartB nvarchar(max), @PosA int, @PosB int, @LenA int, @LenB int; ' +
    '    WHILE DATALENGTH(@RestA) > 0 OR DATALENGTH(@RestB) > 0 ' +
    '    BEGIN ' +
    '        SET @PosA = CHARINDEX(N''.'', @RestA); SET @PosB = CHARINDEX(N''.'', @RestB); ' +
    '        IF @PosA = 0 SET @PosA = DATALENGTH(@RestA) / 2 + 1; ' +
    '        IF @PosB = 0 SET @PosB = DATALENGTH(@RestB) / 2 + 1; ' +
    '        SET @PartA = LEFT(@RestA, @PosA - 1); SET @PartB = LEFT(@RestB, @PosB - 1); ' +
    '        SET @RestA = SUBSTRING(@RestA, @PosA + 1, 9999); SET @RestB = SUBSTRING(@RestB, @PosB + 1, 9999); ' +
    '        IF DATALENGTH(@PartA) > 0 AND DATALENGTH(@PartB) > 0 ' +
    '           AND @PartA COLLATE Latin1_General_100_BIN2 NOT LIKE N''%[^0-9]%'' ' +
    '           AND @PartB COLLATE Latin1_General_100_BIN2 NOT LIKE N''%[^0-9]%'' ' +
    '        BEGIN ' +
    '            WHILE LEFT(@PartA, 1) = N''0'' AND DATALENGTH(@PartA) > 2 SET @PartA = SUBSTRING(@PartA, 2, 9999); ' +
    '            WHILE LEFT(@PartB, 1) = N''0'' AND DATALENGTH(@PartB) > 2 SET @PartB = SUBSTRING(@PartB, 2, 9999); ' +
    '            SET @LenA = DATALENGTH(@PartA); SET @LenB = DATALENGTH(@PartB); ' +
    '            IF @LenA > @LenB RETURN 1; ' +
    '            IF @LenA < @LenB RETURN -1; ' +
    '        END; ' +
    '        IF @PartA COLLATE Latin1_General_100_BIN2 > @PartB COLLATE Latin1_General_100_BIN2 RETURN 1; ' +
    '        IF @PartA COLLATE Latin1_General_100_BIN2 < @PartB COLLATE Latin1_General_100_BIN2 RETURN -1; ' +
    '    END; ' +
    '    IF @A COLLATE Latin1_General_100_BIN2 > @B COLLATE Latin1_General_100_BIN2 RETURN 1; ' +
    '    IF @A COLLATE Latin1_General_100_BIN2 < @B COLLATE Latin1_General_100_BIN2 RETURN -1; ' +
    '    IF DATALENGTH(@A) > DATALENGTH(@B) RETURN 1; ' +
    '    IF DATALENGTH(@A) < DATALENGTH(@B) RETURN -1; ' +
    '    RETURN 0; ' +
    'END; ');
end;

procedure CreateDuimpCompararVersoesFunction.Down(const ASchema: IMigrationBuilder);
begin
  ASchema.Sql(
    'DROP FUNCTION [duimp].[CompararVersoes]; ');
end;

initialization
begin
  RegisterMigration(TClientMigration, CreateDuimpCompararVersoesFunction);
end;

end.
