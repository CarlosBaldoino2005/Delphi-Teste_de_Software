unit Model.Interfaces;

interface

uses
  Model.DAO.Interfaces,
  Model.Components.Interfaces,
  Model.Services.Interfaces;

type
  IModel = interface
    ['{9F4CE1BE-C27A-4DAC-8409-3A7BCC0A9EEE}']
    function DAO: IModelDAOFactory;
    function Components: iModelComponents;
    function Services: iModelServicesFactory;
  end;

implementation

end.
