unit Model.Entities.NotaFiscal;

interface

type TModelEntitiesNotaFiscal = class

  private
    FId: string;
    FNumero: string;
    FChaveEletronica: string;
    FProtocolo: string;
    FValorTotal: Double;
    FCNPJEmitente: string;
    FCNPJDestinatario: String;

  public
    function Id(Value: String): TModelEntitiesNotaFiscal; overload;
    function Numero(Value: String): TModelEntitiesNotaFiscal; overload;
    function ChaveEletronica(Value: String): TModelEntitiesNotaFiscal; overload;
    function Protocolo(Value: String): TModelEntitiesNotaFiscal; overload;
    function CNPJEmitente(Value: String): TModelEntitiesNotaFiscal; overload;
    function CNPJDestinatario(Value: String): TModelEntitiesNotaFiscal; overload;
    function ValorTotal(Value: Double): TModelEntitiesNotaFiscal; overload;

    function Id: String; overload;
    function Numero: String; overload;
    function ChaveEletronica: String; overload;
    function Protocolo: String; overload;
    function CNPJEmitente: String; overload;
    function CNPJDestinatario: String; overload;
    function ValorTotal: Double; overload;

end;

implementation

{ TModelEntitiesNotaFiscal }

function TModelEntitiesNotaFiscal.ChaveEletronica(Value: String): TModelEntitiesNotaFiscal;
begin
  Result := Self;
  FChaveEletronica := Value;
end;

function TModelEntitiesNotaFiscal.CNPJDestinatario(Value: String): TModelEntitiesNotaFiscal;
begin
  Result := Self;
  FCNPJDestinatario := Value;
end;

function TModelEntitiesNotaFiscal.CNPJEmitente(Value: String): TModelEntitiesNotaFiscal;
begin
  Result := Self;
  FCNPJEmitente := Value;
end;

function TModelEntitiesNotaFiscal.Id(Value: String): TModelEntitiesNotaFiscal;
begin
  Result := Self;
  FId := Value;
end;

function TModelEntitiesNotaFiscal.Numero(Value: String): TModelEntitiesNotaFiscal;
begin
  Result := Self;
  FNumero := Value;
end;

function TModelEntitiesNotaFiscal.ValorTotal(Value: Double): TModelEntitiesNotaFiscal;
begin
  Result := Self;
  FValorTotal := Value;
end;

function TModelEntitiesNotaFiscal.ChaveEletronica: String;
begin
  result := FChaveEletronica;
end;

function TModelEntitiesNotaFiscal.CNPJDestinatario: String;
begin
  result := FCNPJDestinatario;
end;

function TModelEntitiesNotaFiscal.CNPJEmitente: String;
begin
  result := FCNPJEmitente;
end;

function TModelEntitiesNotaFiscal.Protocolo: String;
begin
  result := FProtocolo;
end;

function TModelEntitiesNotaFiscal.Id: String;
begin
  result := FId;
end;

function TModelEntitiesNotaFiscal.Numero: String;
begin
  result := FNumero;
end;

function TModelEntitiesNotaFiscal.Protocolo(Value: String): TModelEntitiesNotaFiscal;
begin
  result := Self;
  FProtocolo := Value;
end;

function TModelEntitiesNotaFiscal.ValorTotal: Double;
begin
  result := FValorTotal;
end;

end.
