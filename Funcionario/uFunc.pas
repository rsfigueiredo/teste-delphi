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
  function ValidaCPF(pCPF: string): Boolean;
  function proximoNumeroTabela(sTabela, sCampo : String): integer;

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

function proximoNumeroTabela(sTabela, sCampo : String): integer;
Var
  sSql : String;
  qryAux : TFDQuery;
begin
  qryAux := TFDQuery.Create(nil);
  try
    qryAux.Connection := dmCon.fdCon;
    sSql := ' select max('+sCampo+')+1 as proxnum from '+sTabela;
    qryAux.Close;
    qryAux.SQL.Text := sSql;
    qryAux.Open;
    if qryAux.IsEmpty then
      Result := 1
    else
      Result := StrToIntDef(qryAux.FieldByName('proxnum').AsString,1);
  finally
    FreeAndNil(qryAux);
  end;
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
              ', "fn_salario" REAL' +
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

    //verificando e criando a tabela dependentes
    sSql := 'PRAGMA table_info("generica")';
    qryAux.Close;
    qryAux.SQL.Text := sSql;
    qryAux.Open;
    if qryAux.IsEmpty then
    begin
      qryAux.Close;
      sSql := ' CREATE TABLE "generica"(' +
              '  "gn_id" integer primary key' +
              ', "gn_tabela" varchar' +
              ', "gn_item" integer' +
              ', "gn_descricao" varchar' +
              ');';
      qryAux.SQL.Text := sSql;
      qryAux.ExecSQL;

      sSql := ' INSERT INTO generica '+
             '   ( '+
             '      gn_id '+
             '    , gn_tabela '+
             '    , gn_item '+
             '    , gn_descricao '+
             '   )'+
             ' VALUES (  1 ' +
             '   , ''SIMNAO'' ' +
             '   , 1 ' +
             '   , ''SIM'' ' +
             '   );';

      qryAux.SQL.Text := sSql;
      qryAux.ExecSQL;
      sSql := ' INSERT INTO generica '+
             '   ( '+
             '      gn_id '+
             '    , gn_tabela '+
             '    , gn_item '+
             '    , gn_descricao '+
             '   )'+
             ' VALUES (  2 ' +
             '   , ''SIMNAO'' ' +
             '   , 2 ' +
             '   , ''NAO'' ' +
             '   );';

      qryAux.SQL.Text := sSql;
      qryAux.ExecSQL;

    end
    else
    begin
      sSql := 'select * from generica ';
      qryAux.Close;
      qryAux.SQL.Text := sSql;
      qryAux.Open;

      qryAux.Filtered := False;
      qryAux.Filter := ' gn_tabela = ''SIMNAO'' and gn_descricao =  ''SIM'' ';
      qryAux.Filtered := True;

      if qryAux.IsEmpty then
        dmCon.fdCon.ExecSQL( ' INSERT INTO generica '+
                             '   ( '+
                             '      gn_id '+
                             '    , gn_tabela '+
                             '    , gn_item '+
                             '    , gn_descricao '+
                             '   )'+
                             ' VALUES (  1 ' +
                             '   , ''SIMNAO'' ' +
                             '   , 1 ' +
                             '   , ''SIM'' ' +
                             '   );');

      qryAux.Filtered := False;
      qryAux.Filter := ' gn_tabela = ''SIMNAO'' and gn_descricao =  ''NAO'' ';
      qryAux.Filtered := True;

      if qryAux.IsEmpty then
        dmCon.fdCon.ExecSQL( ' INSERT INTO generica '+
                             '   ( '+
                             '      gn_id '+
                             '    , gn_tabela '+
                             '    , gn_item '+
                             '    , gn_descricao '+
                             '   )'+
                             '  VALUES (  2 ' +
                             '   , ''SIMNAO'' ' +
                             '   , 2 ' +
                             '   , ''NAO'' ' +
                             '   );');
    end;


  finally
    FreeAndNil(qryAux);
  end;
end;

function ValidaCPF(pCPF: string): Boolean;
var
  v: array [0 .. 1] of Word;
  cpf: array [0 .. 10] of Byte;
  I: Byte;
begin
  Result := False;

  { Verificando se tem 11 caracteres }
  if Length(pCPF) <> 11 then
  begin
    Exit;
  end;

  { Conferindo se todos dígitos são iguais }
  if pCPF = StringOfChar('0', 11) then
    Exit;

  if pCPF = StringOfChar('1', 11) then
    Exit;

  if pCPF = StringOfChar('2', 11) then
    Exit;

  if pCPF = StringOfChar('3', 11) then
    Exit;

  if pCPF = StringOfChar('4', 11) then
    Exit;

  if pCPF = StringOfChar('5', 11) then
    Exit;

  if pCPF = StringOfChar('6', 11) then
    Exit;

  if pCPF = StringOfChar('7', 11) then
    Exit;

  if pCPF = StringOfChar('8', 11) then
    Exit;

  if pCPF = StringOfChar('9', 11) then
    Exit;

  try
    for I := 1 to 11 do
      cpf[I - 1] := StrToInt(pCPF[I]);
    // Nota: Calcula o primeiro dígito de verificação.
    v[0] := 10 * cpf[0] + 9 * cpf[1] + 8 * cpf[2];
    v[0] := v[0] + 7 * cpf[3] + 6 * cpf[4] + 5 * cpf[5];
    v[0] := v[0] + 4 * cpf[6] + 3 * cpf[7] + 2 * cpf[8];
    v[0] := 11 - v[0] mod 11;
    v[0] := IfThen(v[0] >= 10, 0, v[0]);
    // Nota: Calcula o segundo dígito de verificação.
    v[1] := 11 * cpf[0] + 10 * cpf[1] + 9 * cpf[2];
    v[1] := v[1] + 8 * cpf[3] + 7 * cpf[4] + 6 * cpf[5];
    v[1] := v[1] + 5 * cpf[6] + 4 * cpf[7] + 3 * cpf[8];
    v[1] := v[1] + 2 * v[0];
    v[1] := 11 - v[1] mod 11;
    v[1] := IfThen(v[1] >= 10, 0, v[1]);
    // Nota: Verdadeiro se os dígitos de verificação são os esperados.
    Result := ((v[0] = cpf[9]) and (v[1] = cpf[10]));
  except
    on E: Exception do
      Result := False;
  end;
end;

end.
