inherited frmConsProfessor: TfrmConsProfessor
  Caption = 'Consulta Professor'
  PixelsPerInch = 96
  TextHeight = 16
  inherited pnTop: TPanel
    inherited edt_desc: TEdit
      OnChange = edt_descChange
    end
  end
  inherited pnGrid: TPanel
    inherited dbGridConsulta: TDBGrid
      DataSource = DataSource1
      ReadOnly = True
      Columns = <
        item
          Expanded = False
          FieldName = 'ID'
          Title.Alignment = taCenter
          Title.Caption = 'Professor'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'NOME'
          Title.Alignment = taCenter
          Title.Caption = 'Nome'
          Width = 250
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DISCIPLINA'
          Title.Alignment = taCenter
          Title.Caption = 'Disciplina'
          Width = 150
          Visible = True
        end>
    end
  end
  inherited queryConsulta: TFDQuery
    SQL.Strings = (
      'select id,'
      '       nome,'
      '       disciplina '
      '  from professor')
    object queryConsultaID: TIntegerField
      FieldName = 'ID'
      Origin = 'ID'
      ProviderFlags = []
    end
    object queryConsultaDISCIPLINA: TStringField
      FieldName = 'DISCIPLINA'
      Origin = 'NOME'
      ProviderFlags = []
      Size = 200
    end
    object queryConsultaNOME: TStringField
      FieldName = 'NOME'
      Origin = 'NOME'
      ProviderFlags = []
      Size = 200
    end
  end
end
