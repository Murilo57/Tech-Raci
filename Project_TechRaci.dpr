program Project_TechRaci;

uses
  Forms,
  Unt_TechRaci in 'Unt_TechRaci.pas' {FrmMenu},
  conexao.tech in 'conexao.tech.pas' {DataModule1: TDataModule},
  Unt_Cliente in 'Unt_Cliente.pas' {FrmClientes},
  Unt_Fornecedor in 'Unt_Fornecedor.pas' {FrmFornecedor},
  Unit_Produtos in 'Unit_Produtos.pas' {FrmProdutos},
  Unt_Pedidos in 'Unt_Pedidos.pas' {FrmPedidos},
  Unt_Nota_Fiscal in 'Unt_Nota_Fiscal.pas' {FrmNotaFiscal},
  Unt_Prestador in 'Unt_Prestador.pas' {FrmPrestador},
  Unt_Estoque in 'Unt_Estoque.pas' {FrmEstoque};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TFrmMenu, FrmMenu);
  Application.CreateForm(TDataModule1, DataModule1);
  Application.Run;
end.
