unit Unt_Prestador;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, ExtCtrls, StdCtrls, FMTBcd, DB, Menus, DBClient, Provider,
  SqlExpr, Grids, DBGrids;

type
  TFrmPrestador = class(TForm)
    PnlTop: TPanel;
    PnlProdutos: TPanel;
    LblPrestador: TLabel;
    PnlLogo: TPanel;
    ImgPrestador: TImage;
    PageCentro: TPageControl;
    TsConsulta: TTabSheet;
    gbFiltro: TGroupBox;
    CboxConsulta: TComboBox;
    EdtConsulta: TEdit;
    BtnConsulta: TButton;
    DBGrid1: TDBGrid;
    sqlPrestador: TSQLDataSet;
    dspPrestador: TDataSetProvider;
    cdsPrestador: TClientDataSet;
    dtsPrestador: TDataSource;
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
    BtnLimpar: TButton;
    cdsPrestadorID: TIntegerField;
    cdsPrestadorFANTASIA: TStringField;
    cdsPrestadorRAZAOSOCIAL: TStringField;
    cdsPrestadorCNPJ: TStringField;
    cdsPrestadorDDD: TStringField;
    cdsPrestadorTELEFONE: TStringField;
    cdsPrestadorDATACAD: TDateField;
    procedure BtnLimparClick(Sender: TObject);
    procedure BtnConsultaClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmPrestador: TFrmPrestador;

implementation

{$R *.dfm}

procedure TFrmPrestador.BtnConsultaClick(Sender: TObject);
begin
  if EdtConsulta.Text = '' then
    begin
      Application.MessageBox ('O campo de Consulta está vazio, preencha para prosseguir', 'Error', MB_ICONERROR+MB_OKCANCEL);
      Exit;
    end;

  //Fecha o ClienteDataSet que esta ativo e aberto
  cdsPrestador.Close;
  //Atualiza com o Select concatenando a informação da ComboBox e do Edit
  sqlPrestador.CommandText := 'SELECT ID, FANTASIA, RAZAOSOCIAL, CNPJ, DDD, TELEFONE, DATACAD FROM CADPRESTADOR WHERE '+CboxConsulta.Text+' = '''+EdtConsulta.Text+'''';
  //Abre novamente e exibe o ClientDataSet com a tabela atualizada com o SELECT a cima
  cdsPrestador.open;

end;

procedure TFrmPrestador.BtnLimparClick(Sender: TObject);
begin
  cdsPrestador.Close;
  sqlPrestador.CommandText := 'SELECT ID, FANTASIA, RAZAOSOCIAL, CNPJ, DDD, TELEFONE, DATACAD FROM CADPRESTADOR';
  cdsPrestador.Open;
end;

procedure TFrmPrestador.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  //Ao fechar a aba ela sera desalocada da memória para não ficar rodando em segundo plano sem necessidade
  FrmPrestador.Free;
end;

procedure TFrmPrestador.FormCreate(Sender: TObject);
begin
  //Ao abrir a pagina chame o ClienteDataSet da tabela Prestador
  cdsPrestador.Open;
  //A  primeira pagina do centro a ser chamada é a TableSheet Consulta
  PageCentro.ActivePage := TsConsulta;
end;

end.
