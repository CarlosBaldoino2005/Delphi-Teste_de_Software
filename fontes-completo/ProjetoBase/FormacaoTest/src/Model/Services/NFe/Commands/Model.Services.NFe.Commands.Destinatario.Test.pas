unit Model.Services.NFe.Commands.Destinatario.Test;

interface

uses
  DUnitX.TestFramework,
  Model.Services.NFe,
  Model.Services.NFe.Interfaces,
  Model.Services.NFe.Command.Destinatario,
  Model.DAO.Interfaces,
  Model.DAO.NotaFiscal,
  Model.Entities.NotaFiscal,
  Model.Components.Connections.Interfaces,
  Model.Components.Connections.Firedac,
  System.SysUtils;

type
  [TestFixture]
  TModelServicesNFeCommandsDestinatarioTest = class

  private
    FNFe: iModelServicesNFe;
    FDAO: iModelDAOEntity<TModelEntitiesNotaFiscal>;
    FConnection: iModelComponentsConnections;
    FCommand: iModelServicesNFeCommand;

  public
    [Setup]
    procedure Setup;

    [Test]
    procedure TestCommand;
  end;

implementation

{ TModelServicesNFeCommandsDestinatarioTest }

procedure TModelServicesNFeCommandsDestinatarioTest.Setup;
begin
  FNFe := TModelServicesNFe.New;
  FConnection := TModelComponentsConnectionsFiredac.New;
  FDAO := TModelDAONotaFiscal.New(FConnection);
  FNFe.DAO(FDAO);

  FCommand := TModelServicesNFeCommandDestinatario.New(FNFe);
end;

procedure TModelServicesNFeCommandsDestinatarioTest.TestCommand;
begin
  FNFe.NumeroNota('1');

  FCommand.Execute;

  Assert.AreEqual('42733782000118', FNFe.Component.DestinatarioCNPJ);
end;

end.

