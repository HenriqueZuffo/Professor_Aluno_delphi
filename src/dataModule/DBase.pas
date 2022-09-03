unit DBase;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, uConexaoBanco;

type
  TdmBase = class(TDataModule)
    queryCadastro: TFDQuery;
    dsCadastro: TDataSource;
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
  public
    procedure Salvar; virtual; abstract;
    procedure excluir(const id: integer); virtual; abstract;
    { Public declarations }
  end;

var
  dmBase: TdmBase;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

procedure TdmBase.DataModuleCreate(Sender: TObject);
begin
  queryCadastro.Close;
  queryCadastro.Open;
  queryCadastro.Insert;
end;

end.
