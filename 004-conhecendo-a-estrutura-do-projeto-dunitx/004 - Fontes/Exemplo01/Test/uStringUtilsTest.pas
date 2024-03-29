unit uStringUtilsTest;

interface

uses
  DUnitX.TestFramework,
  uStringUtils;

type
  [TestFixture]
  TStringUtilsTest = class
  private
    FUtils: TStringUtils;
    FResultado: String;

  public
    [Setup]
    procedure Setup;

    [TearDown]
    procedure TearDown;

    [Test]
    [TestCase('ApenasNumeros', 'A,BC123;123', ';')]
    [TestCase('LetrasMinusculas', 'abc123,123')]
    [TestCase('CaracteresEspeciais', '@abc1,23;123', ';')]
    procedure TestConvertStringParaNumeros(Valor, Esperado: String);

  end;

implementation

{ TStringUtilsTest }

procedure TStringUtilsTest.TearDown;
begin
  FUtils.Free;
end;

procedure TStringUtilsTest.Setup;
begin
  FUtils := TStringUtils.Create;
  FResultado := '';
end;

procedure TStringUtilsTest.TestConvertStringParaNumeros(Valor, Esperado: String);
begin
  FResultado := FUtils.ApenasNumeros(Valor);
  Assert.AreEqual(Esperado, FResultado);
end;

end.
