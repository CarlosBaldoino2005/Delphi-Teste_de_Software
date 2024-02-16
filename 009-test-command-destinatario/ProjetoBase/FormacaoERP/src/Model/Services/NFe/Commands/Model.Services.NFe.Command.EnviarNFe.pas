unit Model.Services.NFe.Command.EnviarNFe;

interface

uses
  Model.Services.NFe.Interfaces;

type TModelServicesNFeCommandEnviarNFe = class(TInterfacedObject, iModelServicesNFeCommand)

  private
    FParent: iModelServicesNFe;

  protected
    function Execute: iModelServicesNFeCommand;

  public
    constructor create(Parent: iModelServicesNFe);
    class function New(Parent: iModelServicesNFe): iModelServicesNFeCommand;
end;

implementation

{ TModelServicesNFeCommandEnviarNFe }

constructor TModelServicesNFeCommandEnviarNFe.create(Parent: iModelServicesNFe);
begin
  FParent := Parent;
end;

function TModelServicesNFeCommandEnviarNFe.Execute: iModelServicesNFeCommand;
begin
  result := Self;
  FParent.Component.GerarNFe;
end;

class function TModelServicesNFeCommandEnviarNFe.New(Parent: iModelServicesNFe): iModelServicesNFeCommand;
begin
  result := Self.Create(Parent);
end;

end.
