unit Model.Services.Factory;

interface

uses
  System.SysUtils,
  Model.Services.Interfaces,
  Model.Services.NFe.Observer.AtualizarNota,
  Model.Services.NFe.Interfaces,
  Model.Services.NFe;

type TModelServicesFactory = class(TInterfacedObject, iModelServicesFactory)

  private
    FNFe: iModelServicesNFe;

  protected
    function NFe: iModelServicesNFe;

  public
    class function New: iModelServicesFactory;
end;

implementation

{ TModelServicesFactory }

class function TModelServicesFactory.New: iModelServicesFactory;
begin
  result := Self.Create;
end;

function TModelServicesFactory.NFe: iModelServicesNFe;
var
  iNFeSubject: iModelServicesNFeSubject;
begin
  if not Assigned(FNFe) then
  begin
    FNFe := TModelServicesNFe.New;
    if Supports(FNFe, iModelServicesNFeSubject, iNFeSubject) then
      iNFeSubject.AddObserver(TModelServicesNFeObserverAtualizarNota.New(FNFe));
  end;
  result := FNFe;
end;

end.
