unit Model.Services.NFe.Commands.Emitente.Test;

interface

uses
  DUnitX.TestFramework,
  Model,
  Model.Services.NFe.Interfaces,
  Model.Services.NFe.Command.Emitente,
  System.SysUtils;

type
  [TestFixture]
  TModelServicesNFeCommandsEmitenteTest = class

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

{ TModelServicesNFeCommandsEmitenteTest }

procedure TModelServicesNFeCommandsEmitenteTest.Setup;
begin
  FNFe := TModel.New.Services.NFe;
  FCommand := TModelServicesNFeCommandEmitente.New(FNFe);
end;

procedure TModelServicesNFeCommandsEmitenteTest.TestCommand;
begin
  FNFe.NumeroNota('1');

  FCommand.Execute;

  Assert.AreEqual('06968708000117', FNFe.Component.EmitenteCNPJ);
end;

end.
