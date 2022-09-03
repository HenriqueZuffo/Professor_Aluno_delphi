inherited frmAluno: TfrmAluno
  Caption = 'Aluno'
  FormStyle = fsMDIChild
  Position = poMainFormCenter
  Visible = True
  PixelsPerInch = 96
  TextHeight = 16
  inherited pnTop: TPanel
    inherited btnExcluir: TButton
      Enabled = False
    end
  end
  inherited pnCorpoTela: TPanel
    object lbl_edtdb_id: TLabel
      Left = 24
      Top = 8
      Width = 32
      Height = 16
      Caption = 'Aluno'
    end
    object btnConsultaAluno: TSpeedButton
      Left = 90
      Top = 23
      Width = 25
      Height = 24
      Caption = '...'
      OnClick = btnConsultaAlunoClick
    end
    object lbl_edtdb_nome: TLabel
      Left = 24
      Top = 48
      Width = 69
      Height = 16
      Caption = 'Nome Aluno'
    end
    object lbl_edtdb_cpf: TLabel
      Left = 24
      Top = 88
      Width = 19
      Height = 16
      Caption = 'Cpf'
    end
    object lbl_edtdb_email: TLabel
      Left = 24
      Top = 128
      Width = 31
      Height = 16
      Caption = 'Email'
    end
    object lbl_edtdb_dtNascimento: TLabel
      Left = 289
      Top = 88
      Width = 86
      Height = 16
      Caption = 'Dt. Nascimento'
    end
    object lbl_cmbdb_sexo: TLabel
      Left = 141
      Top = 88
      Width = 28
      Height = 16
      Caption = 'Sexo'
    end
    object lbl_edtdb_serie: TLabel
      Left = 415
      Top = 88
      Width = 30
      Height = 16
      Caption = 'S'#233'rie'
    end
    object edtdb_id: TDBEdit
      Left = 24
      Top = 23
      Width = 65
      Height = 24
      TabStop = False
      DataField = 'ID'
      DataSource = dmAluno.dsCadastro
      Enabled = False
      TabOrder = 0
    end
    object edtdb_nome: TDBEdit
      Left = 24
      Top = 63
      Width = 518
      Height = 24
      DataField = 'NOME'
      DataSource = dmAluno.dsCadastro
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
    end
    object edtdb_cpf: TDBEdit
      Left = 24
      Top = 103
      Width = 114
      Height = 24
      DataField = 'CPF'
      DataSource = dmAluno.dsCadastro
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
    end
    object edtdb_email: TDBEdit
      Left = 24
      Top = 143
      Width = 518
      Height = 24
      DataField = 'EMAIL'
      DataSource = dmAluno.dsCadastro
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 6
    end
    object edtdb_dtNascimento: TDBEdit
      Left = 289
      Top = 103
      Width = 123
      Height = 24
      DataField = 'DATA_NASCIMENTO'
      DataSource = dmAluno.dsCadastro
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 4
    end
    object cmbdb_sexo: TDBComboBox
      Left = 141
      Top = 103
      Width = 145
      Height = 24
      Style = csDropDownList
      DataField = 'SEXO'
      DataSource = dmAluno.dsCadastro
      Items.Strings = (
        'M - Masculino'
        'F  - Feminino'
        'O - Outro')
      TabOrder = 3
    end
    object edtdb_serie: TDBEdit
      Left = 415
      Top = 103
      Width = 127
      Height = 24
      DataField = 'SERIE'
      DataSource = dmAluno.dsCadastro
      TabOrder = 5
    end
  end
end
