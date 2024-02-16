unit Model.Services.Interfaces;

interface

uses
  Model.Services.NFe.Interfaces,
  Model.Services.NFe;

type
  iModelServicesFactory = interface
    ['{93EBAEA4-1932-4D8B-8236-A418998170E4}']
    function NFe: iModelServicesNFe;
  end;

implementation

end.
