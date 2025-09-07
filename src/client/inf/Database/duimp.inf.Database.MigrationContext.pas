unit duimp.inf.Database.MigrationContext;

interface

uses
{PROJECT}
  cbsMigrationsFireDac.Support.MigrationContext;

type
  TClientMigration = class(TFDMigrationContext);
  TRegisterMigration = class(TFDMigrationContext);

implementation

end.
