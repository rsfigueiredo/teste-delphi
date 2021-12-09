object frmCalcSimples: TfrmCalcSimples
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsDialog
  Caption = 'Calculadora simples'
  ClientHeight = 269
  ClientWidth = 178
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object lbDisplayCalc: TLabel
    Left = 8
    Top = 12
    Width = 94
    Height = 13
    Caption = 'Informe um numero'
  end
  object sbtSoma: TSpeedButton
    Left = 8
    Top = 110
    Width = 23
    Height = 22
    Caption = '+'
    OnClick = sbtSomaClick
  end
  object Label1: TLabel
    Left = 8
    Top = 94
    Width = 95
    Height = 13
    Caption = 'Informe a operacao'
  end
  object sbtSubtrac: TSpeedButton
    Left = 37
    Top = 110
    Width = 23
    Height = 22
    Caption = '-'
    OnClick = sbtSubtracClick
  end
  object sbtMultiplic: TSpeedButton
    Left = 66
    Top = 110
    Width = 23
    Height = 22
    Caption = '*'
    OnClick = sbtMultiplicClick
  end
  object sbtDivsao: TSpeedButton
    Left = 95
    Top = 110
    Width = 23
    Height = 22
    Caption = '/'
    OnClick = sbtDivsaoClick
  end
  object sbtExec: TSpeedButton
    Left = 124
    Top = 110
    Width = 43
    Height = 22
    Caption = '='
    OnClick = sbtExecClick
  end
  object Label2: TLabel
    Left = 124
    Top = 94
    Width = 43
    Height = 13
    Caption = 'Executar'
  end
  object lbInfo: TLabel
    Left = 8
    Top = 138
    Width = 161
    Height = 26
    Caption = '*Os simbolos do teclado numerico tambem funciona'
    WordWrap = True
  end
  object lbUltExec: TLabel
    Left = 146
    Top = 32
    Width = 25
    Height = 18
    Alignment = taRightJustify
    Caption = '-----'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object edtValor: TEdit
    Left = 8
    Top = 58
    Width = 163
    Height = 31
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    OnChange = edtValorChange
    OnKeyPress = edtValorKeyPress
  end
  object btnImpA: TButton
    Left = 8
    Top = 170
    Width = 75
    Height = 25
    Caption = 'Imposto A'
    TabOrder = 1
    OnClick = btnImpAClick
  end
  object btnImpB: TButton
    Left = 8
    Top = 201
    Width = 75
    Height = 25
    Caption = 'Imposto B'
    TabOrder = 2
    OnClick = btnImpBClick
  end
  object btnImpC: TButton
    Left = 8
    Top = 232
    Width = 75
    Height = 25
    Caption = 'Imposto C'
    TabOrder = 3
    OnClick = btnImpCClick
  end
  object edtImpA: TEdit
    Left = 89
    Top = 172
    Width = 82
    Height = 21
    Color = clCream
    ReadOnly = True
    TabOrder = 4
  end
  object edtImpB: TEdit
    Left = 89
    Top = 203
    Width = 82
    Height = 21
    Color = clCream
    ReadOnly = True
    TabOrder = 5
  end
  object edtImpC: TEdit
    Left = 89
    Top = 234
    Width = 82
    Height = 21
    Color = clCream
    ReadOnly = True
    TabOrder = 6
  end
end
