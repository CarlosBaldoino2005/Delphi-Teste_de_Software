unit Model.Services.NFe.Command.EnviarNFe;

interface

uses
  DUnitX.TestFramework,
  Model.Services.NFe,
  Model.Services.NFe.Interfaces,
  Model.Services.NFe.Component.ACBr,
  Model.Services.NFe.Command.EnviarNFe;

type
  [TestFixture]
  TModelServicesNFeCommandEnviarNFe = class

  private
    FNFe: iModelServicesNFe;
    FCommand: iModelServicesNFeCommand;

  public
    [Setup]
    procedure Setup;

    [Test]
    procedure CommandEnviarNFe;
  end;

implementation

{ TModelServicesNFeCommandEnviarNFe }

procedure TModelServicesNFeCommandEnviarNFe.CommandEnviarNFe;
begin

end;

procedure TModelServicesNFeCommandEnviarNFe.Setup;
begin
//  FNFe := TModel
end;

end.