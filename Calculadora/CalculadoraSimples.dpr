program CalculadoraSimples;

uses
  Vcl.Forms,
  uFrmCalcSimples in 'uFrmCalcSimples.pas' {frmCalcSimples},
  uFuncNumericos in 'uFuncNumericos.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmCalcSimples, frmCalcSimples);
  Application.Run;
end.
