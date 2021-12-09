unit udmCon;

interface

uses
  System.SysUtils, System.Classes, Data.DB, Data.SqlExpr, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf,
  FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys,
  FireDAC.VCLUI.Wait, FireDAC.Comp.Client, FireDAC.Phys.SQLite,
  FireDAC.Phys.SQLiteDef, FireDAC.Stan.ExprFuncs,
  FireDAC.Phys.SQLiteWrapper.Stat, FireDAC.Stan.Param, FireDAC.DatS,
  FireDAC.DApt.Intf, FireDAC.DApt, FireDAC.Comp.DataSet;

type
  TdmCon = class(TDataModule)
    fdCon: TFDConnection;
    FDPhysSQLiteDriverLink1: TFDPhysSQLiteDriverLink;
    qryDadosFunc: TFDQuery;
    qryDadosFuncfn_id: TIntegerField;
    qryDadosFuncfn_nome: TStringField;
    qryDadosFuncfn_cpf: TStringField;
    qryDadosFuncfn_salario: TIntegerField;
    qryDadosDependentes: TFDQuery;
    qryDadosDependentesdp_id: TIntegerField;
    qryDadosDependentesdp_idfunc: TIntegerField;
    qryDadosDependentesdb_nome: TStringField;
    qryDadosDependentesdb_iscalculair: TStringField;
    qryDadosDependentesdb_iscalculainss: TStringField;
    qrySimNao: TFDQuery;
    qrySimNaogn_id: TIntegerField;
    qrySimNaogn_tabela: TStringField;
    qrySimNaogn_item: TIntegerField;
    qrySimNaogn_descricao: TStringField;
    qryDadosDependentescalculaIR: TStringField;
    qryDadosDependentescalculaINSS: TStringField;
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dmCon: TdmCon;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

uses uFunc;

{$R *.dfm}

procedure TdmCon.DataModuleCreate(Sender: TObject);
begin
  validaBancoDados;
  validaTabelas;
end;

end.
