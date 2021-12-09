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
    end
    object pnlListaFunc: TPanel
      AlignWithMargins = True
      Left = 3
      Top = 50
      Width = 567
      Height = 582
      Align = alClient
      BevelOuter = bvNone
      BorderStyle = bsSingle
      TabOrder = 2
      ExplicitWidth = 639
      object pnlAcaoFunc: TPanel
        AlignWithMargins = True
        Left = 3
        Top = 3
        Width = 559
        Height = 35
        Align = alTop
        BevelOuter = bvNone
        BorderStyle = bsSingle
        TabOrder = 0
        ExplicitWidth = 631
        object btnNewFunc: TButton
          AlignWithMargins = True
          Left = 479
          Top = 3
          Width = 75
          Height = 27
          Align = alRight
          Caption = 'Novo'
          TabOrder = 0
          ExplicitLeft = 551
        end
        object btnAlteraDependentes: TButton
          AlignWithMargins = True
          Left = 192
          Top = 3
          Width = 119
          Height = 27
          Align = alRight
          Caption = 'Alterar Dependentes'
          TabOrder = 1
          ExplicitLeft = 264
        end
        object btnExcluirFunc: TButton
          AlignWithMargins = True
          Left = 317
          Top = 3
          Width = 75
          Height = 27
          Align = alRight
          Caption = 'Excluir'
          TabOrder = 2
          ExplicitLeft = 389
        end
        object btnEditFunc: TButton
          AlignWithMargins = True
          Left = 398
          Top = 3
          Width = 75
          Height = 27
          Align = alRight
          Caption = 'Editar'
          TabOrder = 3
          ExplicitLeft = 470
        end
      end
      object dbgridDadosFunc: TDBGrid
        AlignWithMargins = True
        Left = 3
        Top = 111
        Width = 559
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
        Columns = <
          item
            Expanded = False
            FieldName = 'fn_id'
            Title.Alignment = taRightJustify
            Width = 45
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'fn_nome'
            Width = 259
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'fn_cpf'
            Title.Alignment = taRightJustify
            Width = 90
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'fn_salario'
            Title.Alignment = taRightJustify
            Width = 75
            Visible = True
          end>
      end
      object pnlManDadosFunc: TPanel
        AlignWithMargins = True
        Left = 3
        Top = 44
        Width = 559
        Height = 61
        Align = alTop
        BevelOuter = bvNone
        BorderStyle = bsSingle
        TabOrder = 2
        ExplicitWidth = 631
        object Label1: TLabel
          Left = 8
          Top = 9
          Width = 27
          Height = 13
          Caption = 'Nome'
        end
        object Label2: TLabel
          Left = 300
          Top = 9
          Width = 56
          Height = 13
          Caption = 'Sal'#225'rio (R$)'
        end
        object Label3: TLabel
          Left = 212
          Top = 9
          Width = 19
          Height = 13
          Caption = 'CPF'
        end
        object DBEdit1: TDBEdit
          Left = 8
          Top = 25
          Width = 198
          Height = 19
          DataField = 'fn_nome'
          DataSource = dsDadosFunc
          TabOrder = 0
        end
        object DBEdit2: TDBEdit
          Left = 212
          Top = 25
          Width = 82
          Height = 19
          DataField = 'fn_cpf'
          DataSource = dsDadosFunc
          TabOrder = 1
        end
        object DBEdit3: TDBEdit
          Left = 300
          Top = 25
          Width = 83
          Height = 19
          DataField = 'fn_salario'
          DataSource = dsDadosFunc
          TabOrder = 2
        end
        object pnlBtnSalvaFunc: TPanel
          AlignWithMargins = True
          Left = 388
          Top = 3
          Width = 166
          Height = 53
          Align = alRight
          BevelOuter = bvNone
          BorderStyle = bsSingle
          TabOrder = 3
          ExplicitLeft = 460
          object btnCancelFunc: TButton
            AlignWithMargins = True
            Left = 5
            Top = 3
            Width = 75
            Height = 45
            Align = alRight
            Caption = 'Cancelar'
            TabOrder = 0
            ExplicitTop = -5
          end
          object btnSalvaFunc: TButton
            AlignWithMargins = True
            Left = 86
            Top = 3
            Width = 75
            Height = 45
            Align = alRight
            Caption = 'Salvar'
            TabOrder = 1
            ExplicitLeft = 90
            ExplicitTop = -9
          end
        end
      end
    end
    object pnlDependentes: TPanel
      AlignWithMargins = True
      Left = 576
      Top = 50
      Width = 435
      Height = 582
      Align = alRight
      BevelOuter = bvNone
      BorderStyle = bsSingle
      TabOrder = 3
      object Panel1: TPanel
        AlignWithMargins = True
        Left = 3
        Top = 3
        Width = 427
        Height = 132
        Align = alTop
        BevelOuter = bvNone
        BorderStyle = bsSingle
        TabOrder = 0
        ExplicitWidth = 355
        object Label4: TLabel
          Left = 8
          Top = 9
          Width = 27
          Height = 13
          Caption = 'Nome'
        end
        object Label5: TLabel
          Left = 79
          Top = 50
          Width = 46
          Height = 13
          Caption = 'Calc INSS'
        end
        object Label6: TLabel
          Left = 8
          Top = 50
          Width = 34
          Height = 13
          Caption = 'Calc IR'
        end
        object DBEdit4: TDBEdit
          Left = 8
          Top = 25
          Width = 321
          Height = 19
          DataField = 'db_nome'
          DataSource = dsDadosDependentes
          TabOrder = 0
        end
        object pnlBtnManDependentes: TPanel
          AlignWithMargins = True
          Left = 335
          Top = 3
          Width = 87
          Height = 124
          Align = alRight
          BevelOuter = bvNone
          BorderStyle = bsSingle
          TabOrder = 1
          ExplicitLeft = 263
          ExplicitHeight = 94
          object btnNewDependente: TButton
            AlignWithMargins = True
            Left = 3
            Top = 3
            Width = 79
            Height = 24
            Align = alTop
            Caption = 'Novo'
            TabOrder = 0
          end
          object btnEditDependente: TButton
            AlignWithMargins = True
            Left = 3
            Top = 33
            Width = 79
            Height = 26
            Align = alClient
            Caption = 'Editar'
            TabOrder = 1
            ExplicitLeft = 6
            ExplicitTop = 34
            ExplicitWidth = 75
            ExplicitHeight = 25
          end
          object btnCancelDependente: TButton
            AlignWithMargins = True
            Left = 3
            Top = 95
            Width = 79
            Height = 24
            Align = alBottom
            Caption = 'Cancelar'
            TabOrder = 2
            ExplicitTop = 64
          end
          object btnSalvaDependente: TButton
            AlignWithMargins = True
            Left = 3
            Top = 65
            Width = 79
            Height = 24
            Align = alBottom
            Caption = 'Salvar'
            TabOrder = 3
            ExplicitTop = 64
          end
        end
        object DBLookupComboBox1: TDBLookupComboBox
          Left = 79
          Top = 66
          Width = 65
          Height = 19
          DataField = 'calculaINSS'
          DataSource = dsDadosDependentes
          TabOrder = 2
        end
        object DBLookupComboBox2: TDBLookupComboBox
          Left = 8
          Top = 66
          Width = 65
          Height = 19
          DataField = 'calculaIR'
          DataSource = dsDadosDependentes
          TabOrder = 3
        end
      end
      object dbgridDadosDependentes: TDBGrid
        AlignWithMargins = True
        Left = 3
        Top = 141
        Width = 427
        Height = 436
        Align = alClient
        DataSource = dsDadosDependentes
        ReadOnly = True
        TabOrder = 1
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
        Columns = <
          item
            Expanded = False
            FieldName = 'dp_idfunc'
            Title.Alignment = taRightJustify
            Width = 45
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'dp_id'
            Title.Alignment = taRightJustify
            Width = 45
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'db_nome'
            Width = 200
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'calculaIR'
            Title.Alignment = taCenter
            Width = 50
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'calculaINSS'
            Title.Alignment = taCenter
            Visible = True
          end>
      end
    end
  end
  object dsDadosFunc: TDataSource
    AutoEdit = False
    DataSet = dmCon.qryDadosFunc
    Left = 275
    Top = 250
  end
  object dsDadosDependentes: TDataSource
    AutoEdit = False
    DataSet = dmCon.qryDadosDependentes
    Left = 811
    Top = 274
  end
end
