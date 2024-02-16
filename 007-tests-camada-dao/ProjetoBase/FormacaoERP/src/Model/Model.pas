unit Model;

interface

uses
  Model.Interfaces,
  Model.DAO.Interfaces,
  Model.DAO.Factory,
  Model.Components.Interfaces,
  Model.Components.Factory,
  Model.Services.Interfaces,
  Model.Services.Factory;

type TModel = class(TInterfacedObject, IModel)

  private
    FDAO: IModelDAOFactory;
    FComponents: iModelComponents;
    FServices: iModelServicesFactory;

  protected
    function DAO: IModelDAOFactory;
    function Components: iModelComponents;
    function Services: iModelServicesFactory;

  public
    class function New: IModel;
end;

implementation

{ TModel }

function TModel.Components: iModelComponents;
begin
  if not Assigned(FComponents) then
    FComponents := TModelComponents.New;
  result := FComponents;
end;

function TModel.DAO: IModelDAOFactory;
begin
  if not Assigned(FDAO) then
    FDAO := TModelDAOFactory.New(Components.Connections);
  result := FDAO;
end;

class function TModel.New: IModel;
begin
  result := Self.Create;
end;

function TModel.Services: iModelServicesFactory;
begin
  if not Assigned(FServices) then
  begin
    FServices := TModelServicesFactory.New;
    FServices.NFe.DAO(DAO.NotaFiscalDAO);
  end;
  result := FServices;
end;

end.
