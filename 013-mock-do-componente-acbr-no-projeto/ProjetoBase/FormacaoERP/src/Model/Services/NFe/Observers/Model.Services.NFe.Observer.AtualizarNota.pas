unit Model.Services.NFe.Observer.AtualizarNota;

interface

uses
  Model.Services.NFe.Interfaces,
  System.SysUtils;

type TModelServicesNFeObserverAtualizarNota = class(TInterfacedObject, iModelServicesNFeObserver)

  private
    [Weak]
    FParent: iModelServicesNFe;

  protected
    procedure Update(ChaveEletronica, Protocolo: String);

  public
    constructor create(Parent: iModelServicesNFe);
    class function New(Parent: iModelServicesNFe): iModelServicesNFeObserver;

end;

implementation

{ TModelServicesNFeObserverAtualizarNota }

constructor TModelServicesNFeObserverAtualizarNota.create(Parent: iModelServicesNFe);
begin
  FParent := Parent;
end;

class function TModelServicesNFeObserverAtualizarNota.New(Parent: iModelServicesNFe): iModelServicesNFeObserver;
begin
  result := Self.create(Parent);
end;

procedure TModelServicesNFeObserverAtualizarNota.Update(ChaveEletronica, Protocolo: String);
begin
  FParent.DAO.This
    .ChaveEletronica(ChaveEletronica)
    .Protocolo(Protocolo);

  FParent.DAO.Update;
end;

end.
