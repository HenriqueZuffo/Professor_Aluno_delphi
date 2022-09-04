unit formConsAluno;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, formConsultaBase, Data.DB,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  Vcl.StdCtrls, Vcl.Grids, Vcl.DBGrids, Vcl.ExtCtrls, uUtils;

type
  TfrmConsAluno = class(TfrmConsultaBase)
    procedure edt_descChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    FIdProfessor: integer;
    { Private declarations }
  public
    property idProfessor: integer read FIdProfessor write FIdProfessor;
    { Public declarations }
  end;

var
  frmConsAluno: TfrmConsAluno;

const
  query = 'select a.id, ' +
          '       a.nome,'+
          '       a.data_nascimento, ' +
          '       a.serie ' +
          '  from aluno a';
  whereProfessor = 'where not(exists(select first 1 1 from professor_aluno where id_professor = :id_professor and id_aluno = a.id))';
implementation

{$R *.dfm}

procedure TfrmConsAluno.edt_descChange(Sender: TObject);
var
  wherePerso: string;
begin
  inherited;
  queryConsulta.SQL.Clear;
  wherePerso := '';
  if idProfessor > 0 then begin
    wherePerso := whereProfessor;
  end;

  if edt_desc.Text = '' then begin
    queryConsulta.SQL.Add(query + sLineBreak + wherePerso);
  end else begin
    wherePerso := wherePerso + iif(wherePerso = '', 'where ', ' and ') + ' upper(a.nome) like ''%' + UpperCase(edt_desc.Text) + '%'' ';
    queryConsulta.SQL.Add(query + slineBreak + wherePerso);
  end;
  queryConsulta.open;
end;

procedure TfrmConsAluno.FormShow(Sender: TObject);
begin
  inherited;
  if idProfessor > 0 then begin
    queryConsulta.SQL.clear;
    queryConsulta.SQL.Add(query + sLineBreak + whereProfessor);
    queryConsulta.ParamByName('ID_PROFESSOR').AsInteger := idProfessor;
    queryConsulta.open;
  end;
end;

end.
