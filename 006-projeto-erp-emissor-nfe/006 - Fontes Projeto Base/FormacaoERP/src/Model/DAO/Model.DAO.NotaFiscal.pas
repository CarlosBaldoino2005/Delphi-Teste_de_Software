unit Model.DAO.NotaFiscal;

interface

uses
  Model.DAO.Interfaces,
  Model.Components.Connections.Interfaces,
  Data.DB,
  Model.Entities.NotaFiscal,
  System.SysUtils;

type TModelDAONotaFiscal = class(TInterfacedObject, iModelDAOEntity<TModelEntitiesNotaFiscal>)

  private
    FConnection: iModelComponentsConnections;
    FEntity: TModelEntitiesNotaFiscal;
    FDataSource: TDataSource;

    procedure ReadFromDataSet;
  protected
    function DataSet ( aValue : TDataSource ) : iModelDAOEntity<TModelEntitiesNotaFiscal>;  overload;
    function DataSet : TDataSet; overload;
    function Delete : iModelDAOEntity<TModelEntitiesNotaFiscal>;
    function Get : iModelDAOEntity<TModelEntitiesNotaFiscal>; overload;
    function Get ( aValue : Variant ) : iModelDAOEntity<TModelEntitiesNotaFiscal>; overload;
    function Get ( aParam : String; aValue : Variant ) : iModelDAOEntity<TModelEntitiesNotaFiscal>; overload;
    function Insert : iModelDAOEntity<TModelEntitiesNotaFiscal>;
    function This : TModelEntitiesNotaFiscal;
    function Update : iModelDAOEntity<TModelEntitiesNotaFiscal>;
  public
    constructor create(Connection: iModelComponentsConnections);
    class function New(Connection: iModelComponentsConnections): iModelDAOEntity<TModelEntitiesNotaFiscal>;
    destructor Destroy; override;
end;

implementation

{ TModelDAONotaFiscal }

constructor TModelDAONotaFiscal.create(Connection: iModelComponentsConnections);
begin
  FConnection := Connection;
end;

function TModelDAONotaFiscal.DataSet(aValue: TDataSource): iModelDAOEntity<TModelEntitiesNotaFiscal>;
begin
  Result := Self;
  FDataSource := aValue;
  FDataSource.DataSet := FConnection.DataSet;
end;

function TModelDAONotaFiscal.DataSet: TDataSet;
begin
  Result := FConnection.DataSet;
end;

function TModelDAONotaFiscal.Delete: iModelDAOEntity<TModelEntitiesNotaFiscal>;
begin
  Result := Self;
  try
    FConnection
      .Active(False)
      .SQLClear
      .SQL('DELETE FROM NOTAFISCAL')
      .SQL('WHERE ID = :ID')
      .AddParam('ID', FEntity.Id)
    .ExecSQL;
  except on ex:exception do
    raise Exception.Create('Erro ao Excluir Nota Fiscal: ' + ex.Message);
  end;
end;

destructor TModelDAONotaFiscal.Destroy;
begin
  FEntity.Free;
  inherited;
end;

function TModelDAONotaFiscal.Get: iModelDAOEntity<TModelEntitiesNotaFiscal>;
begin
  Result := Self;
  try
    FConnection
      .Active(False)
      .SQLClear
      .SQL('SELECT * FROM NOTAFISCAL ')
    .Open;
  except on ex:exception do
    raise Exception.Create('Erro ao Consultar Nota Fiscal: ' + ex.Message);
  end;
end;

function TModelDAONotaFiscal.Get(aParam: String; aValue: Variant): iModelDAOEntity<TModelEntitiesNotaFiscal>;
begin
  Result := Self;
  try
    FConnection
      .Active(False)
      .SQLClear
      .SQL('SELECT * FROM NOTAFISCAL WHERE ' + aParam + ' = ' + QuotedStr(aValue))
    .Open;

    ReadFromDataSet;
  except on ex:exception do
    raise Exception.Create('Erro ao Consultar Nota Fiscal: ' + ex.Message);
  end;
end;

function TModelDAONotaFiscal.Get(aValue: Variant): iModelDAOEntity<TModelEntitiesNotaFiscal>;
begin
  Result := Self;
  try
    FConnection
      .Active(False)
      .SQLClear
      .SQL('SELECT * FROM NOTAFISCAL WHERE ID = :ID' )
      .AddParam('ID', aValue)
    .Open;

    ReadFromDataSet;
  except on ex:exception do
    raise Exception.Create('Erro ao Consultar Nota Fiscal: ' + ex.Message);
  end;
