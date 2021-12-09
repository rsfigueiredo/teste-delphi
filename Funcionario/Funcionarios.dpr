program Funcionarios;

uses
  Vcl.Forms,
  funcionario in 'funcionario.pas' {frmFuncionario},
  udmCon in 'udmCon.pas' {dmCon: TDataModule},
  uFunc in 'uFunc.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmFuncionario, frmFuncionario);
  Application.CreateForm(TdmCon, dmCon);
  Application.Run;
end.
