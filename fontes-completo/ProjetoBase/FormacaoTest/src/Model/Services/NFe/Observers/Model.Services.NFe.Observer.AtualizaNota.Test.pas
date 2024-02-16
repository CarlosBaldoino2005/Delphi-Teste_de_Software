unit Model.Services.NFe.Observer.AtualizaNota.Test;

interface

uses
  DUnitX.TestFramework,
  Model,
  Model.Services.Factory,
  Model.Services.NFe.Interfaces,
  Model.Services.NFe.Observer.AtualizarNota;

type
  [TestFixture]
  TModelServicesNFeObserverAtualizaNotaTest = class

  private
    FNFe: iModelServicesNFe;
    FObserver: iModelServicesNFeObserver;

  public
    [Setup]
    procedure Setup;

    [Test]
    procedure TestObserver;
  end;

implementation

{ TModelServicesNFeObserverAtualizaNotaTest }

procedure TModelServicesNFeObserverAtualizaNotaTest.Setup;
begin
  FNFe := TModel.New.Services.NFe;
  FObserver := TModelServicesNFeObserverAtualizarNota.New(FNFe);
end;

procedure TModelServicesNFeObserverAtualizaNotaTest.TestObserver;
var
  chaveNFe: string;
  protocolo: string;
begin
  FNFe.NumeroNota('1');
  chaveNFe := FNFe.DAO.This.ChaveEletronica;
  protocolo := FNFe.DAO.This.Protocolo;

  FObserver.Update('1111', '2222');

  Assert.AreEqual('1111', FNFe.DAO.This.ChaveEletronica);
  Assert.AreEqual('2222', FNFe.DAO.This.Protocolo);

  FObserver.Update(chaveNFe, protocolo);
end;

end.
