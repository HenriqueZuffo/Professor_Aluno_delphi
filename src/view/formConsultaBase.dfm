object frmConsultaBase: TfrmConsultaBase
  Left = 0
  Top = 0
  Caption = 'Consulta Base'
  ClientHeight = 299
  ClientWidth = 635
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 16
  object pnTop: TPanel
    Left = 0
    Top = 0
    Width = 635
    Height = 81
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 0
    object lbl_descricao: TLabel
      Left = 24
      Top = 16
      Width = 55
      Height = 16
      Caption = 'Descri'#231#227'o'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object edt_desc: TEdit
      Left = 24
      Top = 34
      Width = 385
      Height = 24
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
    end
  end
  object pnGrid: TPanel
    Left = 0
    Top = 81
    Width = 635
    Height = 185
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 1
    ExplicitLeft = 216
    ExplicitTop = 168
    ExplicitWidth = 185
    ExplicitHeight = 41
    object dbGridConsulta: TDBGrid
      Left = 0
      Top = 0
      Width = 635
      Height = 185
      Align = alClient
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -13
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      OnDblClick = dbGridConsultaDblClick
      OnKeyDown = dbGridConsultaKeyDown
    end
  end
  object pnRodaPe: TPanel
    Left = 0
    Top = 266
    Width = 635
    Height = 33
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 2
    object btnImportar: TButton
      Left = 560
      Top = 0
      Width = 75
      Height = 33
      Align = alRight
      Caption = 'Importar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      OnClick = btnImportarClick
      ExplicitLeft = 520
      ExplicitTop = 6
      ExplicitHeight = 25
    end
  end
  object DataSource1: TDataSource
    DataSet = queryConsulta
    Left = 368
    Top = 16
  end
  object queryConsulta: TFDQuery
    Connection = dmConexaoBanco.base
    Left = 448
    Top = 16
  end
end
