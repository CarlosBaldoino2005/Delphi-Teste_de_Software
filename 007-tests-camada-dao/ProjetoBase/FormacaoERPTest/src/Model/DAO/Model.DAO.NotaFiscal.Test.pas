unit Model.DAO.NotaFiscal.Test;

interface

uses
  System.SysUtils,
  DUnitX.TestFramework,
  Model.Entities.NotaFiscal,
  Model.DAO.Interfaces,
  Model.DAO.NotaFiscal,
  Model.Components.Connections.Interfaces,
  Model.Components.Connections.Firedac;

type
  [TestFixture]
  TModelDAONotaFiscalTest = class
  private
    FDAO: iModelDAOEntity<TModelEntitiesNotaFiscal>;
    FConnection: iModelComponentsConnections;

  public
    [Setup]
    procedure Setup;

    constructor create;

    [Test]
    procedure ConsultaNotaPeloNumero;

    [Test]
    procedure ConsultaPeloId;

    [Test]
    procedure Insert;

    [Test]
    procedure Update;

    [Test]
    procedure Delete;

    [Test]
    procedure InsertSemPassarDadosDoEmitente;
  end;

implementation

{ TModelDAONotaFiscalTest }

procedure TModelDAONotaFiscalTest.ConsultaNotaPeloNumero;
begin
  FDAO.Get('numero', '1');
  Assert.AreEqual('40D3E554-99A1-4001-83DF-D7E8BBB85405', FDAO.This.id);
end;

procedure TModelDAONotaFiscalTest.ConsultaPeloId;
begin
  FDAO.Get('40D3E554-99A1-4001-83DF-D7E8BBB85405');
  Assert.AreEqual('1', FDAO.This.Numero);
end;

constructor TModelDAONotaFiscalTest.create;
begin
  FConnection := TModelComponentsConnectionsFiredac.New;
end;

procedure TModelDAONotaFiscalTest.Delete;
var
  id: String;
begin
  FDAO.This
    .Id('')
    .Numero('101')
    .CNPJEmitente('123456')
    .CNPJDestinatario('789')
    .ValorTotal(10);

  id := FDAO.Insert.This.Id;

  FDAO.Delete;

  FDAO.Get(id);
  Assert.IsEmpty(FDAO.This.Id);
end;

procedure TModelDAONotaFiscalTest.Insert;
begin
  FDAO.This
    .Id('')
    .Numero('101')
    .CNPJEmitente('123456')
    .CNPJDestinatario('789')
    .ValorTotal(10);

  Assert.WillNotRaise(
    procedure
    begin
      FDAO.Insert;
    end);

  Assert.IsNotEmpty(FDAO.This.Id);
  FDAO.Delete;
end;

procedure TModelDAONotaFiscalTest.InsertSemPassarDadosDoEmitente;
begin
  FDAO.This
    .Id('')
    .Numero('101')
    .CNPJEmitente('')
    .CNPJDestinatario('789')
    .ValorTotal(10);

  Assert.WillRaiseWithMessage(
    procedure
    begin
      FDAO.Insert;
    end,
    Exception,
    'Erro ao inserir nota fiscal: CNPJ Emitente � obrigat�rio.');
end;

procedure TModelDAONotaFiscalTest.Setup;
begin
  FDAO := TModelDAONotaFiscal.New(FConnection);
end;

procedure TModelDAONotaFiscalTest.Update;
begin
  FDAO.Get('numero', '1');
  FDAO.This.ValorTotal(50);

  FDAO.Update;

  FDAO.Get('numero', '1');
  Assert.AreEqual('50', FDAO.This.ValorTotal.toString);

  FDAO.This.ValorTotal(100);
  FDAO.Update;
end;

end.
