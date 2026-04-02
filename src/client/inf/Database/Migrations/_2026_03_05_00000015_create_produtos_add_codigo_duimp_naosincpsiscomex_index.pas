unit _2026_03_05_00000015_create_produtos_add_codigo_duimp_naosincpsiscomex_index;

interface

uses
{PROJECT}
  cbsMigrations.Support.Migration;

type
  CreateProdutosAddCodigoDuimpNaoSincPSiscomexIndex = class(TMigration)
  protected
    procedure Up(const ASchema: IMigrationBuilder); override;
    procedure Down(const ASchema: IMigrationBuilder); override;
  end;

implementation

uses
{PROJECT}
  duimp.inf.Database.MigrationContext;

{ CreateProdutosAddCodigoDuimpNaoSincPSiscomexIndex }

procedure CreateProdutosAddCodigoDuimpNaoSincPSiscomexIndex.Up(const ASchema: IMigrationBuilder);
begin
  ASchema.CreateIndex('Produtos',
    ['Codigo_DUIMP', 'NaoSincPSiscomex'],
    ['Codigo', 'Descricao', 'Descricao_Reduzida']
  );
end;

procedure CreateProdutosAddCodigoDuimpNaoSincPSiscomexIndex.Down(const ASchema: IMigrationBuilder);
begin
  ASchema.DropIndex('IX_Produtos_Codigo_DUIMP_NaoSincPSiscomex');
end;

initialization
begin
  RegisterMigration(TClientMigration, CreateProdutosAddCodigoDuimpNaoSincPSiscomexIndex);
end;

end.
