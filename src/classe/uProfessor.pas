unit uProfessor;

interface

uses
  uPessoa, System.Classes, System.Generics.Collections, uConexaoBanco;

type
  TTipoExclusao = (teProfessor, teAluno);

  TProfessor = class(TPessoa)
  type
    TAlunoProfessor = class
    public
      id_aluno: integer;
      ano: integer;
      notaPrimeiroBimestre: double;
      notaSegundoBimestre: double;
      notaTerceiroBimestre: double;
      notaQuartoBimestre: double;
    end;

  private
    class procedure excluirAlunos(const id_professor: integer);
    class procedure excluirAluno(const id_aluno, id_professor: integer);
    class procedure excluirProfessor(const id: integer);

  public
    disciplina: string;
    alunosProfessor: TList<TAlunoProfessor>;

    procedure salvar; override;
    class procedure excluir(const id: integer;
      const tipoExclusao: TTipoExclusao; const id_aluno: integer = 0); overload;

    constructor create(ANome: string); override;
    destructor destroy; override;
  end;

implementation

uses
  System.SysUtils;

{ TProfessor }

constructor TProfessor.create(ANome: string);
begin
  inherited;

  alunosProfessor := TList<TAlunoProfessor>.Create;
end;

destructor TProfessor.destroy;
begin
  FreeAndNil(alunosProfessor);
  inherited;
end;

class procedure TProfessor.excluir(const id: integer;
  const tipoExclusao: TTipoExclusao; const id_aluno: integer = 0);
begin
  case tipoExclusao of
    teProfessor:
      excluirProfessor(id);
    teAluno:
      excluirAluno(id_aluno, id);
  end;
end;

class procedure TProfessor.excluirAluno(const id_aluno, id_professor: integer);
const
  query = 'delete from professor_aluno where id_professor = :professor and id_aluno = :aluno';
begin
  try
    dmConexaoBanco.queryGenerica.SQL.Clear;
    dmConexaoBanco.queryGenerica.SQL.Add(query);
    dmConexaoBanco.queryGenerica.ParamByName('PROFESSOR').AsInteger := id_professor;
    dmConexaoBanco.queryGenerica.ParamByName('ALUNO').AsInteger := id_aluno;
    dmConexaoBanco.queryGenerica.ExecSQL;
  except
    on e: exception do begin
      raise Exception.Create(e.Message);
    end;
  end;
end;

class procedure TProfessor.excluirAlunos(const id_professor: integer);
const
  query = 'delete from professor_aluno where id_professor = :professor';
begin
  try
    dmConexaoBanco.queryGenerica.SQL.Clear;
    dmConexaoBanco.queryGenerica.SQL.Add(query);
    dmConexaoBanco.queryGenerica.ParamByName('PROFESSOR').AsInteger := id_professor;
    dmConexaoBanco.queryGenerica.ExecSQL;
  except
    on e: exception do begin
      raise Exception.Create(e.Message);
    end;
  end;
end;

class procedure TProfessor.excluirProfessor(const id: integer);
const
  query = 'delete from professor where id = :professor';
begin
  try
    dmConexaoBanco.queryGenerica.SQL.Clear;
    dmConexaoBanco.queryGenerica.SQL.Add(query);
    dmConexaoBanco.queryGenerica.ParamByName('PROFESSOR').AsInteger := id;
    dmConexaoBanco.queryGenerica.ExecSQL;
  except
    on e: exception do begin
      raise Exception.Create(e.Message);
    end;
  end;
end;

procedure TProfessor.salvar;
  procedure inserirProfessor;
  const
    query = 'update or insert into professor(id, nome, cpf, sexo, data_nascimento, email, disciplina ) ' +
            '                         values(:id, :nome, :cpf, :sexo, :data_nascimento, :email, :disciplina ) ' +
            '                       matching(id)'  ;
  begin
    dmConexaoBanco.queryGenerica.SQL.Clear;
    dmConexaoBanco.queryGenerica.SQL.Add(query);
    dmConexaoBanco.queryGenerica.ParamByName('ID').AsInteger := self.id;
    dmConexaoBanco.queryGenerica.ParamByName('NOME').AsString := self.nome;
    dmConexaoBanco.queryGenerica.ParamByName('CPF').AsString := self.cpf;
    dmConexaoBanco.queryGenerica.ParamByName('SEXO').AsString := self.sexo;
    dmConexaoBanco.queryGenerica.ParamByName('DATA_NASCIMENTO').AsDate := self.data_nascimento;
    dmConexaoBanco.queryGenerica.ParamByName('EMAIL').AsString := self.email;
    dmConexaoBanco.queryGenerica.ParamByName('DISCIPLINA').AsString := self.disciplina;
    dmConexaoBanco.queryGenerica.ExecSQL;
  end;

  procedure inserirAluno;
  const
    query = 'insert into professor_aluno(id_professor, id_aluno, ano, nota_primeiro_bimestre, nota_segundo_bimestre, nota_terceiro_bimestre, nota_quarto_bimestre) ' +
            '                     values(:id_professor, :id_aluno, :ano, :nota_primeiro_bimestre, :nota_segundo_bimestre, :nota_terceiro_bimestre, :nota_quarto_bimestre)';
  var
    i: integer;
  begin

    for I := 0 to self.alunosProfessor.Count -1 do begin
      dmConexaoBanco.queryGenerica.SQL.Clear;
      dmConexaoBanco.queryGenerica.SQL.Add(query);
      dmConexaoBanco.queryGenerica.ParamByName('ID_PROFESSOR').AsInteger := self.id;
      dmConexaoBanco.queryGenerica.ParamByName('ID_ALUNO').AsInteger := self.alunosProfessor[i].id_aluno;
      dmConexaoBanco.queryGenerica.ParamByName('ANO').AsInteger := self.alunosProfessor[i].ano;
      dmConexaoBanco.queryGenerica.ParamByName('NOTA_PRIMEIRO_BIMESTRE').AsFloat := self.alunosProfessor[i].notaPrimeiroBimestre;
      dmConexaoBanco.queryGenerica.ParamByName('NOTA_SEGUNDO_BIMESTRE').AsFloat := self.alunosProfessor[i].notaSegundoBimestre;
      dmConexaoBanco.queryGenerica.ParamByName('NOTA_TERCEIRO_BIMESTRE').AsFloat := self.alunosProfessor[i].notaTerceiroBimestre;
      dmConexaoBanco.queryGenerica.ParamByName('NOTA_QUARTO_BIMESTRE').AsFloat := self.alunosProfessor[i].notaQuartoBimestre;
      dmConexaoBanco.queryGenerica.ExecSQL;
    end;

  end;
begin
  inherited;

  try
    excluirAlunos(self.id);
    inserirProfessor;

    if self.alunosProfessor = nil then begin
      Exit;
    end;

    inserirAluno;
  except
    on e: exception do begin
      raise Exception.Create(e.Message);
    end;
  end;
end;

end.
