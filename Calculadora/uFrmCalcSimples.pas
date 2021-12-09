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
    sValOld, //Valor do calculo Anterior ao digitado no momento, serve para calcular com o valor atual
    sUltDigito, //ultimo valor digitado no edit
    sComandoOld : String; //operacao do calculo
    bZeraDisplay, //para informar que no proximo valor e para limpar os valores do edit no momento que digitao o novo valor
    bAtUltDigt, //para saber se � para atualizar o ultimo valor digitado no calculo, usado para varias repeti�oes da tecla "="
    bZeraCalc : Boolean; //usado para iniciar um novo calculo do zero
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
  //Se nao tiver valor nenhum, entao nao calcula
  if Trim(edtValor.Text).IsEmpty then
    exit;
  edtImpA.Text := CalcImpA(StrToFloat(edtValor.Text)).ToString;
end;

procedure TfrmCalcSimples.btnImpBClick(Sender: TObject);
begin
  //Se nao tiver valor nenhum, entao nao calcula
  if Trim(edtValor.Text).IsEmpty then
    exit;
  edtImpB.Text := CalcImpB(StrToFloat(edtValor.Text)).ToString;
end;

procedure TfrmCalcSimples.btnImpCClick(Sender: TObject);
begin
  //Se nao tiver valor nenhum, entao nao calcula
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
  //Se for para atualizar o ultimo valor digitado no edit para a variavel de calculo
  if not trim(TEdit(Sender).Text).IsEmpty and bAtUltDigt and not bZeraDisplay then
  begin
    sUltDigito := TEdit(Sender).Text;
    // atualiza o label com as informa�oes do calculo
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
  if not CharInSet(sKey, ['0' .. '9', '+', '-', '*', '/', #$D, #$1B, #8]) then
    sKey := #0
  else
  begin
    //verifica se e um comando de calculo ou um numero
    if CharInSet(sKey, ['+', '-', '*', '/', #$D]) then
    begin
      bAtUltDigt := False;

      //caracter "=" em char � "#$D"
      if CharInSet(sKey, [#$D]) then
        sComando := '='
      else
      begin
        sComando := string(sKey);
      end;

      bZeraCalc := sComando.Contains('=');

      //executa a rotina com os dados de memoria
      execRotina(sComando);
//      edtValor.Text := EmptyStr;
      sKey := #0;
    end
    else
    begin
      bAtUltDigt := True;

      if bZeraDisplay or CharInSet(sKey, [#$1B]) then
      begin
        if bZeraCalc then
        begin
          sValOld := '';
          sComandoOld := '';
          sUltDigito := '';
          edtValor.Text := EmptyStr;
        end;
//        lbUltExec.Caption := (edtValor.Text+sComandoOld);
        // atualiza o label com as informa�oes do calculo
        lbUltExec.Caption := (sValOld+sComandoOld+sUltDigito);
  //      sUltDigito := String(Key);
        //Limpa o edit para receber o novo valor do calculo
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
  //verifica se � o primeiro digito
  if Trim(sComandoOld).IsEmpty then
  begin
    sComandoOld := sComando;
    sValOld := (edtValor.Text);
    lbUltExec.Caption := (edtValor.Text);
    sUltDigito   := edtValor.Text;
    bZeraDisplay := True;
  end
  else  //se nao for o primeiro digito
  begin
    //se o ultimo digito estiver vazio pegar valor anterior
    if Trim(edtValor.Text).IsEmpty and sComando.Contains('=') and sUltDigito.IsEmpty then
      sUltDigito := sValOld;
    //se ultimo digito continuar vazio, sai da rotina
    if sUltDigito.IsEmpty then
      exit;
    //para executar os calculor nao pode estar ativo para zerar display ou a tecla "=" for presionada
    bExecCalc := not bZeraDisplay or sComando.Contains('=');

    if (sComandoOld = '*') and bExecCalc then
      edtValor.Text :=  FormatFloat('#,,0.#####',(StrToFloat(sValOld) * StrToFloat(sUltDigito)));
    if (sComandoOld = '/') and bExecCalc then
      edtValor.Text := FormatFloat('#,,0.#####', (StrToFloat(sValOld) / StrToFloat(sUltDigito)));
    if (sComandoOld = '+') and bExecCalc  then
      edtValor.Text :=  FormatFloat('#,,0.#####',(StrToFloat(sValOld) + StrToFloat(sUltDigito)));
    if (sComandoOld = '-') and bExecCalc  then
      edtValor.Text :=  FormatFloat('#,,0.#####',(StrToFloat(sValOld) - StrToFloat(sUltDigito)));
    //salva comando anterior, para caso o comando atual for a tecla "=" ele manter a ultima opera��o em memoria
    if not sComando.Contains('=') then
      sComandoOld := sComando;
    //Atualiza o label de informacao do calculo
    if sComando.Contains('=') then
      lbUltExec.Caption := (sValOld+sComandoOld+sUltDigito+'=')
    else
      lbUltExec.Caption := (edtValor.Text+sComandoOld);
    //Ajusta os valores pois em texto ele aparece formatado no dysplay, mas na variavel nao aceita formata��o.
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
  AnalizaComando('/'); //divisao
end;

procedure TfrmCalcSimples.sbtExecClick(Sender: TObject);
begin
  AnalizaComando(#$D); // executa o calculo com a tecla "="
end;

procedure TfrmCalcSimples.sbtMultiplicClick(Sender: TObject);
begin
  AnalizaComando('*'); // multiplica��o
end;

procedure TfrmCalcSimples.sbtSomaClick(Sender: TObject);
begin
  AnalizaComando('+'); //soma
end;

procedure TfrmCalcSimples.sbtSubtracClick(Sender: TObject);
begin
  AnalizaComando('-'); //subtra��o
end;

initialization
  RegisterClass(TfrmCalcSimples);

finalization
  UnRegisterClass(TfrmCalcSimples);

end.
