unit Model.Components.Connections.Factory;

interface

uses
  Model.Components.Connections.Interfaces,
  Model.Components.Connections.Firedac;

type TModelComponentsConnectionsFactory = class(TInterfacedObject, iModelComponentsConnectionsFactory)

  private
    FConnection: iModelComponentsConnections;

  protected
    function Connections: iModelComponentsConnections;

  public
    class function New: iModelComponentsConnectionsFactory;

end;

implementation

{ TModelComponentsConnectionsFactory }

function TModelComponentsConnectionsFactory.Connections: iModelComponentsConnections;
begin
  if not Assigned(FConnection) then
    FConnection := TModelComponentsConnectionsFiredac.New;
  result := FConnection;
end;

class function TModelComponentsConnectionsFactory.New: iModelComponentsConnectionsFactory;
begin
  Result := Self.Create;
end;

end.
