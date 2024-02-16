unit uACBr;

interface

uses
  System.Classes,
  System.SysUtils;

type TACBr = class

  private
    FDestinatarioCNPJ: String;
    FProtocolo: String;
    FChaveEletronica: String;
    FValorTotal: Double;
    FEmitenteCNPJ: String;
    FNumeroNota: String;

    procedure EnviarSefaz;
    procedure SetChaveEletronica(const Value: String);
    procedure SetDestinatarioCNPJ(const Value: String);
    procedure SetEmitenteCNPJ(const Value: String);
    procedure SetNumeroNota(const Value: String);
    procedure SetProtocolo(const Value: String);
    procedure SetValorTotal(const Value: Double);
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

{ TACBr }

procedure TACBr.Clear;
begin

end;

procedure TACBr.EnviarSefaz;
begin
  // Lógica Complexa para Emissão junto a Sefaz
end;

procedure TACBr.GerarNFe;
begin
  EnviarSefaz;

  FChaveEletronica := '00012345';
  FProtocolo := '0001';
end;

procedure TACBr.SetChaveEletronica(const Value: String);
begin
  FChaveEletronica := Value;
end;

procedure TACBr.SetDestinatarioCNPJ(const Value: String);
begin
  FDestinatarioCNPJ := Value;
end;

procedure TACBr.SetEmitenteCNPJ(const Value: String);
begin
  FEmitenteCNPJ := Value;
end;

procedure TACBr.SetNumeroNota(const Value: String);
begin
  FNumeroNota := Value;
end;

procedure TACBr.SetProtocolo(const Value: String);
begin
  FProtocolo := Value;
end;

procedure TACBr.SetValorTotal(const Value: Double);
begin
  FValorTotal := Value;
end;

end.
