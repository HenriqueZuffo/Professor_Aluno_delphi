unit DProfessor;

interface

uses
  System.SysUtils, System.Classes, DBase, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client, uConexaoBanco, uProfessor,
  FireDAC.Phys.SQLiteVDataSet;

type
  TdmProfessor = class(TdmBase)
    queryProfessorAluno: TFDQuery;
    dsProfessorAluno: TDataSource;
    queryCadastroID: TIntegerField;
    queryCadastroNOME: TStringField;
    queryCadastroCPF: TStringField;
    queryCadastroSEXO: TStringField;
    queryCadastroDATA_NASCIMENTO: TDateField;
    queryCadastroEMAIL: TStringField;
    queryCadastroDISCIPLINA: TStringField;
    queryProfessorAlunoID_PROFESSOR: TIntegerField;
    queryProfessorAlunoID_ALUNO: TIntegerField;
    queryProfessorAlunoANO: TIntegerField;
    queryProfessorAlunoNOTA_PRIMEIRO_BIMESTRE: TFloatField;
    queryProfessorAlunoNOTA_SEGUNDO_BIMESTRE: TFloatField;
    queryProfessorAlunoNOTA_TERCEIRO_BIMESTRE: TFloatField;
    queryProfessorAlunoNOTA_QUARTO_BIMESTRE: TFloatField;
    queryProfessorAlunoNOME_ALUNO: TStringField;
    queryProfessorAlunoMAIOR_NOTA: TFloatField;
    queryProfessorAlunoMENOR_NOTA: TFloatField;
    queryProfessorAlunoMEDIA_NOTA: TFloatField;
    procedure queryProfessorAlunoID_ALUNOValidate(Sender: TField);
    procedure queryCadastroAfterClose(DataSet: TDataSet);
    procedure queryCadastroAfterOpen(DataSet: TDataSet);
  private
    { Private declarations }
  public
    procedure salvar; override;
    procedure excluir(const id: integer); override;
    { Public declarations }
  end;

var
  dmProfessor: TdmProfessor;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}
{$R *.dfm}
{ TdmProfessor }

procedure TdmProfessor.excluir(const id: integer);
begin
  inherited;

  try
    dmConexaoBanco.base.StartTransaction;
    TProfessor.excluir(id);
    dmConexaoBanco.base.Commit;
  except
    on e: exception do
    begin
      dmConexaoBanco.base.Rollback;
      raise exception.Create(e.Message);
    end;
  end;
end;

procedure TdmProfessor.queryCadastroAfterClose(DataSet: TDataSet);
begin
  inherited;
  queryProfessorAluno.Close;
  queryProfessorAluno.ParamByName('IDPROFESSOR').Clear;
end;

procedure TdmProfessor.queryCadastroAfterOpen(DataSet: TDataSet);
begin
  inherited;
  queryProfessorAluno.close;
  queryProfessorAluno.ParamByName('IDPROFESSOR').Clear;
  if queryCadastroID.AsInteger > 0 then begin
    queryProfessorAluno.ParamByName('IDPROFESSOR').AsInteger := queryCadastroID.AsInteger;
    queryProfessorAluno.Open;
  end;
end;

procedure TdmProfessor.queryProfessorAlunoID_ALUNOValidate(Sender: TField);
begin
  inherited;
  queryProfessorAlunoNOME_ALUNO.Clear;
  if Sender.AsInteger = 0 then Exit;

  dmConexaoBanco.queryGenerica.SQL.Clear;
  dmConexaoBanco.queryGenerica.SQL.Add('select nome from aluno where id = :id');
  dmConexaoBanco.queryGenerica.ParamByName('ID').AsInteger := Sender.AsInteger;
  dmConexaoBanco.queryGenerica.Open;

  queryProfessorAlunoNOME_ALUNO.AsString := dmConexaoBanco.queryGenerica.FieldByName('NOME').AsString;
end;

procedure TdmProfessor.salvar;
var
  Professor: TProfessor;
  alunoProfessor: TProfessor.TAlunoProfessor;
begin
  inherited;
  try
    professor := TProfessor.create(queryCadastroNOME.AsString);
    professor.id := queryCadastroID.AsInteger;
    professor.cpf := queryCadastroCPF.AsString;
    professor.sexo := queryCadastroSEXO.AsString;
    professor.data_nascimento := queryCadastroDATA_NASCIMENTO.AsDateTime;
    professor.email := queryCadastroEMAIL.AsString;
    professor.disciplina := queryCadastroDISCIPLINA.AsString;

    if queryProfessorAluno.Active then begin
      queryProfessorAluno.First;
      while not queryProfessorAluno.Eof do begin
        alunoProfessor := TProfessor.TAlunoProfessor.Create;
        alunoProfessor.id_aluno := queryProfessorAlunoID_ALUNO.AsInteger;
        alunoProfessor.ano := queryProfessorAlunoANO.AsInteger;
        alunoProfessor.notaPrimeiroBimestre := queryProfessorAlunoNOTA_PRIMEIRO_BIMESTRE.AsFloat;
        alunoProfessor.notaSegundoBimestre := queryProfessorAlunoNOTA_SEGUNDO_BIMESTRE.AsFloat;
        alunoProfessor.notaTerceiroBimestre := queryProfessorAlunoNOTA_TERCEIRO_BIMESTRE.AsFloat;
        alunoProfessor.notaQuartoBimestre := queryProfessorAlunoNOTA_QUARTO_BIMESTRE.AsFloat;

        professor.alunosProfessor.Add(alunoProfessor);
        queryProfessorAluno.Next;
      end;
    end;

    try
      dmConexaoBanco.base.StartTransaction;
      professor.salvar;
      dmConexaoBanco.base.Commit;
    except
      on e: exception do begin
        dmConexaoBanco.base.Rollback;
        raise Exception.Create(e.Message);
      end;
    end;
  finally
    FreeAndNil(Professor);
  end;
end;

end.
