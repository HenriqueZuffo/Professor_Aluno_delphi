unit uPessoa;

interface

type
  TPessoa = class abstract (TObject)
    public
      id: integer;
      nome: string;
      cpf: string;
      sexo: string;
      data_nascimento: TDate;
      email: string;


      procedure salvar; virtual; abstract;
      class procedure excluir(const id: integer); virtual; abstract;

      constructor create(ANome: string);virtual;
      destructor destroy;override;
  end;

implementation

uses SysUtils, uExceptions;

{ TPessoa }

constructor TPessoa.create(ANome: string);
begin
  Self.nome := ANome;
  if Self.nome.IsEmpty then begin
    raise ENomeObrigatorio.Create('Nome é obrigatório e não foi preenchido');
  end;
end;

destructor TPessoa.destroy;
begin
  inherited;
end;

end.
