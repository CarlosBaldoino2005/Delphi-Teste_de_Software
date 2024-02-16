unit Model.Services.NFe.Command.Destinatario;

interface

uses
  Model.Services.NFe.Interfaces;

type TModelServicesNFeCommandDestinatario = class(TInterfacedObject, iModelServicesNFeCommand)

  private
    FParent: iModelServicesNFe;

  protected
    function Execute: iModelServicesNFeCommand;

  public
    constructor create(Parent: iModelServicesNFe);
    class function New(Parent: iModelServicesNFe): iModelServicesNFeCommand;
end;

implementation

{ TModelServicesNFeCommandDestinatario }

constructor TModelServicesNFeCommandDestinatario.create(Parent: iModelServicesNFe);
begin
  FParent := Parent;
end;

function TModelServicesNFeCommandDestinatario.Execute: iModelServicesNFeCommand;
begin
  result := Self;
  FParent.Component.DestinatarioCNPJ := FParent.DAO.This.CNPJDestinatario;
end;

class function TModelServicesNFeCommandDestinatario.New(Parent: iModelServicesNFe): iModelServicesNFeCommand;
begin
  result := Self.Create(Parent);
end;

end.
