unit Model.Services.NFe.Test;

interface

uses
  DUnitX.TestFramework,
  Model.Services.Interfaces,
  Model.Services.NFe.Interfaces,
  Model.Services.NFe,
  Model.Services.NFe.Component.ACBr,
  Model,
  Model.Entities.NotaFiscal,
  Model.DAO.Interfaces,
  MockEverything,
  Delphi.Mocks,
  System.Rtti,
  System.SysUtils;

type
  [TestFixture]
  TModelServicesNFeTest = class

  private
    FNFe: iModelServicesNFe;
    FNotaFiscal: TModelEntitiesNotaFiscal;
    FDAO: TMock<iModelDAOEntity<TModelEntitiesNotaFiscal>>;

  public
    [Setup]
    procedure Setup;

    [TearDown]
    procedure TearDown;

    [Test]
    procedure InvokeNFe;
  end;

procedure enviarSefaz;

implementation

procedure enviarSefaz;
begin

end;

{ TModelServicesNFeTest }

procedure TModelServicesNFeTest.InvokeNFe;
var
  subject: iModelServicesNFeSubject;
begin
  FNotaFiscal
    .Numero('10')
    .CNPJEmitente('12345')
    .CNPJDestinatario('6789')
    .ValorTotal(50);

  if Supports(FNFe, iModelServicesNFeSubject, subject) then
    subject
      .AddObserver(TStub<iModelServicesNFeObserver>.Create)
      .&End;

  FNFe
    .AddNotifyMethod(procedure (ChaveEletronica, Protocolo: String)begin end)
    .Clear
    .Enviar;

  Assert.AreEqual('12345', FNFe.Component.EmitenteCNPJ);
  Assert.AreEqual('6789', FNFe.Component.DestinatarioCNPJ);
  Assert.AreEqual('10', FNFe.Component.NumeroNota);
  Assert.AreEqual('50', FNFe.Component.ValorTotal.ToString);
end;

procedure TModelServicesNFeTest.Setup;
begin
  TMockDetour.Get.LoadMapAddress('FormacaoERPTest.map');
  TMockDetour.Get.Mock(TModelServicesNFeComponentACBr, 'EnviarSefaz', @EnviarSefaz);
  FNFe := TModelServicesNFe.New;
  FNotaFiscal := TModelEntitiesNotaFiscal.Create;

  FDAO := TMock<iModelDAOEntity<TModelEntitiesNotaFiscal>>.Create;
  FNFe.DAO(FDAO);
  FDAO.Setup
    .WillReturn(TValue.From<TModelEntitiesNotaFiscal>(FNotaFiscal))
    .When.This;
end;

procedure TModelServicesNFeTest.TearDown;
begin
  FNotaFiscal.Free;
end;

end.
