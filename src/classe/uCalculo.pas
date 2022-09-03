unit uCalculo;

interface

type
  TCalculoBase = class abstract(TObject)

  public
    function calcular(const ANotas: TArray<Double>): double; virtual; abstract;
  end;

  TCalculoMedia = class(TCalculoBase)
  public
    function calcular(const ANotas: TArray<Double>): double; override;
  end;

  TCalculoMaior = class(TCalculoBase)
  public
    function calcular(const ANotas: TArray<Double>): double; override;
  end;

  TCalculoMenor = class(TCalculoBase)
  public
    function calcular(const ANotas: TArray<Double>): double; override;
  end;

implementation

{ TCalcula }

{ TCalculoMenor }


{ TCalculoMedia }

function TCalculoMedia.calcular(const ANotas: TArray<Double>): double;
var
  i: integer;
  TotalNotas: double;
begin
  TotalNotas := 0;

  for i := 0 to Length(ANotas)-1 do begin
    TotalNotas := TotalNotas + Anotas[i];
  end;

  Result := TotalNotas / Length(ANotas);
end;

{ TCalculoMaior }

function TCalculoMaior.calcular(const ANotas: TArray<Double>): double;
var
  i: integer;
begin
  Result := 0;
  for I := 0 to Length(ANotas) do begin
    if ANotas[i] > Result then
      Result := ANotas[i];
  end;
end;

{ TCalculoMenor }

function TCalculoMenor.calcular(const ANotas: TArray<Double>): double;
var
  i: integer;
  vOldNota: double;
begin
  Result := 0;
  vOldNota := 0;

  for I := 0 to Length(ANotas) do begin
    if ((vOldNota <> 0) and (vOldNota < ANotas[i]))then
      Result := ANotas[i];

    vOldNota := ANotas[i];
  end;

  if vOldNota < Result then
    Result := vOldNota;
end;

end.
