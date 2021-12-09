unit uFunc;


interface


uses
  Data.SqlExpr,
  Datasnap.DBClient,
  FireDAC.Comp.Client,
  FireDAC.DApt,
  System.Classes,
  System.JSON,
  System.SysUtils,
  FireDAC.Stan.Param,
  Data.DB,
  Vcl.Graphics,
  Vcl.ExtCtrls,
  Vcl.controls,
  Vcl.DBCtrls,
  Vcl.DBGRids,
  Vcl.Grids,
  Vcl.StdCtrls,
  Vcl.ComCtrls,
  Vcl.Mask,
  Vcl.Forms,
  System.IniFiles,
  Winapi.Windows,
  Winapi.SHEllapi,
  Messages,
  ActiveX,
  ComObj,
  Variants,
  DBCommon,
  System.Zip,
  System.Math,
  Winapi.MMSystem, udmCon;

  procedure validaBancoDados;
  procedure validaTabelas;

implementation

procedure validaBancoDados;
var
  DBLite: TextFile;
begin
  ForceDirectories(ExtractFileDir(Application.ExeName)+'\DB_SqLite\');

  if not FileExists(ExtractFileDir(Application.ExeName)+'\DB_SqLite\dbfuncionario.db') then
  begin
    AssignFile(DBLite, ExtractFileDir(Application.ExeName)+'\DB_SqLite\dbfuncionario.db');
    Rewrite(DBLite, ExtractFileDir(Application.ExeName)+'\DB_SqLite\dbfuncionario.db');
    Append(DBLite);
    CloseFile(DBLite);
  end;
  dmCon.fdCon.Params.Values['Database'] := ExtractFileDir(Application.ExeName)+'\DB_SqLite\dbfuncionario.db';
end;

procedure validaTabelas;
var
  sSql : String;
  qryAux : TFDQuery;
begin
  qryAux := TFDQuery.Create(nil);
  try
    qryAux.Connection := dmCon.fdCon;
    //verificando e criando a tabela funcionarios
    sSql := 'PRAGMA table_info("funcionario")';
    qryAux.Close;
    qryAux.SQL.Text := sSql;
    qryAux.Open;
    if qryAux.IsEmpty then
    begin
      qryAux.Close;
      sSql := ' CREATE TABLE "funcionario"(' +
              '  "fn_id" integer primary key' +
              ', "fn_nome" varchar' +
              ', "fn_cpf" varchar' +
              ', "fn_salario" integer' +
              ');';
     qryAux.SQL.Text := sSql;
     qryAux.ExecSQL;
    end;


    //verificando e criando a tabela dependentes
    sSql := 'PRAGMA table_info("dependentes")';
    qryAux.Close;
    qryAux.SQL.Text := sSql;
    qryAux.Open;
    if qryAux.IsEmpty then
    begin
      qryAux.Close;
      sSql := ' CREATE TABLE "dependentes"(' +
              '  "dp_id" integer primary key' +
              ', "dp_idfunc" integer' +
              ', "db_nome" varchar' +
              ', "db_iscalculair" varchar' +
              ', "db_iscalculainss" varchar' +
              ');';
     qryAux.SQL.Text := sSql;
     qryAux.ExecSQL;
    end;


  finally
    FreeAndNil(qryAux);
  end;
end;

end.
