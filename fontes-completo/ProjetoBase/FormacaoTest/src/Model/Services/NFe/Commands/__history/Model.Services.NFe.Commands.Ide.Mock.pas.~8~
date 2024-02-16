unit Model.Services.NFe.Commands.Ide.Mock;

interface

uses
  DUnitX.TestFramework,
  Delphi.Mocks,
  Model.DAO.Interfaces,
  Model.Entities.NotaFiscal,
  Model.Services.NFe.Interfaces,
  Model.Services.NFe,
  Model.Services.NFe.Command.Ide,
  System.SysUtils,
  System.Rtti;

type
  [TestFixture]
  TModelServicesNFeCommandsIdeMock = class

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

{ TModelServicesNFeCommandsIdeMock }

procedure TModelServicesNFeCommandsIdeMock.Setup;
begin
  FNFe := TModelServicesNFe.New;
  FCommand := TModelServicesNFeCommandIde.New(FNFe);
  FNotaFiscal := TModelEntitiesNotaFiscal.Create;
end;

procedure TModelServicesNFeCommandsIdeMock.TearDown;
begin
  FreeAndNil(FNotaFiscal);
end;

procedure TModelServicesNFeCommandsIdeMock.TestCommand;
var
  mockDao: TMock<iModelDAOEntity<TModelEntitiesNotaFiscal>>;
begin
  FNotaFiscal
    .ValorTotal(10)
    .Numero('12');

  mockDao := TMock<iModelDAOEntity<TModelEntitiesNotaFiscal>>.Create;
  mockDao.Setup
    .WillReturn(TValue.From<TModelEntitiesNotaFiscal>( FNotaFiscal ))
    .When.This;

  FNFe.DAO(mockDao);

  FCommand.Execute;

  Assert.AreEqual('12', FNFe.Component.NumeroNota);
  Assert.AreEqual('10', FNFe.Component.ValorTotal.ToString);
end;

end.

