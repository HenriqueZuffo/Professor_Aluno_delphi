inherited frmProfessor: TfrmProfessor
  Caption = 'Professor'
  ClientHeight = 703
  ClientWidth = 662
  FormStyle = fsMDIChild
  Visible = True
  ExplicitWidth = 678
  ExplicitHeight = 742
  PixelsPerInch = 96
  TextHeight = 16
  inherited pnTop: TPanel
    Width = 662
  end
  inherited pnCorpoTela: TPanel
    Width = 662
    Height = 670
    object gbAlunos: TGroupBox
      Left = 0
      Top = 208
      Width = 662
      Height = 462
      Align = alBottom
      Caption = 'Alunos'
      TabOrder = 0
      ExplicitWidth = 795
      object pnBtnsAlunos: TPanel
        Left = 579
        Top = 18
        Width = 81
        Height = 442
        Align = alRight
        BevelOuter = bvNone
        TabOrder = 0
        ExplicitLeft = 718
        ExplicitTop = 111
        ExplicitHeight = 214
        object btnExcluirAluno: TButton
          Left = 0
          Top = 82
          Width = 81
          Height = 41
          Align = alTop
          Caption = 'Excluir'
          Enabled = False
          TabOrder = 0
          OnClick = btnExcluirAlunoClick
          ExplicitTop = 0
        end
        object btnIncluirAluno: TButton
          Left = 0
          Top = 41
          Width = 81
          Height = 41
          Align = alTop
          Caption = 'Incluir'
          TabOrder = 1
          OnClick = btnIncluirAlunoClick
          ExplicitTop = 8
        end
        object btnCalcular: TButton
          Left = 0
          Top = 0
          Width = 81
          Height = 41
          Align = alTop
          Caption = 'Calcular'
          TabOrder = 2
          ExplicitTop = 8
        end
      end
      object pnInfoAlunos: TPanel
        Left = 2
        Top = 18
        Width = 577
        Height = 442
        Align = alClient
        BevelOuter = bvNone
        TabOrder = 1
        ExplicitLeft = 718
        ExplicitTop = 111
        ExplicitWidth = 81
        ExplicitHeight = 214
        object pnCamposAlunos: TPanel
          Left = 0
          Top = 0
          Width = 577
          Height = 201
          Align = alTop
          BevelOuter = bvNone
          TabOrder = 0
          object lbl_edtdb_aluno: TLabel
            Left = 32
            Top = 16
            Width = 32
            Height = 16
            Caption = 'Aluno'
          end
          object lbl_edtdb_nomeAluno: TLabel
            Left = 32
            Top = 56
            Width = 69
            Height = 16
            Caption = 'Nome Aluno'
          end
          object lbl_edtdb_notaPrimeiroBimestre: TLabel
            Left = 32
            Top = 96
            Width = 97
            Height = 16
            Caption = 'Nota 1'#186' Bimestre'
          end
          object lbl_edtdb_notaSegundoBimestre: TLabel
            Left = 149
            Top = 96
            Width = 97
            Height = 16
            Caption = 'Nota 2'#186' Bimestre'
          end
          object lbl_edtdb_notaTerceiroBimestre: TLabel
            Left = 297
            Top = 96
            Width = 97
            Height = 16
            Caption = 'Nota 3'#186' Bimestre'
          end
          object lbl_edtdb_notaQuartoBimestre: TLabel
            Left = 423
            Top = 96
            Width = 97
            Height = 16
            Caption = 'Nota 4'#186' Bimestre'
          end
          object lbl_edtdb_ano: TLabel
            Left = 423
            Top = 16
            Width = 22
            Height = 16
            Caption = 'Ano'
          end
          object lbl_edtdb_maiorNota: TLabel
            Left = 400
            Top = 141
            Width = 62
            Height = 16
            Caption = 'Maior Nota'
          end
          object lbl_edtdb_MenorNota: TLabel
            Left = 32
            Top = 141
            Width = 66
            Height = 16
            Caption = 'Menor Nota'
          end
          object lbl_edtdb_MediaNota: TLabel
            Left = 216
            Top = 141
            Width = 34
            Height = 16
            Caption = 'M'#233'dia'
          end
          object btnConsultaAluno: TSpeedButton
            Left = 98
            Top = 31
            Width = 25
            Height = 24
            Caption = '...'
            OnClick = btnConsultaAlunoClick
          end
          object edtdb_aluno: TDBEdit
            Left = 32
            Top = 31
            Width = 65
            Height = 24
            TabStop = False
            DataField = 'ID_ALUNO'
            DataSource = dmProfessor.dsProfessorAluno
            Enabled = False
            ReadOnly = True
            TabOrder = 0
          end
          object edtdb_nomeAluno: TDBEdit
            Left = 32
            Top = 71
            Width = 518
            Height = 24
            TabStop = False
            DataField = 'NOME_ALUNO'
            DataSource = dmProfessor.dsProfessorAluno
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 1
          end
          object edtdb_notaPrimeiroBimestre: TDBEdit
            Left = 32
            Top = 111
            Width = 114
            Height = 24
            DataField = 'NOTA_PRIMEIRO_BIMESTRE'
            DataSource = dmProfessor.dsProfessorAluno
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            TabOrder = 2
          end
          object edtdb_notaSegundoBimestre: TDBEdit
            Left = 149
            Top = 111
            Width = 145
            Height = 24
            DataField = 'NOTA_SEGUNDO_BIMESTRE'
            DataSource = dmProfessor.dsProfessorAluno
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            TabOrder = 3
          end
          object edtdb_notaTerceiroBimestre: TDBEdit
            Left = 297
            Top = 111
            Width = 123
            Height = 24
            DataField = 'NOTA_TERCEIRO_BIMESTRE'
            DataSource = dmProfessor.dsProfessorAluno
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            TabOrder = 4
          end
          object edtdb_notaQuartoBimestre: TDBEdit
            Left = 423
            Top = 111
            Width = 127
            Height = 24
            DataField = 'NOTA_QUARTO_BIMESTRE'
            DataSource = dmProfessor.dsProfessorAluno
            TabOrder = 5
          end
          object edtdb_ano: TDBEdit
            Left = 423
            Top = 31
            Width = 127
            Height = 24
            DataField = 'ANO'
            DataSource = dmProfessor.dsProfessorAluno
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            TabOrder = 6
          end
          object edtdb_maiorNota: TDBEdit
            Left = 400
            Top = 157
            Width = 150
            Height = 24
            TabStop = False
            DataField = 'MAIOR_NOTA'
            DataSource = dmProfessor.dsProfessorAluno
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 7
          end
          object edtdb_menorNota: TDBEdit
            Left = 32
            Top = 157
            Width = 150
            Height = 24
            TabStop = False
            DataField = 'MENOR_NOTA'
            DataSource = dmProfessor.dsProfessorAluno
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 8
          end
          object edtdb_mediaNota: TDBEdit
            Left = 216
            Top = 157
            Width = 150
            Height = 24
            TabStop = False
            DataField = 'MEDIA_NOTA'
            DataSource = dmProfessor.dsProfessorAluno
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 9
          end
        end
        object pnGridAlunos: TPanel
          Left = 0
          Top = 201
          Width = 577
          Height = 241
          Align = alClient
          BevelOuter = bvNone
          TabOrder = 1
          ExplicitLeft = 718
          ExplicitTop = 111
          ExplicitWidth = 81
          ExplicitHeight = 214
          object DBGrid1: TDBGrid
            Left = 0
            Top = 0
            Width = 577
            Height = 241
            Align = alClient
            DataSource = dmProfessor.dsProfessorAluno
            TabOrder = 0
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -13
            TitleFont.Name = 'Tahoma'
            TitleFont.Style = []
            Columns = <
              item
                Expanded = False
                FieldName = 'ID_ALUNO'
                ReadOnly = True
                Title.Alignment = taCenter
                Title.Caption = 'Aluno'
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'NOME_ALUNO'
                Title.Alignment = taCenter
                Title.Caption = 'Nome Aluno'
                Width = 150
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'ANO'
                Title.Alignment = taCenter
                Title.Caption = 'Ano'
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'NOTA_PRIMEIRO_BIMESTRE'
                Title.Alignment = taCenter
                Title.Caption = 'Nota 1'#186' Bimestre'
                Width = 119
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'NOTA_SEGUNDO_BIMESTRE'
                Title.Alignment = taCenter
                Title.Caption = 'Nota 2'#186' Bimestre'
                Width = 129
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'NOTA_TERCEIRO_BIMESTRE'
                Title.Alignment = taCenter
                Title.Caption = 'Nota 3'#186' Bimestre'
                Width = 117
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'NOTA_QUARTO_BIMESTRE'
                Title.Alignment = taCenter
                Title.Caption = 'Nota 4'#186' Bimestre'
                Width = 113
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'MENOR_NOTA'
                Title.Alignment = taCenter
                Title.Caption = 'Menor Nota'
                Width = 91
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'MEDIA_NOTA'
                Title.Alignment = taCenter
                Title.Caption = 'M'#233'dia'
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'MAIOR_NOTA'
                Title.Alignment = taCenter
                Title.Caption = 'Maior Nota'
                Width = 78
                Visible = True
              end>
          end
        end
      end
    end
    object pnProfessor: TPanel
      Left = 0
      Top = 0
      Width = 662
      Height = 208
      Align = alClient
      BevelOuter = bvNone
      TabOrder = 1
      ExplicitWidth = 795
      ExplicitHeight = 225
      object lbl_edtdb_id: TLabel
        Left = 24
        Top = 8
        Width = 54
        Height = 16
        Caption = 'Professor'
      end
      object lbl_edtdb_nome: TLabel
        Left = 24
        Top = 48
        Width = 91
        Height = 16
        Caption = 'Nome Professor'
      end
      object lbl_edtdb_cpf: TLabel
        Left = 24
        Top = 88
        Width = 19
        Height = 16
        Caption = 'Cpf'
      end
      object lbl_cmbdb_sexo: TLabel
        Left = 141
        Top = 88
        Width = 28
        Height = 16
        Caption = 'Sexo'
      end
      object lbl_edtdb_dtNascimento: TLabel
        Left = 289
        Top = 88
        Width = 86
        Height = 16
        Caption = 'Dt. Nascimento'
      end
      object lbl_edtdb_disciplina: TLabel
        Left = 415
        Top = 88
        Width = 53
        Height = 16
        Caption = 'Disciplina'
      end
      object lbl_edtdb_email: TLabel
        Left = 24
        Top = 128
        Width = 31
        Height = 16
        Caption = 'Email'
      end
      object btnConsultaProfessor: TSpeedButton
        Left = 90
        Top = 23
        Width = 25
        Height = 24
        Caption = '...'
      end
      object edtdb_id: TDBEdit
        Left = 24
        Top = 23
        Width = 65
        Height = 24
        TabStop = False
        DataField = 'ID'
        DataSource = dmProfessor.dsCadastro
        Enabled = False
        TabOrder = 0
      end
      object edtdb_nome: TDBEdit
        Left = 24
        Top = 63
        Width = 518
        Height = 24
        DataField = 'NOME'
        DataSource = dmProfessor.dsCadastro
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 1
      end
      object edtdb_disciplina: TDBEdit
        Left = 415
        Top = 103
        Width = 127
        Height = 24
        DataField = 'DISCIPLINA'
        DataSource = dmProfessor.dsCadastro
        TabOrder = 2
      end
      object edtdb_dtNascimento: TDBEdit
        Left = 289
        Top = 103
        Width = 123
        Height = 24
        DataField = 'DATA_NASCIMENTO'
        DataSource = dmProfessor.dsCadastro
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 3
      end
      object edtdb_sexo: TDBEdit
        Left = 141
        Top = 103
        Width = 145
        Height = 24
        DataField = 'SEXO'
        DataSource = dmProfessor.dsCadastro
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 4
      end
      object edtdb_cpf: TDBEdit
        Left = 24
        Top = 103
        Width = 114
        Height = 24
        DataField = 'CPF'
        DataSource = dmProfessor.dsCadastro
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 5
      end
      object edtdb_email: TDBEdit
        Left = 24
        Top = 143
        Width = 518
        Height = 24
        DataField = 'EMAIL'
        DataSource = dmProfessor.dsCadastro
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 6
      end
    end
  end
end
