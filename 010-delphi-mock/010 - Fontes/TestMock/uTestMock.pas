unit uTestMock;

interface

uses
  DUnitX.TestFramework,
  Delphi.Mocks,
  Mock.Interfaces;

type
  [TestFixture]
  TTestMock = class
  private
    FNFe: iNFe;

  public

    [Test]
    procedure EmitirNFe;
  end;

implementation

{ TTestMock }

procedure TTestMock.EmitirNFe;
var
  mock: TMock<iDAONotaFiscal>;
  stub: TStub<iLog>;
  resultado: String;
begin
  mock := TMock<iDAONotaFiscal>.create;
  mock.Setup
    .WillReturn('5')
    .When.NumeroNota;

  stub := TStub<iLog>.create;

  FNFe := TNFe.Create;
  FNFe
    .DAO(mock)
    .Log(stub);

  resultado := FNFe.Emitir;

  Assert.AreEqual('001', resultado);
end;

initialization
  TDUnitX.RegisterTestFixture(TTestMock);

end.
