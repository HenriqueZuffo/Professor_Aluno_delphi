inherited dmProfessor: TdmProfessor
  OldCreateOrder = True
  inherited queryCadastro: TFDQuery
    AfterOpen = queryCadastroAfterOpen
    AfterClose = queryCadastroAfterClose
    SQL.Strings = (
      'select * '
      '  from professor'
      'where id = :id')
    ParamData = <
      item
        Name = 'ID'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
    object queryCadastroID: TIntegerField
      FieldName = 'ID'
      Origin = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object queryCadastroNOME: TStringField
      FieldName = 'NOME'
      Origin = 'NOME'
      ProviderFlags = [pfInUpdate]
      Required = True
      Size = 200
    end
    object queryCadastroCPF: TStringField
      DisplayWidth = 14
      FieldName = 'CPF'
      Origin = 'CPF'
      ProviderFlags = [pfInUpdate]
      EditMask = '000\.000\.000\-00;1;_'
      Size = 14
    end
    object queryCadastroSEXO: TStringField
      FieldName = 'SEXO'
      Origin = 'SEXO'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 50
    end
    object queryCadastroDATA_NASCIMENTO: TDateField
      FieldName = 'DATA_NASCIMENTO'
      Origin = 'DATA_NASCIMENTO'
      ProviderFlags = [pfInUpdate]
      EditMask = '!99/99/00;1;_'
    end
    object queryCadastroEMAIL: TStringField
      FieldName = 'EMAIL'
      Origin = 'EMAIL'
      ProviderFlags = [pfInUpdate]
      Size = 300
    end
    object queryCadastroDISCIPLINA: TStringField
      FieldName = 'DISCIPLINA'
      Origin = 'DISCIPLINA'
      ProviderFlags = [pfInUpdate]
      Size = 50
    end
  end
  object queryProfessorAluno: TFDQuery
    Connection = dmConexaoBanco.base
    SQL.Strings = (
      'SELECT pa.*,'
      '       a.NOME  AS nome_aluno,'
      '       cast(null as double precision) as maior_nota,'
      '       cast(null as double precision) as menor_nota,'
      '       cast(null as double precision) as media_nota'
      '  FROM PROFESSOR_ALUNO pa'
      ' INNER JOIN aluno a ON a.ID = pa.ID_ALUNO'
      ' where id_professor = :idprofessor')
    Left = 128
    Top = 264
    ParamData = <
      item
        Name = 'IDPROFESSOR'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
    object queryProfessorAlunoID_PROFESSOR: TIntegerField
      FieldName = 'ID_PROFESSOR'
      Origin = 'ID_PROFESSOR'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object queryProfessorAlunoID_ALUNO: TIntegerField
      FieldName = 'ID_ALUNO'
      Origin = 'ID_ALUNO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      OnValidate = queryProfessorAlunoID_ALUNOValidate
    end
    object queryProfessorAlunoANO: TIntegerField
      FieldName = 'ANO'
      Origin = 'ANO'
      ProviderFlags = [pfInUpdate]
    end
    object queryProfessorAlunoNOTA_PRIMEIRO_BIMESTRE: TFloatField
      FieldName = 'NOTA_PRIMEIRO_BIMESTRE'
      Origin = 'NOTA_PRIMEIRO_BIMESTRE'
      ProviderFlags = [pfInUpdate]
      DisplayFormat = '0.00,'
    end
    object queryProfessorAlunoNOTA_SEGUNDO_BIMESTRE: TFloatField
      FieldName = 'NOTA_SEGUNDO_BIMESTRE'
      Origin = 'NOTA_SEGUNDO_BIMESTRE'
      ProviderFlags = [pfInUpdate]
      DisplayFormat = '0.00,'
    end
    object queryProfessorAlunoNOTA_TERCEIRO_BIMESTRE: TFloatField
      FieldName = 'NOTA_TERCEIRO_BIMESTRE'
      Origin = 'NOTA_TERCEIRO_BIMESTRE'
      ProviderFlags = [pfInUpdate]
      DisplayFormat = '0.00,'
    end
    object queryProfessorAlunoNOTA_QUARTO_BIMESTRE: TFloatField
      FieldName = 'NOTA_QUARTO_BIMESTRE'
      Origin = 'NOTA_QUARTO_BIMESTRE'
      ProviderFlags = [pfInUpdate]
      DisplayFormat = '0.00,'
    end
    object queryProfessorAlunoNOME_ALUNO: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'NOME_ALUNO'
      Origin = 'NOME'
      ProviderFlags = []
      Size = 200
    end
    object queryProfessorAlunoMAIOR_NOTA: TFloatField
      AutoGenerateValue = arDefault
      FieldName = 'MAIOR_NOTA'
      Origin = 'MAIOR_NOTA'
      ProviderFlags = []
      DisplayFormat = '0.00,'
    end
    object queryProfessorAlunoMENOR_NOTA: TFloatField
      AutoGenerateValue = arDefault
      FieldName = 'MENOR_NOTA'
      Origin = 'MENOR_NOTA'
      ProviderFlags = []
      DisplayFormat = '0.00,'
    end
    object queryProfessorAlunoMEDIA_NOTA: TFloatField
      AutoGenerateValue = arDefault
      FieldName = 'MEDIA_NOTA'
      Origin = 'MEDIA_NOTA'
      ProviderFlags = []
      DisplayFormat = '0.00,'
    end
  end
  object dsProfessorAluno: TDataSource
    DataSet = queryProfessorAluno
    Left = 272
    Top = 272
  end
end