end;

function TModelDAONotaFiscal.Insert: iModelDAOEntity<TModelEntitiesNotaFiscal>;
begin
  Result := Self;
  try
    if This.CNPJEmitente.IsEmpty then
      raise Exception.CreateFmt('CNPJ Emitente � obrigat�rio.', []);

    FEntity.Id(TGUID.NewGuid.ToString.Replace('{', '').Replace('}', ''));
    FConnection
      .Active(False)
      .SQLClear
      .SQL('INSERT INTO NOTAFISCAL(ID, NUMERO, CHAVEELETRONICA, PROTOCOLO, CNPJEMITENTE, CNPJDESTINATARIO, VALORTOTAL)')
      .SQL('VALUES(:ID, :NUMERO, :CHAVEELETRONICA, :PROTOCOLO, :CNPJEMITENTE, :CNPJDESTINATARIO, :VALORTOTAL)')
      .AddParam('ID', FEntity.ID)
      .AddParam('NUMERO', FEntity.Numero)
      .AddParam('CHAVEELETRONICA', FEntity.ChaveEletronica)
      .AddParam('PROTOCOLO', FEntity.Protocolo)
      .AddParam('CNPJEMITENTE', FEntity.CNPJEmitente)
      .AddParam('CNPJDESTINATARIO', FEntity.CNPJDestinatario)
      .AddParam('VALORTOTAL', FEntity.ValorTotal)
    .ExecSQL;
  except
    on ex:exception do
    begin
      FEntity.Id('');
      raise Exception.Create('Erro ao inserir nota fiscal: ' + ex.Message);
    end;
  end;
end;

class function TModelDAONotaFiscal.New(Connection: iModelComponentsConnections): iModelDAOEntity<TModelEntitiesNotaFiscal>;
begin
  result := Self.create(Connection);
end;

procedure TModelDAONotaFiscal.ReadFromDataSet;
begin
  This
    .Id(DataSet.FieldByName('ID').AsString)
    .Numero(DataSet.FieldByName('Numero').AsString)
    .ChaveEletronica(DataSet.FieldByName('ChaveEletronica').AsString)
    .Protocolo(DataSet.FieldByName('Protocolo').AsString)
    .CNPJEmitente(DataSet.FieldByName('CNPJEmitente').AsString)
    .CNPJDestinatario(DataSet.FieldByName('CNPJDestinatario').AsString)
    .ValorTotal(DataSet.FieldByName('ValorTotal').AsFloat)
end;

function TModelDAONotaFiscal.This: TModelEntitiesNotaFiscal;
begin
  if not Assigned(FEntity) then
    FEntity := TModelEntitiesNotaFiscal.Create;
  result := FEntity;
end;

function TModelDAONotaFiscal.Update: iModelDAOEntity<TModelEntitiesNotaFiscal>;
begin
  result := Self;
  try
    FConnection
      .Active(False)
      .SQLClear
      .SQL('UPDATE NOTAFISCAL SET ')
      .SQL('NUMERO = :NUMERO, ')
      .SQL('CHAVEELETRONICA = :CHAVEELETRONICA, ')
      .SQL('PROTOCOLO = :PROTOCOLO, ')
      .SQL('CNPJEMITENTE = :CNPJEMITENTE, ')
      .SQL('CNPJDESTINATARIO = :CNPJDESTINATARIO, ')
      .SQL('VALORTOTAL = :VALORTOTAL')
      .SQL('WHERE ID = :ID')
      .AddParam('NUMERO', FEntity.Numero)
      .AddParam('CHAVEELETRONICA', FEntity.ChaveEletronica)
      .AddParam('PROTOCOLO', FEntity.Protocolo)
      .AddParam('CNPJEMITENTE', FEntity.CNPJEmitente)
      .AddParam('CNPJDESTINATARIO', FEntity.CNPJDestinatario)
      .AddParam('VALORTOTAL', FEntity.ValorTotal)
      .AddParam('ID', FEntity.Id)
    .ExecSQL;
  except on ex:exception do
    raise Exception.Create('Erro ao inserir nota fiscal: ' + ex.Message);
  end;
end;

end.
