unit uProfessor;

interface

uses
  uPessoa;

type
  TProfessor = class(TPessoa)
    type
      TAlunoProfessor = class
        id_aluno: integer;
        ano: integer;
        notaPrimeiroBimestre: double;
        notaSegundoBimestre: double;
        notaTerceiroBimestre: double;
        notaQuartoBimestre: double;
      end;


  public
    disciplina: string;
    alunosProfessor: TArray<TAlunoProfessor>;

    procedure salvar; override;

    constructor create(ANome: string); override;
    destructor destroy; override;
  end;

implementation

{ TProfessor }

constructor TProfessor.create(ANome: string);
begin
  inherited;
  //
end;

destructor TProfessor.destroy;
begin
  inherited;
end;

procedure TProfessor.salvar;
begin
  inherited;
end;

end.
