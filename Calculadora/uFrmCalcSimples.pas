unit uFrmCalcSimples;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons,
  uFuncNumericos;

type
  TfrmCalcSimples = class(TForm)
    edtValor: TEdit;
    lbDisplayCalc: TLabel;
    sbtSoma: TSpeedButton;
    Label1: TLabel;
    sbtSubtrac: TSpeedButton;
    sbtMultiplic: TSpeedButton;
    sbtDivsao: TSpeedButton;
    sbtExec: TSpeedButton;
    Label2: TLabel;
    lbInfo: TLabel;
    lbUltExec: TLabel;
    btnImpA: TButton;
    btnImpB: TButton;
    btnImpC: TButton;
    edtImpA: TEdit;
    edtImpB: TEdit;
    edtImpC: TEdit;
    procedure edtValorKeyPress(Sender: TObject; var Key: Char);
    procedure edtValorChange(Sender: TObject);
    procedure sbtSomaClick(Sender: TObject);
    procedure sbtSubtracClick(Sender: TObject);
    procedure sbtMultiplicClick(Sender: TObject);
    procedure sbtDivsaoClick(Sender: TObject);
    procedure sbtExecClick(Sender: TObject);
    procedure btnImpAClick(Sender: TObject);
    procedure btnImpBClick(Sender: TObject);
    procedure btnImpCClick(Sender: TObject);
  protected
    sValOld, sUltDigito, sComandoOld : String;
    bZeraDisplay, bAtUltDigt, bZeraCalc : Boolean;
  private
    procedure execRotina(sComando: String);
    Function AnalizaComando(sKey: Char): Char;
//    function CalcImpA(fValor: Double): Double;
//    function CalcImpB(fValor: Double): Double;
//    function CalcImpC(fValor: Double): Double;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCalcSimples: TfrmCalcSimples;

implementation

{$R *.dfm}

procedure TfrmCalcSimples.btnImpAClick(Sender: TObject);
begin
  if Trim(edtValor.Text).IsEmpty then
    exit;
  edtImpA.Text := CalcImpA(StrToFloat(edtValor.Text)).ToString;
end;

procedure TfrmCalcSimples.btnImpBClick(Sender: TObject);
begin
  if Trim(edtValor.Text).IsEmpty then
    exit;
  edtImpB.Text := CalcImpB(StrToFloat(edtValor.Text)).ToString;
end;

procedure TfrmCalcSimples.btnImpCClick(Sender: TObject);
begin
  if Trim(edtValor.Text).IsEmpty then
    exit;
  edtImpC.Text := CalcImpC(StrToFloat(edtValor.Text)).ToString;
end;

//function TfrmCalcSimples.CalcImpA(fValor : Double): Double;
//begin
//  Result := (fValor * 0.2) - 500;
//end;
//
//function TfrmCalcSimples.CalcImpB(fValor : Double): Double;
//begin
//  Result := CalcImpA(fValor) - 15;
//end;
//
//function TfrmCalcSimples.CalcImpC(fValor : Double): Double;
//begin
//  Result := CalcImpA(fValor) + CalcImpB(fValor);
//end;

procedure TfrmCalcSimples.edtValorChange(Sender: TObject);
begin
  if not trim(TEdit(Sender).Text).IsEmpty and bAtUltDigt and not bZeraDisplay then
  begin
    sUltDigito := TEdit(Sender).Text;
    lbUltExec.Caption := (sValOld+sComandoOld+sUltDigito);
  end;
end;

procedure TfrmCalcSimples.edtValorKeyPress(Sender: TObject; var Key: Char);
begin
  Key := AnalizaComando(Key);
end;

Function TfrmCalcSimples.AnalizaComando(sKey : Char) : Char;
var
  sComando : String;
begin
  sComando := '';
  // Para o campo s� aceitar n�meros
  if not CharInSet(sKey, ['0' .. '9', '+', '-', '*', '/', #$D]) then
    sKey := #0
  else
  begin
    if CharInSet(sKey, ['+', '-', '*', '/', #$D]) then
    begin
      bAtUltDigt := False;
      if CharInSet(sKey, [#$D]) then
        sComando := '='
      else
      begin
        sComando := string(sKey);
      end;

      bZeraCalc := sComando.Contains('=');

      execRotina(sComando);
//      edtValor.Text := EmptyStr;
      sKey := #0;
    end
    else
    begin
      bAtUltDigt := True;
      if bZeraDisplay then
      begin
        if bZeraCalc then
        begin
          sValOld := '';
          sComandoOld := '';
          sUltDigito := '';
          edtValor.Text := EmptyStr;
        end;
//        lbUltExec.Caption := (edtValor.Text+sComandoOld);
        lbUltExec.Caption := (sValOld+sComandoOld+sUltDigito);
  //      sUltDigito := String(Key);
        edtValor.Text := EmptyStr;
        bZeraDisplay := False;
      end;
    end;
  end;
  Result := Char(sKey);
end;

procedure TfrmCalcSimples.execRotina(sComando : String);
var
  bExecCalc : Boolean;
begin
  if Trim(sComandoOld).IsEmpty then
  begin
    sComandoOld := sComando;
    sValOld := (edtValor.Text);
    lbUltExec.Caption := (edtValor.Text);
    sUltDigito   := edtValor.Text;
    bZeraDisplay := True;
  end
  else
  begin
    if Trim(edtValor.Text).IsEmpty and sComando.Contains('=') and sUltDigito.IsEmpty then
      sUltDigito := sValOld;
    if sUltDigito.IsEmpty then
      exit;

    bExecCalc := not bZeraDisplay or sComando.Contains('=');

    if (sComandoOld = '*') and bExecCalc then
      edtValor.Text :=  FormatFloat('#,,0.#####',(StrToFloat(sValOld) * StrToFloat(sUltDigito)));
    if (sComandoOld = '/') and bExecCalc then
      edtValor.Text := FormatFloat('#,,0.#####', (StrToFloat(sValOld) / StrToFloat(sUltDigito)));
    if (sComandoOld = '+') and bExecCalc  then
      edtValor.Text :=  FormatFloat('#,,0.#####',(StrToFloat(sValOld) + StrToFloat(sUltDigito)));
    if (sComandoOld = '-') and bExecCalc  then
      edtValor.Text :=  FormatFloat('#,,0.#####',(StrToFloat(sValOld) - StrToFloat(sUltDigito)));

    if not sComando.Contains('=') then
      sComandoOld := sComando;

    if sComando.Contains('=') then
      lbUltExec.Caption := (sValOld+sComandoOld+sUltDigito+'=')
    else
      lbUltExec.Caption := (edtValor.Text+sComandoOld);

    if not Trim(edtValor.Text).IsEmpty then
    begin
      sValOld := (edtValor.Text);
      sValOld := StringReplace(sValOld, '.', '', [rfReplaceAll]);
    end;
    bZeraDisplay := True;
  end;

end;

procedure TfrmCalcSimples.sbtDivsaoClick(Sender: TObject);
begin
  AnalizaComando('/');
end;

procedure TfrmCalcSimples.sbtExecClick(Sender: TObject);
begin
  AnalizaComando(#$D);
end;

procedure TfrmCalcSimples.sbtMultiplicClick(Sender: TObject);
begin
  AnalizaComando('*');
end;

procedure TfrmCalcSimples.sbtSomaClick(Sender: TObject);
begin
  AnalizaComando('+');
end;

procedure TfrmCalcSimples.sbtSubtracClick(Sender: TObject);
begin
  AnalizaComando('-');
end;

end.
