unit Model.Services.NFe.Component.ACBr;

interface

uses
  System.Classes,
  System.SysUtils;

type TModelServicesNFeComponentACBr = class(TComponent)
  private
    FEmitenteCNPJ: String;
    FDestinatarioCNPJ: String;
    FValorTotal: Double;
    FNumeroNota: String;
    FProtocolo: String;
    FChaveEletronica: string;
    procedure SetDestinatarioCNPJ(const Value: String);
    procedure SetEmitenteCNPJ(const Value: String);
    procedure SetNumeroNota(const Value: String);
    procedure SetValorTotal(const Value: Double);
    procedure SetChaveEletronica(const Value: String);
    procedure SetProtocolo(const Value: String);

    procedure EnviarSefaz;
  public
    property NumeroNota: String read FNumeroNota write SetNumeroNota;
    property EmitenteCNPJ: String read FEmitenteCNPJ write SetEmitenteCNPJ;
    property DestinatarioCNPJ: String read FDestinatarioCNPJ write SetDestinatarioCNPJ;
    property ValorTotal: Double read FValorTotal write SetValorTotal;

    property ChaveEletronica: String read FChaveEletronica write SetChaveEletronica;
    property Protocolo: String read FProtocolo write SetProtocolo;

    procedure Clear;
    procedure GerarNFe;
end;

implementation

{ TModelServicesNFeComponentACBr }

procedure TModelServicesNFeComponentACBr.Clear;
begin
  //
end;

procedure TModelServicesNFeComponentACBr.EnviarSefaz;
begin
  // Finge que aqui faz o envio pra sefaz e pega o protocolo do xml
//  raise Exception.CreateFmt('Não foi possível enviar pra sefaz.', []);
end;

procedure TModelServicesNFeComponentACBr.GerarNFe;
begin
  EnviarSefaz;
  Protocolo := Random(10000).ToString.PadLeft(20, '0');
  ChaveEletronica := Random(100000000).ToString.PadLeft(44, '0');
end;

procedure TModelServicesNFeComponentACBr.SetChaveEletronica(const Value: String);
begin
  FChaveEletronica := Value;
end;

procedure TModelServicesNFeComponentACBr.SetDestinatarioCNPJ(const Value: String);
begin
  FDestinatarioCNPJ := Value;
end;

procedure TModelServicesNFeComponentACBr.SetEmitenteCNPJ(const Value: String);
begin
  FEmitenteCNPJ := Value;
end;

procedure TModelServicesNFeComponentACBr.SetNumeroNota(const Value: String);
begin
  FNumeroNota := Value;
end;

procedure TModelServicesNFeComponentACBr.SetProtocolo(const Value: String);
begin
  FProtocolo := Value;
end;

procedure TModelServicesNFeComponentACBr.SetValorTotal(const Value: Double);
begin
  FValorTotal := Value;
end;

end.

