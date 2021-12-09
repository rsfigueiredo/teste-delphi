unit funcionario;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uFunc, Vcl.ExtCtrls, Data.DB,
  Vcl.StdCtrls, Vcl.Grids, Vcl.DBGrids, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, Vcl.Mask, Vcl.DBCtrls;

type
  TfrmFuncionario = class(TForm)
    pnlFundo: TPanel;
    pnlTitle: TPanel;
    pnlRodape: TPanel;
    pnlListaFunc: TPanel;
    pnlDependentes: TPanel;
    pnlAcaoFunc: TPanel;
    dbgridDadosFunc: TDBGrid;
    pnlManDadosFunc: TPanel;
    btnNewFunc: TButton;
    btnAlteraDependentes: TButton;
    btnExcluirFunc: TButton;
    btnEditFunc: TButton;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    dsDadosFunc: TDataSource;
    dsDadosDependentes: TDataSource;
    Panel1: TPanel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    DBEdit4: TDBEdit;
    dbgridDadosDependentes: TDBGrid;
    pnlBtnSalvaFunc: TPanel;
    btnCancelFunc: TButton;
    btnSalvaFunc: TButton;
    pnlBtnManDependentes: TPanel;
    btnNewDependente: TButton;
    btnEditDependente: TButton;
    btnCancelDependente: TButton;
    btnSalvaDependente: TButton;
    DBLookupComboBox1: TDBLookupComboBox;
    DBLookupComboBox2: TDBLookupComboBox;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmFuncionario: TfrmFuncionario;

implementation

{$R *.dfm}

uses udmCon;

end.
