unit Model.Services.NFe.Commands.Destinatario.Mock;

interface

uses
  DUnitX.TestFramework,
  Delphi.Mocks,
  Model.DAO.Interfaces,
  Model.Entities.NotaFiscal,
  Model.Services.NFe.Interfaces,
  Model.Services.NFe,
  Model.Services.NFe.Command.Destinatario,
  System.SysUtils, System.Rtti;

type
  [TestFixture]
  TModelServicesNFeCommandsDestinatarioMock = class

  private
    FNFe: iModelServicesNFe;
    FCommand: iModelServicesNFeCommand;
    FNotaFiscal: TModelEntitiesNotaFiscal;

  public
    [Setup]
    procedure Setup;

    [TearDown]
    procedure TearDown;

    [Test]
    procedure TestCommand;
  end;

implementation

{ TModelServicesNFeCommandsDestinatarioMock }

procedure TModelServicesNFeCommandsDestinatarioMock.Setup;
begin
  FNFe := TModelServicesNFe.New;
  FCommand := TModelServicesNFeCommandDestinatario.New(FNFe);
  FNotaFiscal := TModelEntitiesNotaFiscal.Create;
end;

procedure TModelServicesNFeCommandsDestinatarioMock.TearDown;
begin
  FreeAndNil(FNotaFiscal);
end;

procedure TModelServicesNFeCommandsDestinatarioMock.TestCommand;
var
  mockDao: TMock<iModelDAOEntity<TModelEntitiesNotaFiscal>>;
begin
  FNotaFiscal.CNPJDestinatario('5555');

  mockDao := TMock<iModelDAOEntity<TModelEntitiesNotaFiscal>>.Create;
  mockDao.Setup
    .WillReturn(TValue.From<TModelEntitiesNotaFiscal>( FNotaFiscal ))
    .When.This;

  FNFe.DAO(mockDao);

  FCommand.Execute;

  Assert.AreEqual('5555', FNFe.Component.DestinatarioCNPJ);
end;

end.

