object dmCon: TdmCon
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 225
  Width = 351
  object fdCon: TFDConnection
    Params.Strings = (
      'DriverID=SQLite'
      
        'Database=G:\Projetos de teste\TesteCalc\teste-delphi\Funcionario' +
        '\Win32\Debug\DB_SqLite\dbfuncionario.db')
    LoginPrompt = False
    Left = 32
    Top = 16
  end
  object FDPhysSQLiteDriverLink1: TFDPhysSQLiteDriverLink
    Left = 120
    Top = 16
  end
  object qryDadosFunc: TFDQuery
    AfterInsert = qryDadosFuncAfterInsert
    Connection = fdCon
    SQL.Strings = (
      'select * from funcionario')
    Left = 251
    Top = 25
    object qryDadosFuncfn_id: TIntegerField
      DisplayLabel = 'ID'
      FieldName = 'fn_id'
      Origin = 'fn_id'
      ProviderFlags = [pfInUpdate]
    end
    object qryDadosFuncfn_nome: TStringField
      DisplayLabel = 'Nome'
      FieldName = 'fn_nome'
      Origin = 'fn_nome'
      ProviderFlags = [pfInUpdate]
      Size = 32767
    end
    object qryDadosFuncfn_cpf: TStringField
      Alignment = taRightJustify
      DisplayLabel = 'CPF'
      FieldName = 'fn_cpf'
      Origin = 'fn_cpf'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      OnValidate = qryDadosFuncfn_cpfValidate
      EditMask = '!999\-999-999\-99;0;_'
      Size = 32767
    end
    object qryDadosFuncfn_salario: TFloatField
      DefaultExpression = '0.00'
      DisplayLabel = 'Sal'#225'rio (R$)'
      FieldName = 'fn_salario'
      Origin = 'fn_salario'
      DisplayFormat = '##,###,##0.00;0;_'
    end
  end
  object qryDadosDependentes: TFDQuery
    AfterInsert = qryDadosDependentesAfterInsert
    Connection = fdCon
    SQL.Strings = (
      'select * from dependentes'
      'where dp_idfunc = :idfunc')
    Left = 255
    Top = 89
    ParamData = <
      item
        Name = 'IDFUNC'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
    object qryDadosDependentesdp_id: TIntegerField
      DisplayLabel = 'ID'
      FieldName = 'dp_id'
      Origin = 'dp_id'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object qryDadosDependentesdp_idfunc: TIntegerField
      DisplayLabel = 'ID Func'
      FieldName = 'dp_idfunc'
      Origin = 'dp_idfunc'
    end
    object qryDadosDependentesdb_nome: TStringField
      DisplayLabel = 'Nome'
      FieldName = 'db_nome'
      Origin = 'db_nome'
      Size = 32767
    end
    object qryDadosDependentesdb_iscalculair: TStringField
      DisplayLabel = 'Calcula IR'
      FieldName = 'db_iscalculair'
      Origin = 'db_iscalculair'
      Size = 32767
    end
    object qryDadosDependentesdb_iscalculainss: TStringField
      DisplayLabel = 'Calcula INSS'
      FieldName = 'db_iscalculainss'
      Origin = 'db_iscalculainss'
      Size = 32767
    end
    object qryDadosDependentescalculaIR: TStringField
      Alignment = taCenter
      DisplayLabel = 'Calc IR'
      FieldKind = fkLookup
      FieldName = 'calculaIR'
      LookupDataSet = qrySimNao
      LookupKeyFields = 'gn_item'
      LookupResultField = 'gn_descricao'
      KeyFields = 'db_iscalculair'
      ProviderFlags = []
      Size = 5
      Lookup = True
    end
    object qryDadosDependentescalculaINSS: TStringField
      Alignment = taCenter
      DisplayLabel = 'Calc INSS'
      FieldKind = fkLookup
      FieldName = 'calculaINSS'
      LookupDataSet = qrySimNao
      LookupKeyFields = 'gn_item'
      LookupResultField = 'gn_descricao'
      KeyFields = 'db_iscalculainss'
      ProviderFlags = []
      Size = 5
      Lookup = True
    end
  end
  object qrySimNao: TFDQuery
    Connection = fdCon
    SQL.Strings = (
      'select * from generica where gn_tabela = '#39'SIMNAO'#39)
    Left = 32
    Top = 88
    object qrySimNaogn_id: TIntegerField
      FieldName = 'gn_id'
      Origin = 'gn_id'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object qrySimNaogn_tabela: TStringField
      FieldName = 'gn_tabela'
      Origin = 'gn_tabela'
      Size = 32767
    end
    object qrySimNaogn_item: TIntegerField
      FieldName = 'gn_item'
      Origin = 'gn_item'
    end
    object qrySimNaogn_descricao: TStringField
      FieldName = 'gn_descricao'
      Origin = 'gn_descricao'
      Size = 32767
    end
  end
end
