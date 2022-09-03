unit uAluno;

interface

uses
  uPessoa, uConexaoBanco, uUtils;

type
  TAluno = class(TPessoa)
  public
    serie: integer;

    procedure salvar; override;
    class procedure excluir(const id: integer); override;
    constructor create(ANome: string); override;
    destructor destroy; override;
  end;

implementation

uses
  Data.DB, System.SysUtils, FireDAC.Stan.Param;

{ TAluno }

constructor TAluno.create(ANome: string);
begin
  inherited;
end;

destructor TAluno.destroy;
begin
  inherited;
end;

class procedure TAluno.excluir(const id: integer);
const
  query = 'delete from aluno where id = :id';
begin
  inherited;
  try
    dmConexaoBanco.queryGenerica.SQL.Clear;
    dmConexaoBanco.queryGenerica.SQL.Add(query);
    dmConexaoBanco.queryGenerica.ParamByName('ID').AsInteger := id;
    dmConexaoBanco.queryGenerica.ExecSQL;
  except
    on e: exception do begin
      raise Exception.Create(e.Message);
    end;
  end;
end;

procedure TAluno.salvar;
const
  query = 'update or insert into aluno(id, nome, cpf, sexo, data_nascimento, email, serie ) ' +
          '                     values(:id, :nome, :cpf, :sexo, :data_nascimento, :email, :serie ) ' +
          '                   matching(id)'  ;
begin
  inherited;
  try
    dmConexaoBanco.queryGenerica.SQL.Clear;

    dmConexaoBanco.queryGenerica.SQL.Add(query);

    dmConexaoBanco.queryGenerica.ParamByName('ID').AsInteger := self.id;
    dmConexaoBanco.queryGenerica.ParamByName('NOME').AsString := self.nome;
    dmConexaoBanco.queryGenerica.ParamByName('CPF').AsString := self.cpf;
    dmConexaoBanco.queryGenerica.ParamByName('SEXO').AsString := self.sexo;
    dmConexaoBanco.queryGenerica.ParamByName('DATA_NASCIMENTO').AsDate := self.data_nascimento;
    dmConexaoBanco.queryGenerica.ParamByName('EMAIL').AsString := self.email;
    dmConexaoBanco.queryGenerica.ParamByName('SERIE').AsInteger := self.serie;

    dmConexaoBanco.queryGenerica.ExecSQL;
  except
    on e: exception do begin
      raise Exception.Create(e.message);
    end;
  end;
end;

end.
