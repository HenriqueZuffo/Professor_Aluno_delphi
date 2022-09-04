unit uUtils;

interface

uses
  Data.DB;

function iif(const AExpressao: Boolean; const ATrue, AFalse: Variant): Variant;

type
  TMessageBoxOption = (moSim, moNao, moCancelar, moSimParaTodos, moNaoParaTodos);
  TMessageBoxIcone = (miErro, miPergunta, miAtencao, miInformacao);


  TMessageBox = class
    public
    class procedure informar(const AMensagem: string; const AIcone: TMessageBoxIcone = miAtencao);
    class function confirmar(const AMensagem: string; AFocus: TMessageBoxOption; AIcone : TMessageBoxIcone): TMessageBoxOption;
  end;

implementation

uses
  Winapi.Windows, Vcl.Forms, System.UITypes;
function iif(const AExpressao: Boolean; const ATrue, AFalse: Variant): Variant;
begin
  if AExpressao then
    Result := ATrue
  else
    Result := AFalse;
end;
{ TMessageBox }

class function TMessageBox.confirmar(const AMensagem: string; AFocus: TMessageBoxOption; AIcone : TMessageBoxIcone): TMessageBoxOption;
var
  foco, icone: Integer;
begin
  case AFocus of
    moSim: foco := MB_DEFBUTTON1;
    moNao: foco := MB_DEFBUTTON2;
  end;

  case AIcone of
    miErro : icone := MB_ICONERROR;
    miPergunta : icone := MB_ICONQUESTION;
    miAtencao : icone := MB_ICONWARNING;
    miInformacao : icone := MB_ICONINFORMATION;
  end;

  case Application.MessageBox(PChar(AMensagem), 'Confirmação', MB_YESNO + icone + foco) of
    mrYes:
      Exit(moSim);
    mrNo:
      Exit(moNao);
  end;
end;

class procedure TMessageBox.informar(const AMensagem: string; const AIcone: TMessageBoxIcone = miAtencao);
var
  icone: integer;
begin
  case AIcone of
    miErro : icone := MB_ICONERROR;
    miPergunta : icone := MB_ICONQUESTION;
    miAtencao : icone := MB_ICONWARNING;
    miInformacao : icone := MB_ICONINFORMATION;
  end;

  Application.MessageBox(PChar(AMensagem), 'Atenção', MB_OK + icone);
end;

end.
