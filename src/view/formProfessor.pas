unit formProfessor;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, formBase, Vcl.StdCtrls, Vcl.ExtCtrls,
  Vcl.Mask, Vcl.DBCtrls, DProfessor, Data.DB, Vcl.Grids, Vcl.DBGrids,
  Vcl.Buttons, formConsAluno, uUtils;

type
  TfrmProfessor = class(TfrmBase)
    gbAlunos: TGroupBox;
    pnProfessor: TPanel;
    lbl_edtdb_id: TLabel;
    edtdb_id: TDBEdit;
    lbl_edtdb_nome: TLabel;
    edtdb_nome: TDBEdit;
    lbl_edtdb_cpf: TLabel;
    lbl_cmbdb_sexo: TLabel;
    lbl_edtdb_dtNascimento: TLabel;
    lbl_edtdb_disciplina: TLabel;
    edtdb_disciplina: TDBEdit;
    edtdb_dtNascimento: TDBEdit;
    edtdb_sexo: TDBEdit;
    edtdb_cpf: TDBEdit;
    lbl_edtdb_email: TLabel;
    edtdb_email: TDBEdit;
    pnBtnsAlunos: TPanel;
    pnInfoAlunos: TPanel;
    pnCamposAlunos: TPanel;
    pnGridAlunos: TPanel;
    lbl_edtdb_aluno: TLabel;
    edtdb_aluno: TDBEdit;
    lbl_edtdb_nomeAluno: TLabel;
    edtdb_nomeAluno: TDBEdit;
    lbl_edtdb_notaPrimeiroBimestre: TLabel;
    edtdb_notaPrimeiroBimestre: TDBEdit;
    lbl_edtdb_notaSegundoBimestre: TLabel;
    edtdb_notaSegundoBimestre: TDBEdit;
    lbl_edtdb_notaTerceiroBimestre: TLabel;
    edtdb_notaTerceiroBimestre: TDBEdit;
    lbl_edtdb_notaQuartoBimestre: TLabel;
    edtdb_notaQuartoBimestre: TDBEdit;
    lbl_edtdb_ano: TLabel;
    edtdb_ano: TDBEdit;
    edtdb_maiorNota: TDBEdit;
    edtdb_menorNota: TDBEdit;
    edtdb_mediaNota: TDBEdit;
    lbl_edtdb_maiorNota: TLabel;
    lbl_edtdb_MenorNota: TLabel;
    lbl_edtdb_MediaNota: TLabel;
    DBGrid1: TDBGrid;
    btnExcluirAluno: TButton;
    btnIncluirAluno: TButton;
    btnCalcular: TButton;
    btnConsultaProfessor: TSpeedButton;
    btnConsultaAluno: TSpeedButton;
    procedure btnConsultaAlunoClick(Sender: TObject);
    procedure btnIncluirAlunoClick(Sender: TObject);
    procedure btnExcluirAlunoClick(Sender: TObject);
  private
    { Private declarations }

    procedure buscarAluno;
  public

    { Public declarations }
  end;

var
  frmProfessor: TfrmProfessor;

implementation

{$R *.dfm}

{ TfrmProfessor }

procedure TfrmProfessor.btnConsultaAlunoClick(Sender: TObject);
begin
  inherited;
  buscarAluno;
end;

procedure TfrmProfessor.btnExcluirAlunoClick(Sender: TObject);
begin
  inherited;
  if TMessageBox.confirmar('Deseja excluir o registro selecionado?', moNao, miPergunta) = moNao then Exit;

  TDmProfessor(self.dm).queryProfessorAluno.Delete;
  btnExcluirAluno.Enabled :=  TDmProfessor(self.dm).queryProfessorAluno.RecordCount > 0;
end;

procedure TfrmProfessor.btnIncluirAlunoClick(Sender: TObject);
begin
  inherited;
  buscarAluno;
end;

procedure TfrmProfessor.buscarAluno;
var
  formConsAluno: TfrmConsAluno;
begin

  try
    formConsAluno := TfrmConsAluno.Create(Self);
    formConsAluno.FormStyle := fsNormal;
    formConsAluno.Visible := False;
    formConsAluno.ShowModal;

    if formConsAluno.ValueReturn > 0 then begin
      TDmProfessor(self.dm).queryProfessorAluno.Insert;
      TDmProfessor(self.dm).queryProfessorAlunoID_PROFESSOR.AsInteger := TDmProfessor(self.dm).queryCadastroID.AsInteger;
      TDmProfessor(self.dm).queryProfessorAlunoID_ALUNO.AsInteger := formConsAluno.ValueReturn;
      TDmProfessor(self.dm).queryProfessorAluno.Post;
      btnExcluirAluno.Enabled := true;
    end;
  finally
    FreeAndNil(formConsAluno);
  end;
end;

end.
