unit DAluno;

interface

uses
  System.SysUtils, System.Classes, DBase, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client, uConexaoBanco, uAluno, uUtils;

type
  TdmAluno = class(TdmBase)
    queryCadastroID: TIntegerField;
    queryCadastroNOME: TStringField;
    queryCadastroCPF: TStringField;
    queryCadastroDATA_NASCIMENTO: TDateField;
    queryCadastroEMAIL: TStringField;
    queryCadastroSERIE: TIntegerField;
    queryCadastroSEXO: TStringField;
  private
    { Private declarations }
  public
    procedure Salvar;override;
    procedure excluir(const id: integer); override;
    { Public declarations }
  end;

var
  dmAluno: TdmAluno;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

{ TdmAluno }

procedure TdmAluno.excluir(const id: integer);
begin
  inherited;
  try
    dmConexaoBanco.base.StartTransaction;
    TAluno.excluir(id);
    dmConexaoBanco.base.Commit;
  except
    on e: exception do begin
      dmConexaoBanco.base.Rollback;
      raise Exception.Create(e.Message);
    end;
  end;
end;

procedure TdmAluno.Salvar;
var
  Aluno: TAluno;
begin
  inherited;
  try
    dmConexaoBanco.base.StartTransaction;

    Aluno := TAluno.create(queryCadastroNOME.AsString);
    Aluno.serie := queryCadastroSERIE.AsInteger;
    Aluno.id := queryCadastroID.AsInteger;
    Aluno.cpf := queryCadastroCPF.AsString;
    Aluno.sexo := queryCadastroSEXO.AsString;
    Aluno.email := queryCadastroEMAIL.AsString;
    Aluno.data_nascimento := queryCadastroDATA_NASCIMENTO.AsDateTime;

    try
      Aluno.salvar;
      dmConexaoBanco.base.Commit;
    except
      on e: exception do begin
        dmConexaoBanco.base.Rollback;
        raise Exception.Create(e.Message);
      end;
    end;
  finally
    FreeAndNil(Aluno);
  end;
end;

end.
