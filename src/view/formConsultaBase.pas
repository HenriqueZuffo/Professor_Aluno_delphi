unit formConsultaBase;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client, uConexaoBanco, Vcl.Grids,
  Vcl.DBGrids, Vcl.ExtCtrls;

type
  TfrmConsultaBase = class(TForm)
    pnTop: TPanel;
    lbl_descricao: TLabel;
    edt_desc: TEdit;
    DataSource1: TDataSource;
    queryConsulta: TFDQuery;
    pnGrid: TPanel;
    pnRodaPe: TPanel;
    dbGridConsulta: TDBGrid;
    btnImportar: TButton;
    procedure btnImportarClick(Sender: TObject);
    procedure dbGridConsultaDblClick(Sender: TObject);
    procedure dbGridConsultaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormShow(Sender: TObject);
  private
    FValueReturn: Variant;
    procedure retornaValor;
    { Private declarations }
  public
    property ValueReturn: Variant read FValueReturn write FValueReturn;
    { Public declarations }
  end;

var
  frmConsultaBase: TfrmConsultaBase;

implementation

{$R *.dfm}

procedure TfrmConsultaBase.btnImportarClick(Sender: TObject);
begin
  retornaValor;
end;

procedure TfrmConsultaBase.dbGridConsultaDblClick(Sender: TObject);
begin
  retornaValor;
end;

procedure TfrmConsultaBase.dbGridConsultaKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = VK_RETURN then retornaValor;
end;

procedure TfrmConsultaBase.FormShow(Sender: TObject);
begin
  queryConsulta.Close;
  queryConsulta.Open;
end;

procedure TfrmConsultaBase.retornaValor;
begin
  ValueReturn := queryConsulta.FieldByName('ID').Value;
  Self.Close;
end;

end.
