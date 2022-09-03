object formPrincipal: TformPrincipal
  Left = 0
  Top = 0
  Caption = 'Projeto Escola'
  ClientHeight = 299
  ClientWidth = 635
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsMDIForm
  Menu = MainMenu1
  OldCreateOrder = False
  WindowState = wsMaximized
  PixelsPerInch = 96
  TextHeight = 16
  object MainMenu1: TMainMenu
    Left = 184
    Top = 176
    object Aluno1: TMenuItem
      Caption = 'Aluno'
      OnClick = Aluno1Click
    end
    object Professor1: TMenuItem
      Caption = 'Professor'
      OnClick = Professor1Click
    end
  end
end
