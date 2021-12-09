unit funcionario;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uFunc, Vcl.ExtCtrls, Data.DB,
  Vcl.StdCtrls, Vcl.Grids, Vcl.DBGrids;

type
  TfrmFuncionario = class(TForm)
    pnlFundo: TPanel;
    pnlTitle: TPanel;
    pnlRodape: TPanel;
    pnlListaFunc: TPanel;
    pnlDependentes: TPanel;
    pnlAcaoFunc: TPanel;
    DBGrid1: TDBGrid;
    pnlManDadosFunc: TPanel;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    Button5: TButton;
    Button6: TButton;
    Button7: TButton;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmFuncionario: TfrmFuncionario;

implementation

{$R *.dfm}

end.
