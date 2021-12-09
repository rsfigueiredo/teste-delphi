object frmFuncionario: TfrmFuncionario
  Left = 0
  Top = 0
  BorderStyle = bsSingle
  Caption = 'Funcion'#225'rio'
  ClientHeight = 671
  ClientWidth = 1014
  Color = clWindow
  Ctl3D = False
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object pnlFundo: TPanel
    Left = 0
    Top = 0
    Width = 1014
    Height = 671
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 0
    ExplicitLeft = 160
    ExplicitTop = 144
    ExplicitWidth = 185
    ExplicitHeight = 41
    object pnlTitle: TPanel
      AlignWithMargins = True
      Left = 3
      Top = 3
      Width = 1008
      Height = 41
      Align = alTop
      BevelOuter = bvNone
      BorderStyle = bsSingle
      Caption = 'Funcionarios e dependentes'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 767
    end
    object pnlRodape: TPanel
      AlignWithMargins = True
      Left = 3
      Top = 638
      Width = 1008
      Height = 30
      Align = alBottom
      BevelOuter = bvNone
      BorderStyle = bsSingle
      Caption = 'Rodape'
      TabOrder = 1
      ExplicitTop = 432
      ExplicitWidth = 761
    end
    object pnlListaFunc: TPanel
      AlignWithMargins = True
      Left = 3
      Top = 50
      Width = 639
      Height = 582
      Align = alClient
      BevelOuter = bvNone
      BorderStyle = bsSingle
      TabOrder = 2
      ExplicitWidth = 430
      ExplicitHeight = 376
      object pnlAcaoFunc: TPanel
        AlignWithMargins = True
        Left = 3
        Top = 3
        Width = 631
        Height = 35
        Align = alTop
        BevelOuter = bvNone
        BorderStyle = bsSingle
        TabOrder = 0
        ExplicitLeft = -4
        ExplicitWidth = 726
        object Button1: TButton
          AlignWithMargins = True
          Left = 551
          Top = 3
          Width = 75
          Height = 27
          Align = alRight
          Caption = 'Button1'
          TabOrder = 0
          ExplicitLeft = 624
          ExplicitTop = 8
          ExplicitHeight = 25
        end
        object Button2: TButton
          AlignWithMargins = True
          Left = 308
          Top = 3
          Width = 75
          Height = 27
          Align = alRight
          Caption = 'Button1'
          TabOrder = 1
          ExplicitLeft = 403
          ExplicitTop = 7
        end
        object Button3: TButton
          AlignWithMargins = True
          Left = 389
          Top = 3
          Width = 75
          Height = 27
          Align = alRight
          Caption = 'Button1'
          TabOrder = 2
          ExplicitLeft = 624
          ExplicitTop = 8
          ExplicitHeight = 25
        end
        object Button4: TButton
          AlignWithMargins = True
          Left = 470
          Top = 3
          Width = 75
          Height = 27
          Align = alRight
          Caption = 'Button1'
          TabOrder = 3
          ExplicitLeft = 624
          ExplicitTop = 8
          ExplicitHeight = 25
        end
        object Button8: TButton
          AlignWithMargins = True
          Left = 227
          Top = 3
          Width = 75
          Height = 27
          Align = alRight
          Caption = 'Button1'
          TabOrder = 4
          ExplicitLeft = 403
          ExplicitTop = 7
        end
      end
      object dbgridDadosFunc: TDBGrid
        AlignWithMargins = True
        Left = 3
        Top = 111
        Width = 631
        Height = 466
        Align = alClient
        DataSource = dsDadosFunc
        ReadOnly = True
        TabOrder = 1
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
      end
      object pnlManDadosFunc: TPanel
        AlignWithMargins = True
        Left = 3
        Top = 44
        Width = 631
        Height = 61
        Align = alTop
        BevelOuter = bvNone
        BorderStyle = bsSingle
        TabOrder = 2
        ExplicitWidth = 726
        object Label1: TLabel
          Left = 8
          Top = 9
          Width = 31
          Height = 13
          Caption = 'Label1'
        end
        object Label2: TLabel
          Left = 300
          Top = 9
          Width = 31
          Height = 13
          Caption = 'Label1'
        end
        object Label3: TLabel
          Left = 212
          Top = 9
          Width = 31
          Height = 13
          Caption = 'Label1'
        end
        object Button5: TButton
          AlignWithMargins = True
          Left = 551
          Top = 3
          Width = 75
          Height = 53
          Align = alRight
          Caption = 'Button1'
          TabOrder = 0
          ExplicitLeft = 624
          ExplicitTop = 8
          ExplicitHeight = 25
        end
        object Button6: TButton
          AlignWithMargins = True
          Left = 389
          Top = 3
          Width = 75
          Height = 53
          Align = alRight
          Caption = 'Button1'
          TabOrder = 1
          ExplicitLeft = 582
          ExplicitTop = 0
          ExplicitHeight = 39
        end
        object Button7: TButton
          AlignWithMargins = True
          Left = 470
          Top = 3
          Width = 75
          Height = 53
          Align = alRight
          Caption = 'Button1'
          TabOrder = 2
          ExplicitLeft = 582
          ExplicitTop = 0
          ExplicitHeight = 39
        end
        object DBEdit1: TDBEdit
          Left = 8
          Top = 25
          Width = 198
          Height = 19
          TabOrder = 3
        end
        object DBEdit2: TDBEdit
          Left = 212
          Top = 25
          Width = 82
          Height = 19
          TabOrder = 4
        end
        object DBEdit3: TDBEdit
          Left = 300
          Top = 25
          Width = 83
          Height = 19
          TabOrder = 5
        end
      end
    end
    object pnlDependentes: TPanel
      AlignWithMargins = True
      Left = 648
      Top = 50
      Width = 363
      Height = 582
      Align = alRight
      BevelOuter = bvNone
      BorderStyle = bsSingle
      TabOrder = 3
      object Panel1: TPanel
        AlignWithMargins = True
        Left = 3
        Top = 3
        Width = 355
        Height = 102
        Align = alTop
        BevelOuter = bvNone
        BorderStyle = bsSingle
        TabOrder = 0
        ExplicitWidth = 379
        DesignSize = (
          353
          100)
        object Label4: TLabel
          Left = 8
          Top = 9
          Width = 31
          Height = 13
          Caption = 'Label1'
        end
        object Label5: TLabel
          Left = 95
          Top = 50
          Width = 31
          Height = 13
          Caption = 'Label1'
        end
        object Label6: TLabel
          Left = 8
          Top = 50
          Width = 31
          Height = 13
          Caption = 'Label1'
        end
        object Button9: TButton
          AlignWithMargins = True
          Left = 272
          Top = 68
          Width = 75
          Height = 25
          Anchors = [akTop, akRight]
          Caption = 'Button1'
          TabOrder = 0
          ExplicitLeft = 296
        end
        object Button10: TButton
          AlignWithMargins = True
          Left = 272
          Top = 37
          Width = 75
          Height = 25
          Anchors = [akTop, akRight]
          Caption = 'Button1'
          TabOrder = 1
          ExplicitLeft = 296
        end
        object Button11: TButton
          AlignWithMargins = True
          Left = 272
          Top = 6
          Width = 75
          Height = 25
          Anchors = [akTop, akRight]
          Caption = 'Button1'
          TabOrder = 2
          ExplicitLeft = 296
        end
        object DBEdit4: TDBEdit
          Left = 8
          Top = 25
          Width = 249
          Height = 19
          TabOrder = 3
        end
        object DBEdit5: TDBEdit
          Left = 8
          Top = 66
          Width = 81
          Height = 19
          TabOrder = 4
        end
        object DBEdit6: TDBEdit
          Left = 95
          Top = 66
          Width = 121
          Height = 19
          TabOrder = 5
        end
      end
      object dbgridDadosDependentes: TDBGrid
        AlignWithMargins = True
        Left = 3
        Top = 111
        Width = 355
        Height = 466
        Align = alClient
        DataSource = dsDadosDependentes
        ReadOnly = True
        TabOrder = 1
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
      end
    end
  end
  object qryDadosFunc: TFDQuery
    Connection = dmCon.fdCon
    SQL.Strings = (
      'select * from funcionario')
    Left = 275
    Top = 306
    object qryDadosFuncfn_id: TIntegerField
      FieldName = 'fn_id'
      Origin = 'fn_id'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object qryDadosFuncfn_nome: TStringField
      FieldName = 'fn_nome'
      Origin = 'fn_nome'
      Size = 32767
    end
    object qryDadosFuncfn_cpf: TStringField
      FieldName = 'fn_cpf'
      Origin = 'fn_cpf'
      Size = 32767
    end
    object qryDadosFuncfn_salario: TIntegerField
      FieldName = 'fn_salario'
      Origin = 'fn_salario'
    end
  end
  object dsDadosFunc: TDataSource
    AutoEdit = False
    DataSet = qryDadosFunc
    Left = 275
    Top = 250
  end
  object dsDadosDependentes: TDataSource
    AutoEdit = False
    DataSet = qryDadosDependentes
    Left = 811
    Top = 274
  end
  object qryDadosDependentes: TFDQuery
    Connection = dmCon.fdCon
    SQL.Strings = (
      'select * from dependentes')
    Left = 811
    Top = 330
    object qryDadosDependentesdp_id: TIntegerField
      FieldName = 'dp_id'
      Origin = 'dp_id'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object qryDadosDependentesdp_idfunc: TIntegerField
      FieldName = 'dp_idfunc'
      Origin = 'dp_idfunc'
    end
    object qryDadosDependentesdb_nome: TStringField
      FieldName = 'db_nome'
      Origin = 'db_nome'
      Size = 32767
    end
    object qryDadosDependentesdb_iscalculair: TStringField
      FieldName = 'db_iscalculair'
      Origin = 'db_iscalculair'
      Size = 32767
    end
    object qryDadosDependentesdb_iscalculainss: TStringField
      FieldName = 'db_iscalculainss'
      Origin = 'db_iscalculainss'
      Size = 32767
    end
  end
end
