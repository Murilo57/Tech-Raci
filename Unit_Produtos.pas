unit Unit_Produtos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, ComCtrls, FMTBcd, DB, DBClient, Provider, SqlExpr,
  Menus, ExtCtrls, StdCtrls;

type
  TFrmProdutos = class(TForm)
    PageCentro: TPageControl;
    TSprodutos: TTabSheet;
    GridProdutos: TDBGrid;
    sqlProdutos: TSQLDataSet;
    dspProdutos: TDataSetProvider;
    cdsProdutos: TClientDataSet;
    dtsProdutos: TDataSource;
    PnlTop: TPanel;
    PnlProdutos: TPanel;
    LblProdutos: TLabel;
    PnlLogo: TPanel;
    Image1: TImage;
    MainMenu1: TMainMenu;
    Configuraes1: TMenuItem;
    Novo1: TMenuItem;
    Abrir1: TMenuItem;
    N1: TMenuItem;
    Salvar1: TMenuItem;
    SalvarTudo1: TMenuItem;
    N2: TMenuItem;
    Sair1: TMenuItem;
    Usurios1: TMenuItem;
    Administradores1: TMenuItem;
    Funcionarios1: TMenuItem;
    Clientes2: TMenuItem;
    Clientes1: TMenuItem;
    Cadastrar1: TMenuItem;
    Registros1: TMenuItem;
    Excluir1: TMenuItem;
    Produtos1: TMenuItem;
    Vendidos1: TMenuItem;
    Estoque1: TMenuItem;
    GBFiltro: TGroupBox;
    CboxConsulta: TComboBox;
    EdtConsulta: TEdit;
    BtnConsulta: TButton;
    BtnLimpar: TButton;
    cdsProdutosID: TIntegerField;
    cdsProdutosCODFISCAL: TStringField;
    cdsProdutosTIPO: TStringField;
    cdsProdutosDESCRICAO: TStringField;
    cdsProdutosCUSTO: TFMTBCDField;
    cdsProdutosLUCRO: TFMTBCDField;
    cdsProdutosVALORUNIT: TFMTBCDField;
    cdsProdutosINATIVO: TStringField;
    procedure BtnLimparClick(Sender: TObject);
    procedure BtnConsultaClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmProdutos: TFrmProdutos;

implementation

{$R *.dfm}

procedure TFrmProdutos.BtnConsultaClick(Sender: TObject);
begin
  if EdtConsulta.Text = '' then
    begin
      Application.MessageBox('O campo de consulta está vazio, preencha para prosseguir', 'Error', MB_ICONERROR+MB_OKCANCEL);
      Exit;
    end;
  cdsProdutos.Close;
  sqlProdutos.CommandText := 'SELECT ID, CODFISCAL, TIPO, DESCRICAO, CUSTO, LUCRO, VALORUNIT, INATIVO FROM CADPRODUTO WHERE TIPO = ''PRODUTO'' AND '+CboxConsulta.Text+' = '''+EdtConsulta.Text+'''';
//  ShowMessage(sqlProdutos.CommandText);
  cdsProdutos.Open;
end;

procedure TFrmProdutos.BtnLimparClick(Sender: TObject);
begin
  cdsProdutos.Close;
  sqlProdutos.CommandText := 'SELECT ID, CODFISCAL, TIPO, DESCRICAO, CUSTO, LUCRO, VALORUNIT, INATIVO FROM CADPRODUTO WHERE TIPO =  ''PRODUTO''';
  cdsProdutos.Open;

end;

procedure TFrmProdutos.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  //Para quando fechar o programa ele ser deslocado da memória e não ficar rodando em segundo plano sem necessidade
  FrmProdutos.Free;
end;

procedure TFrmProdutos.FormCreate(Sender: TObject);
begin
  //Ao abrir a pagina de Produtos a primeira pagina a ativar da PageCentro é a TSPRODUTOS
  cdsProdutos.Open;
  PageCentro.ActivePage := TSprodutos;
end;

end.
