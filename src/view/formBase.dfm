object frmBase: TfrmBase
  Left = 0
  Top = 0
  ClientHeight = 299
  ClientWidth = 635
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 16
  object pnTop: TPanel
    Left = 0
    Top = 0
    Width = 635
    Height = 33
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 1
    object btnConfirmar: TButton
      Left = 0
      Top = 0
      Width = 75
      Height = 33
      Align = alLeft
      Caption = 'Confirmar'
      TabOrder = 0
      OnClick = btnConfirmarClick
    end
    object btSair: TButton
      Left = 150
      Top = 0
      Width = 75
      Height = 33
      Align = alLeft
      Caption = 'Sair'
      TabOrder = 1
      OnClick = btSairClick
    end
    object btnExcluir: TButton
      Left = 75
      Top = 0
      Width = 75
      Height = 33
      Align = alLeft
      Caption = 'Excluir'
      TabOrder = 2
      OnClick = btnExcluirClick
    end
  end
  object pnCorpoTela: TPanel
    Left = 0
    Top = 33
    Width = 635
    Height = 266
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 0
  end
end
