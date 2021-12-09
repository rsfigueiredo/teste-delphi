unit funcionario;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uFunc, Vcl.ExtCtrls, Data.DB, System.UITypes,
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
    dbedtNomeFun: TDBEdit;
    dbedtCPFFun: TDBEdit;
    dbedtSalarioFun: TDBEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    dsDadosFunc: TDataSource;
    dsDadosDependentes: TDataSource;
    pnlManDependente: TPanel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    dbedtNomeDep: TDBEdit;
    dbgridDadosDependentes: TDBGrid;
    pnlBtnSalvaFunc: TPanel;
    btnCancelFunc: TButton;
    btnSalvaFunc: TButton;
    pnlBtnManDependentes: TPanel;
    btnNewDependente: TButton;
    btnEditDependente: TButton;
    btnCancelDependente: TButton;
    btnSalvaDependente: TButton;
    dblkCalcINSSDep: TDBLookupComboBox;
    dblkCalcIRDep: TDBLookupComboBox;
    chkVerDependentes: TCheckBox;
    pnlCalcImpostos: TPanel;
    btnCalcIR: TButton;
    btnCalcINSS: TButton;
    edtCalcIR: TEdit;
    edtCalcINSS: TEdit;
    Label7: TLabel;
    Label8: TLabel;
    procedure chkVerDependentesClick(Sender: TObject);
    procedure chkVerDependentesKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure dsDadosFuncStateChange(Sender: TObject);
    procedure dsDadosDependentesStateChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnAlteraDependentesClick(Sender: TObject);
    procedure btnNewFuncClick(Sender: TObject);
    procedure dbedtNomeFunKeyPress(Sender: TObject; var Key: Char);
    procedure dbedtNomeDepKeyPress(Sender: TObject; var Key: Char);
    procedure KeyPress_soNumeros(Sender: TObject; var Key: Char);
    procedure btnEditFuncClick(Sender: TObject);
    procedure btnSalvaFuncClick(Sender: TObject);
    procedure btnCancelFuncClick(Sender: TObject);
    procedure btnExcluirFuncClick(Sender: TObject);
    procedure btnNewDependenteClick(Sender: TObject);
    procedure btnEditDependenteClick(Sender: TObject);
    procedure btnCancelDependenteClick(Sender: TObject);
    procedure btnSalvaDependenteClick(Sender: TObject);
    procedure btnCalcINSSClick(Sender: TObject);
    procedure dsDadosFuncDataChange(Sender: TObject; Field: TField);
    procedure btnCalcIRClick(Sender: TObject);
  private
    procedure ConfigBotoes;
    procedure ConfigBotoesDependentes;
    procedure CalculaINSS;
    procedure CalculaIR;
    procedure AtualizaListaDependentes;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmFuncionario: TfrmFuncionario;

implementation

{$R *.dfm}

uses udmCon;

procedure TfrmFuncionario.btnAlteraDependentesClick(Sender: TObject);
begin
  if dsDadosFunc.DataSet.State = dsInsert then
    raise Exception.Create('Por favor salve os dados do funcion�rio primeiro para depois adicionar um dependente.');

  pnlManDependente.Visible := chkVerDependentes.Checked;

  ConfigBotoesDependentes;
end;

procedure TfrmFuncionario.btnCalcINSSClick(Sender: TObject);
begin
  CalculaINSS;
end;

procedure TfrmFuncionario.btnCalcIRClick(Sender: TObject);
begin
  CalculaIR;
end;

procedure TfrmFuncionario.CalculaINSS;
var
  iCalc : Double;
  iQTDCalcINSS: Integer;
begin
  iQTDCalcINSS := 0;
  edtCalcINSS.Clear;
  dsDadosDependentes.DataSet.First;
  while not dsDadosDependentes.DataSet.Eof do
  begin
    if dsDadosDependentes.DataSet.FieldByName('db_iscalculainss').AsInteger = 1 then
    begin
      inc(iQTDCalcINSS);
    end;
    dsDadosDependentes.DataSet.Next;
  end;
  dsDadosDependentes.DataSet.First;

  if iQTDCalcINSS = 0 then
  begin
    edtCalcINSS.Text := 'R$ 0,00';
    exit;
  end;

  iCalc := dsDadosFunc.DataSet.FieldByName('fn_salario').AsFloat;
  iCalc := ((iCalc - (iQTDCalcINSS * 100)) / 100)*15 ;
  edtCalcINSS.Text := 'R$ '+FormatFloat('#,,#0.00', iCalc);
