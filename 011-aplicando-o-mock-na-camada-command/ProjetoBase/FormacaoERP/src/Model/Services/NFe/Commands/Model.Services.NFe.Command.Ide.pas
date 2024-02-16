unit Model.Services.NFe.Command.Ide;

interface

uses
  Model.Services.NFe.Interfaces;

type TModelServicesNFeCommandIde = class(TInterfacedObject, iModelServicesNFeCommand)

  private
    FParent: iModelServicesNFe;

  protected
    function Execute: iModelServicesNFeCommand;

  public
    constructor create(Parent: iModelServicesNFe);
    class function New(Parent: iModelServicesNFe): iModelServicesNFeCommand;
end;

implementation

{ TModelServicesNFeCommandIde }

constructor TModelServicesNFeCommandIde.create(Parent: iModelServicesNFe);
begin
  FParent := Parent;
end;

function TModelServicesNFeCommandIde.Execute: iModelServicesNFeCommand;
begin
  result := Self;
  FParent.Component.NumeroNota := FParent.DAO.This.Numero;
  FParent.Component.ValorTotal := FParent.DAO.This.ValorTotal;
end;

class function TModelServicesNFeCommandIde.New(Parent: iModelServicesNFe): iModelServicesNFeCommand;
begin
  result := Self.Create(Parent);
end;

end.
