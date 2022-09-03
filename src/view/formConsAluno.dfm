inherited frmConsAluno: TfrmConsAluno
  Caption = 'Consulta de Aluno'
  PixelsPerInch = 96
  TextHeight = 16
  inherited pnTop: TPanel
    inherited edt_desc: TEdit
      OnChange = edt_descChange
    end
  end
  inherited pnGrid: TPanel
    ExplicitLeft = 0
    ExplicitTop = 81
    ExplicitWidth = 635
    ExplicitHeight = 185
    inherited dbGridConsulta: TDBGrid
      DataSource = DataSource1
      ReadOnly = True
      Columns = <
        item
          Alignment = taRightJustify
          Expanded = False
          FieldName = 'ID'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          Title.Alignment = taCenter
          Width = 71
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'NOME'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          Title.Alignment = taCenter
          Title.Caption = 'Nome'
          Width = 200
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DATA_NASCIMENTO'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          Title.Alignment = taCenter
          Title.Caption = 'Dt. Nascimento'
          Width = 133
          Visible = True
        end
        item
          Alignment = taRightJustify
          Expanded = False
          FieldName = 'SERIE'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          Title.Alignment = taCenter
          Title.Caption = 'S'#233'rie'
          Width = 99
          Visible = True
        end>
    end
  end
  inherited pnRodaPe: TPanel
    inherited btnImportar: TButton
      ExplicitLeft = 560
      ExplicitTop = 0
      ExplicitHeight = 33
    end
  end
  inherited queryConsulta: TFDQuery
    SQL.Strings = (
      'select id,'
      '       nome,'
      '       data_nascimento,'
      '       serie  '
      '  from aluno'
      ' ')
  end
end
