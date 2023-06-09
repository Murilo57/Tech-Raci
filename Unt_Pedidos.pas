unit Unt_Pedidos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, ComCtrls, ExtCtrls, StdCtrls, FMTBcd, DB, Menus,
  DBClient, Provider, SqlExpr;

type
  TFrmPedidos = class(TForm)
    PnlTop: TPanel;
    PnlProdutos: TPanel;
    LblPedidos: TLabel;
    PnlLogo: TPanel;
    ImgList: TImage;
    PageCentro: TPageControl;
    TsConsulta: TTabSheet;
    GridPedidos: TDBGrid;
    sqlPedidos: TSQLDataSet;
    dspPedidos: TDataSetProvider;
    cdsPedidos: TClientDataSet;
    dtsPedidos: TDataSource;
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
    cdsPedidosID: TIntegerField;
    cdsPedidosID_CLIENTE: TIntegerField;
    cdsPedidosNUM_PEDIDO: TStringField;
    cdsPedidosDATA: TDateField;
    cdsPedidosFRETE: TFMTBCDField;
    cdsPedidosVALOR: TFMTBCDField;
    cdsPedidosID_VENDEDOR: TIntegerField;
    cdsPedidosVALOR_PRODUTOS: TFMTBCDField;
    procedure BtnLimparClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BtnConsultaClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmPedidos: TFrmPedidos;

implementation

{$R *.dfm}

procedure TFrmPedidos.BtnConsultaClick(Sender: TObject);
begin
  if EdtConsulta.Text = '' then
    begin
      Application.MessageBox('O campo Consulta est� vazio, preencha para prosseguir', 'Error', MB_ICONERROR+MB_OKCANCEL);
      Exit;
    end;
  cdsPedidos.Close;
  sqlPedidos.CommandText := 'SELECT ID, ID_CLIENTE, NUM_PEDIDO, DATA, FRETE, VALOR, ID_VENDEDOR, VALOR_PRODUTOS FROM PEDIDO WHERE '+CboxConsulta.Text+' = '''+EdtConsulta.Text+'''';
  cdsPedidos.Open;
end;

procedure TFrmPedidos.BtnLimparClick(Sender: TObject);
begin
  cdsPedidos.Close;
  sqlPedidos.CommandText := 'SELECT ID, ID_CLIENTE, NUM_PEDIDO, DATA, FRETE, VALOR, ID_VENDEDOR, VALOR_PRODUTOS FROM PEDIDO';
  cdsPedidos.Open;
end;

procedure TFrmPedidos.FormClose(Sender: TObject; var Action: TCloseAction);
begin
    //Para ao fechar o programa ele ser desalocado da mem�ria e n�o ficar rodando em segundo plano
    FrmPedidos.Free;
end;

procedure TFrmPedidos.FormCreate(Sender: TObject);
begin
    //Para ao abrir a pagina de Pedidos e chamar a tabela de CLIENTDATASET
    cdsPedidos.Open;
    //Para ativar a PageCentro e a primeira TableSheet dela abrir � a TSCONSULTA
    PageCentro.ActivePage := TsConsulta;
end;

end.
