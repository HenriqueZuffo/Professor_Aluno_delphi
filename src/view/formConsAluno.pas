unit formConsAluno;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, formConsultaBase, Data.DB,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  Vcl.StdCtrls, Vcl.Grids, Vcl.DBGrids, Vcl.ExtCtrls;

type
  TfrmConsAluno = class(TfrmConsultaBase)
    procedure edt_descChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmConsAluno: TfrmConsAluno;

implementation

{$R *.dfm}

procedure TfrmConsAluno.edt_descChange(Sender: TObject);
const
  query = 'select id, ' +
          '       nome,'+
          '       data_nascimento, ' +
          '       serie ' +
          '  from aluno ';
  where = 'where upper(nome) like ''%%s%'' ';
begin
  inherited;
  queryConsulta.SQL.Clear;
  if edt_desc.Text = '' then begin
    queryConsulta.SQL.Add(query);
  end else begin
    queryConsulta.SQL.Add(query + slineBreak + 'where upper(nome) like ''%' + UpperCase(edt_desc.Text) + '%'' ');
  end;
  queryConsulta.open;
end;

end.
