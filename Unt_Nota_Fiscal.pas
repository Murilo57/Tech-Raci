unit Unt_Nota_Fiscal;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, ExtCtrls, StdCtrls, FMTBcd, DB, DBClient, Provider, SqlExpr,
  Grids, DBGrids, ComCtrls;

type
  TFrmNotaFiscal = class(TForm)
    PnlTop: TPanel;
    PnlProdutos: TPanel;
    LblNota: TLabel;
    PnlLogo: TPanel;
    ImgNota: TImage;
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
    PageCentro: TPageControl;
    tsConsulta: TTabSheet;
    gbNota: TGroupBox;
    DBGrid1: TDBGrid;
    sqlNF: TSQLDataSet;
    dspNF: TDataSetProvider;
    cdsNF: TClientDataSet;
    dtsNF: TDataSource;
    CboxConsulta: TComboBox;
    EdtConsulta: TEdit;
    BtnConsulta: TButton;
    BtnLimpar: TButton;
    cdsNFID: TIntegerField;
    cdsNFTIPODEST: TStringField;
    cdsNFDATA_EMISSAO: TDateField;
    cdsNFDATA_MOV: TDateField;
    cdsNFHORA_MOV: TTimeField;
    cdsNFNATUREZA_OPERACAO: TStringField;
    cdsNFPESOBRUTO: TFMTBCDField;
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
  FrmNotaFiscal: TFrmNotaFiscal;

implementation

{$R *.dfm}

procedure TFrmNotaFiscal.BtnConsultaClick(Sender: TObject);
begin
  if EdtConsulta.Text = '' then
    begin
      Application.MessageBox('O campo de Consulta está vazio, preencha para prosseguir', 'Error', MB_ICONERROR+MB_OKCANCEL);
      Exit;
    end;
    //Como a tabela ja esta aberta ao iniciar, esse comando a fecha para podermos atualizar a consulta com o Select
    cdsNF.close;
    //Comando para consulta com SQL concatenando as informações do ComboBox e do Edit.
    sqlNF.CommandText := 'SELECT ID, TIPODEST, DATA_EMISSAO, DATA_MOV, HORA_MOV, NATUREZA_OPERACAO, PESOBRUTO FROM NOTA_FISCAL WHERE '+CboxConsulta.Text+' = '''+EdtConsulta.Text+'''';
    //Comando para abrir a tabela e atualizada após o SELECT
    cdsNF.Open;
end;

procedure TFrmNotaFiscal.BtnLimparClick(Sender: TObject);
begin
  cdsNF.Close;
  sqlNF.CommandText := 'SELECT ID, TIPODEST, DATA_EMISSAO, DATA_MOV, HORA_MOV, NATUREZA_OPERACAO, PESOBRUTO FROM NOTA_FISCAL';
  cdsNF.Open;
end;

procedure TFrmNotaFiscal.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  //Ao fechar a tela é para desalocar da memória, para não ficar rodando em segundo plano sem utilidade
    FrmNotaFiscal.free;
end;

procedure TFrmNotaFiscal.FormCreate(Sender: TObject);
begin
    //Ao abrir a tela da Nota Fiscal a primeira pagina a ser ativada da PAGECENTRO´é a TSCONSULTA
    cdsNF.open;
    PageCentro.ActivePage := tsConsulta;
end;

end.
