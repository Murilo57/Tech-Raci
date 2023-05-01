unit Unt_Fornecedor;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, ComCtrls, FMTBcd, DB, DBClient, Provider, SqlExpr,
  Menus, ExtCtrls, StdCtrls;

type
  TFrmFornecedor = class(TForm)
    PageCentro: TPageControl;
    TSfornecedor: TTabSheet;
    GridCentro: TDBGrid;
    sqlFornecedor: TSQLDataSet;
    dspFornecedor: TDataSetProvider;
    cdsFornecedor: TClientDataSet;
    dtsFornecedor: TDataSource;
    PnlTop: TPanel;
    PnlProdutos: TPanel;
    LblFornecedor: TLabel;
    PnlLogo: TPanel;
    ImgCaminhao: TImage;
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
    EdtConsulta: TEdit;
    BtnConsulta: TButton;
    CboxConsulta: TComboBox;
    BtnLimpar: TButton;
    cdsFornecedorID: TIntegerField;
    cdsFornecedorFANTASIA: TStringField;
    cdsFornecedorRAZAOSOCIAL: TStringField;
    cdsFornecedorCNPJ: TStringField;
    cdsFornecedorDDD: TStringField;
    cdsFornecedorTELEFONE: TStringField;
    cdsFornecedorINATIVO: TDateField;
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
  FrmFornecedor: TFrmFornecedor;

implementation

{$R *.dfm}

procedure TFrmFornecedor.BtnConsultaClick(Sender: TObject);
begin
  if EdtConsulta.Text = '' then
    begin
      Application.MessageBox('O campo de Consulta est� v�zio, preencha para prosseguir', 'Error', MB_ICONERROR+MB_OKCANCEL);
      Exit;
    end;
  cdsFornecedor.Close;
  sqlFornecedor.CommandText := 'SELECT ID, FANTASIA, RAZAOSOCIAL, CNPJ, DDD, TELEFONE, INATIVO FROM CADFORNECEDOR WHERE '+CboxConsulta.Text+' = '''+EdtConsulta.Text+'''';
  cdsFornecedor.Open;
end;

procedure TFrmFornecedor.BtnLimparClick(Sender: TObject);
begin
  cdsFornecedor.Close;
  sqlFornecedor.CommandText := 'SELECT ID, FANTASIA, RAZAOSOCIAL, CNPJ, DDD, TELEFONE, INATIVO FROM CADFORNECEDOR';
  cdsFornecedor.Open;
end;

procedure TFrmFornecedor.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FrmFornecedor.free;
end;

procedure TFrmFornecedor.FormCreate(Sender: TObject);
begin
    cdsFornecedor.Open;
    PageCentro.ActivePage := TSfornecedor;
end;

end.
