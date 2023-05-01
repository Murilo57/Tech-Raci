unit Unt_TechRaci;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, jpeg, Buttons, ActnList, ImgList, Menus, FMTBcd,
  Grids, DBGrids, DB, DBClient, Provider, SqlExpr, ComCtrls;

type
  //Objeto - O objeto é o próprio formulario, \/ Daqui pra baixo é a Classe-base do formulario e suas propriedades
  TFrmMenu = class(TForm) // Classe-base do Objeto (Formulario)
    PnlTopo: TPanel;
    PnlMenu: TPanel;
    PnlBaixo: TPanel;                                          // Todas as propriedas de uma classe que definem o Objeto em si
    PnlCentro: TPanel;
    LogoCentral: TImage;
    PnlLogo: TPanel;
    LogoSuperior: TImage;
    PnlLicensa: TPanel;
    LblLcensiado: TLabel;
    LblEmpresaLicensiada: TLabel;
    PnlSAIR: TPanel;
    BtnSair: TSpeedButton;
    PnlUsuario: TPanel;
    PnlIMGUsuario: TPanel;
    Image1: TImage;
    LblUsuario: TLabel;
    LblADM: TLabel;
    BtnConfig: TSpeedButton;
    BtnProduto: TSpeedButton;
    BtnFornecedores: TSpeedButton;
    BtnCaixa: TSpeedButton;
    BtnClientes: TSpeedButton;
    PnlVersao: TPanel;
    LBLversao: TLabel;
    MainMenu1: TMainMenu;
    Configuraes1: TMenuItem;
    Novo1: TMenuItem;
    Abrir1: TMenuItem;
    N1: TMenuItem;
    Salvar1: TMenuItem;
    SalvarTudo1: TMenuItem;
    N2: TMenuItem;
    Sair1: TMenuItem;
    Clientes1: TMenuItem;
    Cadastrar1: TMenuItem;
    Registros1: TMenuItem;
    Excluir1: TMenuItem;
    Produtos1: TMenuItem;
    Vendidos1: TMenuItem;
    Estoque1: TMenuItem;
    Usurios1: TMenuItem;
    Administradores1: TMenuItem;
    Funcionarios1: TMenuItem;
    Clientes2: TMenuItem;
    BtnPedidos: TSpeedButton;
    BtnPrestador: TSpeedButton;
    BtnEstoque: TSpeedButton;
    procedure BtnEstoqueClick(Sender: TObject);
    procedure BtnPrestadorClick(Sender: TObject);
    procedure BtnCaixaClick(Sender: TObject);
    procedure BtnPedidosClick(Sender: TObject);
    procedure BtnProdutoClick(Sender: TObject);
    procedure BtnFornecedoresClick(Sender: TObject);
    procedure BtnClientesClick(Sender: TObject);
    procedure BtnSairClick(Sender: TObject);


  private

  public
    { Public declarations }
  end;

var
  FrmMenu: TFrmMenu;

implementation

uses conexao.tech, Unit_Produtos, Unt_Cliente, Unt_Fornecedor, Unt_Pedidos,
  Unt_Nota_Fiscal, Unt_Prestador, Unt_Estoque;

{$R *.dfm}



{ TForm1 }

procedure TFrmMenu.BtnCaixaClick(Sender: TObject);
begin
  FrmNotaFiscal := TFrmNotaFiscal.create(nil);
  FrmNotaFiscal.show;
end;

procedure TFrmMenu.BtnClientesClick(Sender: TObject);
begin
  FrmClientes := TFrmClientes.create(nil);
  FrmClientes.show;
  
end;

procedure TFrmMenu.BtnEstoqueClick(Sender: TObject);
begin
  FrmEstoque := TFrmEstoque.create(nil);
  FrmEstoque.show;
end;

procedure TFrmMenu.BtnFornecedoresClick(Sender: TObject);
begin
  FrmFornecedor := TFrmFornecedor.create(nil);
  FrmFornecedor.show;
end;

procedure TFrmMenu.BtnPedidosClick(Sender: TObject);
begin
  FrmPedidos := TFrmPedidos.create(nil);
  FrmPedidos.show;
end;

procedure TFrmMenu.BtnPrestadorClick(Sender: TObject);
begin
  FrmPrestador := TFrmPrestador.create(nil);
  FrmPrestador.show;
end;

procedure TFrmMenu.BtnProdutoClick(Sender: TObject);
begin
  FrmProdutos := TfrmProdutos.create(nil);
  FrmProdutos.show;
end;

procedure TFrmMenu.BtnSairClick(Sender: TObject);
  begin
  Application.Terminate;

  end;


  end.



