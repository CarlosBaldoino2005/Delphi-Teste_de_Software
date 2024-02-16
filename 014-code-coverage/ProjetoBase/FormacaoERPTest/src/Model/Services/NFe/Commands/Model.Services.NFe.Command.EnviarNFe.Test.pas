unit Model.Services.NFe.Command.EnviarNFe.Test;

interface

uses
  DUnitX.TestFramework,
  Model.Services.NFe,
  Model.Services.NFe.Interfaces,
  Model.Services.NFe.Component.ACBr,
  Model.Services.NFe.Command.EnviarNFe,
  MockEverything;

type
  [TestFixture]
  TModelServicesNFeCommandEnviarNFeTest = class

  private
    FNFe: iModelServicesNFe;
    FCommand: iModelServicesNFeCommand;

  public
    [Setup]
    procedure Setup;

    [TearDown]
    procedure TearDown;

    [Test]
    procedure CommandEnviarNFe;
  end;

procedure MockEnviar;

implementation

procedure MockEnviar;
begin

end;

{ TModelServicesNFeCommandEnviarNFeTest }

procedure TModelServicesNFeCommandEnviarNFeTest.CommandEnviarNFe;
begin
  TMockDetour.Get.LoadMapAddress('FormacaoERPTest.map');
  TMockDetour.Get.Mock(TModelServicesNFeComponentACBr, 'EnviarSefaz', @MockEnviar);

  FCommand.Execute;

  Assert.IsNotEmpty(FNFe.Component.Protocolo);
  Assert.IsNotEmpty(FNFe.Component.ChaveEletronica);
end;

procedure TModelServicesNFeCommandEnviarNFeTest.Setup;
begin
  FNFe := TModelServicesNFe.New;
  FCommand := TModelServicesNFeCommandEnviarNFe.New(FNFe);
end;

procedure TModelServicesNFeCommandEnviarNFeTest.TearDown;
begin
  TMockDetour.Get.RestoreEverything;
end;

end.
