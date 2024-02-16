unit Model.Services.NFe.Commands.Ide.Test;

interface

uses
  DUnitX.TestFramework,
  Model,
  Model.Services.NFe.Interfaces,
  Model.Services.NFe.Command.Ide,
  System.SysUtils;

type
  [TestFixture]
  TModelServicesNFeCommandsIdeTest = class

  private
    FNFe: iModelServicesNFe;
    FCommand: iModelServicesNFeCommand;

  public
    [Setup]
    procedure Setup;

    [Test]
    procedure TestCommand;
  end;

implementation

{ TModelServicesNFeCommandsIdeTest }

procedure TModelServicesNFeCommandsIdeTest.Setup;
begin
  FNFe := TModel.New.Services.NFe;
  FCommand := TModelServicesNFeCommandIde.New(FNFe);
end;

procedure TModelServicesNFeCommandsIdeTest.TestCommand;
begin
  FNFe.NumeroNota('1');

  FCommand.Execute;

  Assert.AreEqual('1', FNFe.Component.NumeroNota);
  Assert.AreEqual('100', FNFe.Component.ValorTotal.ToString);
end;

end.