end;

procedure TfrmFuncionario.CalculaIR;
var
  iCalc : Double;
  bCalcIR : Boolean;
begin
  bCalcIR := False;
  edtCalcIR.Clear;
  dsDadosDependentes.DataSet.First;
  while not dsDadosDependentes.DataSet.Eof do
  begin
    if dsDadosDependentes.DataSet.FieldByName('db_iscalculair').AsInteger = 1 then
    begin
      bCalcIR := True;
      break;
    end;
    dsDadosDependentes.DataSet.Next;
  end;
  dsDadosDependentes.DataSet.First;

  if not bCalcIR then
  begin
    edtCalcIR.Text := 'R$ 0,00';
    exit;
  end;

  iCalc := dsDadosFunc.DataSet.FieldByName('fn_salario').AsFloat;
  iCalc := ((iCalc/100)*8);
  edtCalcIR.Text := 'R$ '+FormatFloat('#,,#0.00', iCalc);
end;

procedure TfrmFuncionario.btnCancelDependenteClick(Sender: TObject);
begin
  dsDadosDependentes.DataSet.Cancel;
  ConfigBotoesDependentes;
end;

procedure TfrmFuncionario.btnCancelFuncClick(Sender: TObject);
begin
  dsDadosFunc.DataSet.Cancel;
  ConfigBotoes;
end;

procedure TfrmFuncionario.btnEditDependenteClick(Sender: TObject);
begin
  dsDadosDependentes.DataSet.Edit;
  ConfigBotoesDependentes;
end;

procedure TfrmFuncionario.btnEditFuncClick(Sender: TObject);
begin
  dsDadosFunc.DataSet.Edit;
  ConfigBotoes;
end;

procedure TfrmFuncionario.btnExcluirFuncClick(Sender: TObject);
begin
  if not MessageDlg('Voc� tem certeza que deseja excluir o registro?',
                    mtConfirmation,
                    [mbyes,mbno],
                    0) = mryes then
    exit;
  dsDadosFunc.DataSet.Delete;
  ConfigBotoes;
end;

procedure TfrmFuncionario.btnNewDependenteClick(Sender: TObject);
begin
  dsDadosDependentes.DataSet.Insert;
  ConfigBotoesDependentes;
end;

procedure TfrmFuncionario.btnNewFuncClick(Sender: TObject);
begin
  dsDadosFunc.DataSet.Insert;
  ConfigBotoes;
end;

procedure TfrmFuncionario.btnSalvaDependenteClick(Sender: TObject);
begin
  if dsDadosDependentes.DataSet.FieldByName('db_nome').AsString.Length < 3 then
    raise Exception.Create('Nome � um campo obrigat�rio, por favor informe-o.'+sLineBreak+'No m�nimo 3 caracteres.');

  if dsDadosDependentes.DataSet.FieldByName('db_iscalculair').AsInteger < 1 then
    raise Exception.Create('Informe se o dependente calcula IR.');

  if dsDadosDependentes.DataSet.FieldByName('db_iscalculainss').AsInteger < 1 then
    raise Exception.Create('Informe se o dependente calcula INSS.');

  dsDadosDependentes.DataSet.Post;
  ConfigBotoesDependentes;
end;

procedure TfrmFuncionario.btnSalvaFuncClick(Sender: TObject);
begin
  if dsDadosFunc.DataSet.FieldByName('fn_nome').AsString.Length < 3 then
    raise Exception.Create('Nome � um campo obrigat�rio, por favor informe-o.'+sLineBreak+'No m�nimo 3 caracteres.');

  if dsDadosFunc.DataSet.FieldByName('fn_cpf').AsString.IsEmpty then
    raise Exception.Create('CPF � um campo obrigat�rio, por favor informe-o.');

  if dsDadosFunc.DataSet.FieldByName('fn_salario').AsFloat < 1 then
    raise Exception.Create('Sal�rio � um campo obrigat�rio, por favor informe-o.');

  dsDadosFunc.DataSet.Post;
  ConfigBotoes;
end;

