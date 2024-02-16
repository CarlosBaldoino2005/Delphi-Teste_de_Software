unit Model.Components.Factory;

interface

uses
  Model.Components.Interfaces,
  Model.Components.Connections.Interfaces,
  Model.Components.Connections.Factory;

type TModelComponents = class(TInterfacedObject, iModelComponents)

  private
    FConnections: iModelComponentsConnectionsFactory;

  protected
    function Connections: iModelComponentsConnections;

  public
    class function New: iModelComponents;

end;

implementation

{ TModelComponents }

function TModelComponents.Connections: iModelComponentsConnections;
begin
  if not Assigned(FConnections) then
    FConnections := TModelComponentsConnectionsFactory.New;
  result := FConnections.Connections;
end;

class function TModelComponents.New: iModelComponents;
begin
  result := Self.Create;
end;

end.
