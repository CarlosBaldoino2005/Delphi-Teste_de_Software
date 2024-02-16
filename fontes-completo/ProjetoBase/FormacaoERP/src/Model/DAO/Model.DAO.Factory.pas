unit Model.DAO.Factory;

interface

uses
  Model.Components.Connections.Interfaces,
  Model.DAO.Interfaces,
  Model.DAO.NotaFiscal,
  Model.Entities.NotaFiscal;

type TModelDAOFactory = class(TInterfacedObject, IModelDAOFactory)

  private
    FConnection: iModelComponentsConnections;
    FNotaFiscalDAO: iModelDAOEntity<TModelEntitiesNotaFiscal>;

  protected
    function NotaFiscalDAO: iModelDAOEntity<TModelEntitiesNotaFiscal>;

  public
    constructor create(Connection: iModelComponentsConnections);
    class function New(Connection: iModelComponentsConnections): IModelDAOFactory;
end;

implementation

{ TModelDAOFactory }

constructor TModelDAOFactory.create(Connection: iModelComponentsConnections);
begin
  FConnection := Connection;
end;

class function TModelDAOFactory.New(Connection: iModelComponentsConnections): IModelDAOFactory;
begin
  result := Self.create(Connection);
end;

function TModelDAOFactory.NotaFiscalDAO: iModelDAOEntity<TModelEntitiesNotaFiscal>;
begin
  if not Assigned(FNotaFiscalDAO) then
    FNotaFiscalDAO := TModelDAONotaFiscal.New(FConnection);
  result := FNotaFiscalDAO;
end;

end.