procedure TfrmFuncionario.chkVerDependentesClick(Sender: TObject);
begin
  //exibir ou ocultar a area com as informa�oes dos dependentes
  if not TCheckBox(Sender).Checked then
    pnlManDependente.Visible :=  False;

  pnlDependentes.Visible :=  TCheckBox(Sender).Checked;

  btnAlteraDependentes.Enabled := pnlDependentes.Visible and (not dsDadosFunc.DataSet.IsEmpty);
end;

procedure TfrmFuncionario.chkVerDependentesKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  //exibir ou ocultar a area com as informa�oes dos dependentes se for usado o teclado para marcar o campo
  if not TCheckBox(Sender).Checked then
    pnlManDependente.Visible :=  False;

  pnlDependentes.Visible :=  TCheckBox(Sender).Checked;
  btnAlteraDependentes.Enabled := pnlDependentes.Visible and (not dsDadosFunc.DataSet.IsEmpty);
end;

procedure TfrmFuncionario.dsDadosDependentesStateChange(Sender: TObject);
begin
  ConfigBotoesDependentes;
end;

procedure TfrmFuncionario.dsDadosFuncDataChange(Sender: TObject; Field: TField);
begin
  edtCalcIR.Clear;
  edtCalcINSS.Clear;
  AtualizaListaDependentes;
end;

procedure TfrmFuncionario.dsDadosFuncStateChange(Sender: TObject);
begin
  ConfigBotoes;

end;

procedure TfrmFuncionario.FormShow(Sender: TObject);
begin
  dsDadosFunc.DataSet.Close;
  dsDadosFunc.DataSet.Open;

  dsDadosDependentes.DataSet.Close;
  if not dsDadosFunc.DataSet.IsEmpty then
    AtualizaListaDependentes;
  ConfigBotoes;
  ConfigBotoesDependentes;
end;

procedure TfrmFuncionario.AtualizaListaDependentes;
begin
  dsDadosDependentes.DataSet.Close;
  TFDQuery(dsDadosDependentes.DataSet).ParamByName('idfunc').AsInteger := dsDadosFunc.DataSet.FieldByName('fn_id').AsInteger;
  dsDadosDependentes.DataSet.Open;
end;

procedure TfrmFuncionario.ConfigBotoes;
begin
  btnAlteraDependentes.Enabled := (not dsDadosFunc.DataSet.IsEmpty) and chkVerDependentes.Checked;
  btnExcluirFunc.Enabled := not dsDadosFunc.DataSet.IsEmpty and (dsDadosFunc.DataSet.State = dsBrowse);
  btnEditFunc.Enabled := (not dsDadosFunc.DataSet.IsEmpty) and (dsDadosFunc.DataSet.State = dsBrowse);
  btnNewFunc.Enabled := (dsDadosFunc.DataSet.State = dsBrowse);
  btnCancelFunc.Enabled := (dsDadosFunc.DataSet.State in [dsEdit, dsInsert]);
  btnSalvaFunc .Enabled := (dsDadosFunc.DataSet.State in [dsEdit, dsInsert]);
  pnlManDadosFunc.Visible := (dsDadosFunc.DataSet.State in [dsEdit, dsInsert]);
end;

procedure TfrmFuncionario.ConfigBotoesDependentes;
begin
  btnNewDependente.Enabled := chkVerDependentes.Checked and (not dsDadosFunc.DataSet.IsEmpty);
  btnEditDependente.Enabled := chkVerDependentes.Checked and (not dsDadosFunc.DataSet.IsEmpty) and (not dsDadosDependentes.DataSet.IsEmpty) ;
  btnSalvaDependente.Enabled := (dsDadosDependentes.DataSet.State in [dsEdit, dsInsert]);
  btnCancelDependente.Enabled := (dsDadosDependentes.DataSet.State in [dsEdit, dsInsert]);

end;


procedure TfrmFuncionario.dbedtNomeFunKeyPress(Sender: TObject; var Key: Char);
begin
  Key := AnsiUpperCase(Key)[1];
end;

procedure TfrmFuncionario.KeyPress_soNumeros(Sender: TObject; var Key: Char);
begin
  // Para o campo s� aceitar n�meros positivos e negativos e o Ctrl + C e Ctrl + V
  if not CharInSet(Key, ['0' .. '9', #8, #$3, #$16, #$27]) then
    Key := #0;
end;

procedure TfrmFuncionario.dbedtNomeDepKeyPress(Sender: TObject; var Key: Char);
begin
  Key := AnsiUpperCase(Key)[1];
end;

end.
