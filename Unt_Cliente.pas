
  // Locate ... localiza o registro ...
//  cdsCliente.Locate(CboxConsulta.Text,EdtConsulta.Text,[]);



unit Unt_Cliente;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, ComCtrls, FMTBcd, DB, DBClient, Provider, SqlExpr,
  Menus, ExtCtrls, StdCtrls;

type
  TFrmClientes = class(TForm)
    PageCentro: TPageControl;
    TsConsulta: TTabSheet;
    GridFornecedor: TDBGrid;
    sqlCliente: TSQLDataSet;
    dspCliente: TDataSetProvider;
    cdsCliente: TClientDataSet;
    dtsCliente: TDataSource;
    PnlTop: TPanel;
    PnlProdutos: TPanel;
    LblClientes: TLabel;
    PnlLogo: TPanel;
    ImgClientes: TImage;
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
    GroupFiltro: TGroupBox;
    CboxConsulta: TComboBox;
    BtnConsulta: TButton;
    EdtConsulta: TEdit;
    BtnLimpar: TButton;
    cdsClienteID: TIntegerField;
    cdsClienteFANTASIA: TStringField;
    cdsClienteRAZAOSOCIAL: TStringField;
    cdsClienteCNPJ: TStringField;
    cdsClienteDDD: TStringField;
    cdsClienteTELEFONE: TStringField;
    cdsClienteTELEFONE_ZAP: TStringField;
    cdsClienteINATIVO: TDateField;
    Pnlrodape: TPanel;
    BtnCancelar: TButton;
    BtnExcluir: TButton;
    BtnSalvar: TButton;
    BtnAlterar: TButton;
    BtnInserir: TButton;
    procedure BtnCancelarClick(Sender: TObject);
    procedure BtnExcluirClick(Sender: TObject);
    procedure BtnAlterarClick(Sender: TObject);
    procedure BtnSalvarClick(Sender: TObject);
    procedure BtnInserirClick(Sender: TObject);
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
  FrmClientes: TFrmClientes;

implementation

{$R *.dfm}



procedure TFrmClientes.BtnAlterarClick(Sender: TObject);
begin
  cdsCliente.Edit;
end;

procedure TFrmClientes.BtnCancelarClick(Sender: TObject);
begin
  cdsCliente.Cancel;
end;

procedure TFrmClientes.BtnConsultaClick(Sender: TObject);
begin
  if EdtConsulta.Text = '' then
    begin
      Application.MessageBox ('O campo Consulta est� vazio, preencha para prosseguir', 'Error', MB_ICONERROR+MB_OKCANCEL);
      Exit;
    end;
    
  // Filtro com Sql ...
  cdsCliente.Close;
  sqlCliente.CommandText := 'SELECT ID, FANTASIA, RAZAOSOCIAL, CNPJ, DDD, TELEFONE, TELEFONE_ZAP, INATIVO FROM CADCLIENTE where '+CboxConsulta.Text+' = '''+EdtConsulta.Text+'''';
  //showMessage(sqlCliente.CommandText);   Para ver o comando SELECT na tela e poder testar no IBExpert
  cdsCliente.Open;

end;

procedure TFrmClientes.BtnExcluirClick(Sender: TObject);
begin
  cdsCliente.Delete;
  cdsCliente.ApplyUpdates(0);
end;

procedure TFrmClientes.BtnInserirClick(Sender: TObject);
begin
  cdsCliente.Append;
end;

procedure TFrmClientes.BtnLimparClick(Sender: TObject);
  begin
    cdsCliente.Close;
    sqlCliente.CommandText := 'SELECT ID, FANTASIA, RAZAOSOCIAL, CNPJ, DDD, TELEFONE, TELEFONE_ZAP, INATIVO FROM CADCLIENTE';
    cdsCliente.Open;
  end;

procedure TFrmClientes.BtnSalvarClick(Sender: TObject);
begin
  cdsCliente.Post;
  cdsCliente.ApplyUpdates(0);
end;

procedure TFrmClientes.FormClose(Sender: TObject; var Action: TCloseAction);
  begin
    //Para ao fechar a pagina ela seja desalocada da mem�ria, ao inv�s de ficar aberta na mem�ria sem sem utilizada
    FrmClientes.Free
  end;

procedure TFrmClientes.FormCreate(Sender: TObject);
begin

 //Comando para, ao abrir ir para primeira Table Sheet
 cdsCliente.Open;
 PageCentro.ActivePage := TsConsulta;
end;

end.
