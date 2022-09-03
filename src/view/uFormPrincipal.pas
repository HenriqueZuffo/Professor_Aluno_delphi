unit uFormPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus, Vcl.ExtCtrls, formAluno, DAluno, formProfessor, DProfessor;

type
  TformPrincipal = class(TForm)
    MainMenu1: TMainMenu;
    Aluno1: TMenuItem;
    Professor1: TMenuItem;
    procedure Aluno1Click(Sender: TObject);
    procedure Professor1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  formPrincipal: TformPrincipal;

implementation

{$R *.dfm}

procedure TformPrincipal.Aluno1Click(Sender: TObject);
begin
  if frmAluno = nil then begin
    dmAluno := TDmAluno.Create(Self);
    frmAluno := TFrmAluno.create(Self);
    frmAluno.dm := dmAluno;
  end;
  frmAluno.Show;
end;

procedure TformPrincipal.Professor1Click(Sender: TObject);
begin
  if frmProfessor = nil then begin
    dmProfessor := TDmProfessor.Create(Self);
    frmProfessor := TFrmProfessor.Create(Self);
    frmProfessor.dm := dmProfessor;
  end;
  frmProfessor.show;
end;

end.
