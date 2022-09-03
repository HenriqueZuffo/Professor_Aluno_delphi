unit DProfessor;

interface

uses
  System.SysUtils, System.Classes, DBase, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client, uConexaoBanco;

type
  TdmProfessor = class(TdmBase)
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dmProfessor: TdmProfessor;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

end.
