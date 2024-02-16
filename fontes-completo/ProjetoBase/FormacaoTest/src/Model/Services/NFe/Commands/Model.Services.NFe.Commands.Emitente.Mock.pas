unit Model.Services.NFe.Commands.Emitente.Mock;

interface

uses
  DUnitX.TestFramework,
  Delphi.Mocks,
  Model.DAO.Interfaces,
  Model.Entities.NotaFiscal,
  Model.Services.NFe.Interfaces,
  Model.Services.NFe,
  Model.Services.NFe.Command.Emitente,
  System.SysUtils,
  System.Rtti;

type
  [TestFixture]
  TModelServicesNFeCommandsEmitenteMock = class

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

{ TModelServicesNFeCommandsEmitenteMock }

procedure TModelServicesNFeCommandsEmitenteMock.Setup;
begin
  FNFe := TModelServicesNFe.New;
  FCommand := TModelServicesNFeCommandEmitente.New(FNFe);
  FNotaFiscal := TModelEntitiesNotaFiscal.Create;
end;

procedure TModelServicesNFeCommandsEmitenteMock.TearDown;
begin
  FreeAndNil(FNotaFiscal);
end;

procedure TModelServicesNFeCommandsEmitenteMock.TestCommand;
var
  mockDao: TMock<iModelDAOEntity<TModelEntitiesNotaFiscal>>;
begin
  FNotaFiscal.CNPJEmitente('5555');

  mockDao := TMock<iModelDAOEntity<TModelEntitiesNotaFiscal>>.Create;
  mockDao
    .Setup
    .WillReturn(TValue.From<TModelEntitiesNotaFiscal>( FNotaFiscal ))
    .When.This;

  FNFe.DAO(mockDao);

  FCommand.Execute;

  Assert.AreEqual('5555', FNFe.Component.EmitenteCNPJ);
end;

end.

