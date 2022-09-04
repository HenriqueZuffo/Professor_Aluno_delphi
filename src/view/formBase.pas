unit formBase;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, DBase, uUtils;

type
  TfrmBase = class(TForm)
    pnTop: TPanel;
    pnCorpoTela: TPanel;
    btnConfirmar: TButton;
    btSair: TButton;
    btnExcluir: TButton;
    btnNovo: TButton;
    procedure btSairClick(Sender: TObject);
    procedure btnConfirmarClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnNovoClick(Sender: TObject);
  private
    FDm: TDmBase;
    { Private declarations }
  public
    property dm: TDmBase read FDm write FDm;

    destructor destroy;override;
    { Public declarations }
  end;

var
  frmBase: TfrmBase;

implementation

{$R *.dfm}

procedure TfrmBase.btnConfirmarClick(Sender: TObject);
begin
  if TMessageBox.confirmar('Deseja salvar este registro?', moNao, miPergunta) = moNao then Exit;

  try
    self.dm.Salvar;
  except
    on e: exception do begin
      TMessageBox.informar('Ocorreu um erro ao tentar salvar o registro: ' + slineBreak + e.Message);
      abort;
    end;
  end;

  TMessageBox.informar('Registro salvo com sucesso', miInformacao);
  self.dm.queryCadastro.Close;
  self.dm.queryCadastro.ParamByName('ID').Clear;
  self.dm.queryCadastro.Open;
end;

procedure TfrmBase.btnExcluirClick(Sender: TObject);
begin
  if TMessageBox.confirmar('Deseja excluir este registro?', moNao, miPergunta) = moNao then Exit;

  try
    self.dm.excluir(self.dm.queryCadastro.FieldByName('ID').AsInteger);
  except
    on e: exception do begin
      TMessageBox.informar('Ocorreu um erro ao tentar excluir o registro: ' + slineBreak + e.Message);
      abort;
    end;
  end;

  TMessageBox.informar('Registro excluido com sucesso', miInformacao);
  self.dm.queryCadastro.Close;
  self.dm.queryCadastro.ParamByName('ID').Clear;
  self.dm.queryCadastro.Open;
end;

procedure TfrmBase.btnNovoClick(Sender: TObject);
begin
  self.dm.queryCadastro.Close;
  self.dm.queryCadastro.ParamByName('ID').Clear;
  self.dm.queryCadastro.Open;
end;

procedure TfrmBase.btSairClick(Sender: TObject);
begin
  Self.Close;
end;

destructor TfrmBase.destroy;
begin
  FreeAndNil(self.dm);
  inherited;
end;

procedure TfrmBase.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := CaFree;
  Release;
end;

end.
