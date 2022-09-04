program ProjetoEscola;

uses
  Vcl.Forms,
  uFormPrincipal in 'src\view\uFormPrincipal.pas' {formPrincipal},
  uPessoa in 'src\classe\uPessoa.pas',
  uExceptions in 'src\exception\uExceptions.pas',
  uAluno in 'src\classe\uAluno.pas',
  uUtils in 'src\classe\uUtils.pas',
  uProfessor in 'src\classe\uProfessor.pas',
  uConexaoBanco in 'src\dataModule\uConexaoBanco.pas' {dmConexaoBanco: TDataModule},
  formConsultaBase in 'src\view\formConsultaBase.pas' {frmConsultaBase},
  formBase in 'src\view\formBase.pas' {frmBase},
  formAluno in 'src\view\formAluno.pas' {frmAluno},
  DBase in 'src\dataModule\DBase.pas' {dmBase: TDataModule},
  DAluno in 'src\dataModule\DAluno.pas' {dmAluno: TDataModule},
  formProfessor in 'src\view\formProfessor.pas' {frmProfessor},
  DProfessor in 'src\dataModule\DProfessor.pas' {dmProfessor: TDataModule},
  formConsAluno in 'src\view\formConsAluno.pas' {frmConsAluno},
  formConsProfessor in 'src\view\formConsProfessor.pas' {frmConsProfessor},
  uCalculo in 'src\classe\uCalculo.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TformPrincipal, formPrincipal);
  Application.CreateForm(TdmConexaoBanco, dmConexaoBanco);
  Application.Run;
end.
