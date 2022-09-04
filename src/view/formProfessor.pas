unit formProfessor;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, formBase, Vcl.StdCtrls, Vcl.ExtCtrls,
  Vcl.Mask, Vcl.DBCtrls, DProfessor, Data.DB, Vcl.Grids, Vcl.DBGrids,
  Vcl.Buttons, formConsAluno, uUtils, formConsProfessor;

type
  TTipoBuscaAluno = (tbInsert, tbEdit);

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
    procedure FormShow(Sender: TObject);
    procedure btnConsultaProfessorClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnCalcularClick(Sender: TObject);
    procedure btnNovoClick(Sender: TObject);
  private
    { Private declarations }

    procedure buscarAluno(const ATipoBusca: TTipoBuscaAluno = tbInsert);
    procedure AjustaEnableCampos(const habilitar: boolean);
  public

    { Public declarations }
  end;

var
  frmProfessor: TfrmProfessor;

implementation

uses
  FireDAC.Comp.Client, System.Generics.Collections, uCalculo;

{$R *.dfm}

{ TfrmProfessor }

procedure TfrmProfessor.AjustaEnableCampos(const habilitar: boolean);
var
  i: integer;
begin
  for I := 0 to ComponentCount-1 do begin
    if TWinControl(Components[i]).Tag = 1 then
      TWinControl(Components[i]).Enabled := habilitar;     
  end;                                              
end;

procedure TfrmProfessor.btnCalcularClick(Sender: TObject);
var
  listaNotas: TArray<Double>;
  oldBookMark: TBookmark;
begin
  inherited;

  if TdmProfessor(self.dm).queryProfessorAluno.RecordCount <= 0 then begin
    Exit;
  end;

  try
    TdmProfessor(self.dm).queryProfessorAluno.DisableControls;
    oldBookMark := TdmProfessor(self.dm).queryProfessorAluno.Bookmark;


    TdmProfessor(self.dm).queryProfessorAluno.First;
    while not TdmProfessor(self.dm).queryProfessorAluno.Eof do begin
      listaNotas := TArray<Double>.Create(TdmProfessor(self.dm).queryProfessorAlunoNOTA_PRIMEIRO_BIMESTRE.AsFloat,
        TdmProfessor(self.dm).queryProfessorAlunoNOTA_SEGUNDO_BIMESTRE.AsFloat,
        TdmProfessor(self.dm).queryProfessorAlunoNOTA_TERCEIRO_BIMESTRE.AsFloat,
        TdmProfessor(self.dm).queryProfessorAlunoNOTA_QUARTO_BIMESTRE.AsFloat);

      TdmProfessor(self.dm).queryProfessorAluno.edit;
      TdmProfessor(self.dm).queryProfessorAlunoMAIOR_NOTA.AsFloat := TCalculoMaior.calcular(listaNotas);
      TdmProfessor(self.dm).queryProfessorAlunoMENOR_NOTA.AsFloat := TCalculoMenor.calcular(listaNotas);
      TdmProfessor(self.dm).queryProfessorAlunoMEDIA_NOTA.AsFloat := TCalculoMedia.calcular(listaNotas);
      TdmProfessor(self.dm).queryProfessorAluno.post;

      TdmProfessor(self.dm).queryProfessorAluno.Next;
    end;

  finally
    TdmProfessor(self.dm).queryProfessorAluno.GotoBookmark(oldBookMark);
    TdmProfessor(self.dm).queryProfessorAluno.EnableControls;
  end;
end;

procedure TfrmProfessor.btnConsultaAlunoClick(Sender: TObject);
begin
  inherited;
  buscarAluno(tbEdit);
end;

procedure TfrmProfessor.btnConsultaProfessorClick(Sender: TObject);
var
  formConsultaProfessor: TFrmConsProfessor;
begin
  inherited;
  try
    formConsultaProfessor := TFrmConsProfessor.Create(Self);  
    formConsultaProfessor.formStyle := fsNormal;
    formConsultaProfessor.Visible := false;
    formConsultaProfessor.ShowModal;

    if (formConsultaProfessor.ValueReturn > 0) then begin 
      TdmProfessor(self.dm).queryCadastro.close;
      TdmProfessor(self.dm).queryCadastro.ParamByName('ID').AsInteger := formConsultaProfessor.ValueReturn;
      TdmProfessor(self.dm).queryCadastro.Open;

      btnExcluir.Enabled:= true;  
      AjustaEnableCampos(true);
      btnExcluirAluno.Enabled := TdmProfessor(self.dm).queryProfessorAluno.RecordCount > 0;
    end;
  finally
    FreeAndNil(formConsultaProfessor);
  end;
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

procedure TfrmProfessor.btnNovoClick(Sender: TObject);
begin
  inherited;
  AjustaEnableCampos(false);
end;

procedure TfrmProfessor.buscarAluno(const ATipoBusca: TTipoBuscaAluno = tbInsert);
var
  formConsAluno: TfrmConsAluno;
begin

  try
    formConsAluno := TfrmConsAluno.Create(Self);
    formConsAluno.FormStyle := fsNormal;
    formConsAluno.Visible := False;
    formConsAluno.idProfessor := TdmProfessor(self.dm).queryCadastroID.AsInteger;
    formConsAluno.ShowModal;

    if formConsAluno.ValueReturn > 0 then begin
      if ATipoBusca = tbInsert then begin
        TDmProfessor(self.dm).queryProfessorAluno.Append;
      end else begin
        TDmProfessor(self.dm).queryProfessorAluno.Edit;
      end;

      TDmProfessor(self.dm).queryProfessorAlunoID_ALUNO.AsInteger := formConsAluno.ValueReturn;
      TDmProfessor(self.dm).queryProfessorAlunoID_PROFESSOR.AsInteger := TDmProfessor(self.dm).queryCadastroID.AsInteger;
      TDmProfessor(self.dm).queryProfessorAluno.Post;
      btnExcluirAluno.Enabled := true;
    end;
  finally
    FreeAndNil(formConsAluno);
  end;
end;

procedure TfrmProfessor.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  frmProfessor := nil;
  dmProfessor := nil;
end;

procedure TfrmProfessor.FormShow(Sender: TObject);
begin
  inherited;
  AjustaEnableCampos(false);
end;

end.
