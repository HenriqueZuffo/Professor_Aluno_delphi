unit formAluno;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, formBase, Vcl.StdCtrls, Vcl.DBCtrls,
  Vcl.Buttons, Vcl.Mask, Vcl.ExtCtrls, DAluno, formConsAluno;

type
  TfrmAluno = class(TfrmBase)
    lbl_edtdb_id: TLabel;
    edtdb_id: TDBEdit;
    btnConsultaAluno: TSpeedButton;
    edtdb_nome: TDBEdit;
    lbl_edtdb_nome: TLabel;
    lbl_edtdb_cpf: TLabel;
    edtdb_cpf: TDBEdit;
    lbl_edtdb_email: TLabel;
    edtdb_email: TDBEdit;
    edtdb_dtNascimento: TDBEdit;
    lbl_edtdb_dtNascimento: TLabel;
    lbl_cmbdb_sexo: TLabel;
    lbl_edtdb_serie: TLabel;
    edtdb_serie: TDBEdit;
    edtdb_sexo: TDBEdit;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnConsultaAlunoClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmAluno: TfrmAluno;

implementation

{$R *.dfm}

procedure TfrmAluno.btnConsultaAlunoClick(Sender: TObject);
var
  formConsAluno: TfrmConsAluno;
begin
  inherited;

  try
    formConsAluno := TfrmConsAluno.Create(Self);
    formConsAluno.FormStyle := fsNormal;
    formConsAluno.Visible := False;
    formConsAluno.ShowModal;

    if formConsAluno.ValueReturn > 0 then begin
      self.dm.queryCadastro.Close;
      self.dm.queryCadastro.ParamByName('ID').AsInteger := formConsAluno.ValueReturn;
      self.dm.queryCadastro.Open;

      btnExcluir.Enabled := true;
    end;
  finally
    FreeAndNil(formConsAluno);
  end;
end;

procedure TfrmAluno.btnExcluirClick(Sender: TObject);
begin
  inherited;
  btnExcluir.Enabled := self.dm.queryCadastro.FieldByName('ID').AsInteger > 0;
end;

procedure TfrmAluno.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  frmAluno := nil;
  dmAluno := nil;
end;

end.
