unit Model.Services.NFe;

interface

uses
  Model.Entities.NotaFiscal,
  Model.DAO.Interfaces,
  Model.Services.NFe.Component.ACBr,
  Model.Services.NFe.Interfaces,
  Model.Services.NFe.Invoker,
  Model.Services.NFe.Command.Ide,
  Model.Services.NFe.Command.Emitente,
  Model.Services.NFe.Command.Destinatario,
  Model.Services.NFe.Command.EnviarNFe,
  System.SysUtils,
  System.Generics.Collections;

type TModelServicesNFe = class(TInterfacedObject, iModelServicesNFe,
                                                  iModelServicesNFeSubject)

  private
    FDAONotaFiscal: iModelDAOEntity<TModelEntitiesNotaFiscal>;
    FComponent: TModelServicesNFeComponentACBr;
    FObservers: TList<iModelServicesNFeObserver>;
    FNotifyMethods: TList<TProc<String, String>>;

  protected
    function Component: TModelServicesNFeComponentACBr;
    function AddNotifyMethod(Value: TProc<String, String>): iModelServicesNFe;
    function DAO(Value: iModelDAOEntity<TModelEntitiesNotaFiscal>): iModelServicesNFe; overload;
    function DAO: iModelDAOEntity<TModelEntitiesNotaFiscal>; overload;
    function NumeroNota(Value: String): iModelServicesNFe;
    function NotaFiscal: TModelEntitiesNotaFiscal;
    function Clear: iModelServicesNFe;
    function Enviar: iModelServicesNFe;

    function AddObserver(Value: iModelServicesNFeObserver): iModelServicesNFeSubject;
    function Notify(ChaveEletronica, Protocolo: String): iModelServicesNFeSubject;

    function &End: iModelServicesNFe;
  public
    constructor create;
    class function New: iModelServicesNFe;
    destructor Destroy; override;
end;

implementation

{ TModelServicesNFe }

function TModelServicesNFe.&End: iModelServicesNFe;
begin
  result := Self;
end;

function TModelServicesNFe.AddNotifyMethod(Value: TProc<String, String>): iModelServicesNFe;
begin
  result := Self;
  FNotifyMethods.Add(Value);
end;

function TModelServicesNFe.AddObserver(Value: iModelServicesNFeObserver): iModelServicesNFeSubject;
begin
  result := Self;
  FObservers.Add(Value);
end;

function TModelServicesNFe.Clear: iModelServicesNFe;
begin
  Result := Self;
  FComponent.Clear;
end;

function TModelServicesNFe.Component: TModelServicesNFeComponentACBr;
begin
  result := FComponent;
end;

constructor TModelServicesNFe.create;
begin
  FComponent := TModelServicesNFeComponentACBr.Create(nil);
  FObservers := TList<iModelServicesNFeObserver>.create;
  FNotifyMethods := TList<TProc<String, String>>.Create;
end;

function TModelServicesNFe.DAO(Value: iModelDAOEntity<TModelEntitiesNotaFiscal>): iModelServicesNFe;
begin
  result := Self;
  FDAONotaFiscal := Value;
end;

function TModelServicesNFe.DAO: iModelDAOEntity<TModelEntitiesNotaFiscal>;
begin
  result := Self.FDAONotaFiscal;
end;

destructor TModelServicesNFe.Destroy;
begin
  FComponent.Free;
  FObservers.Free;
  FNotifyMethods.Free;
  inherited;
end;

function TModelServicesNFe.Enviar: iModelServicesNFe;
begin
  Result := Self;
  TModelServicesNFeInvoker.New
    .AddComand(TModelServicesNFeCommandEmitente.New(Self))
    .AddComand(TModelServicesNFeCommandDestinatario.New(Self))
    .AddComand(TModelServicesNFeCommandIde.New(Self))
    .AddComand(TModelServicesNFeCommandEnviarNFe.New(Self))
    .Execute;

  Notify(FComponent.ChaveEletronica, FComponent.Protocolo);
end;

class function TModelServicesNFe.New: iModelServicesNFe;
begin
  result := Self.Create;
end;

function TModelServicesNFe.NotaFiscal: TModelEntitiesNotaFiscal;
begin
  result := FDAONotaFiscal.This;
end;

function TModelServicesNFe.Notify(ChaveEletronica, Protocolo: String): iModelServicesNFeSubject;
var
  i: Integer;
begin
  for i := 0 to Pred(FObservers.Count) do
    FObservers[i].Update(ChaveEletronica, Protocolo);

  for i := 0 to Pred(FNotifyMethods.Count) do
    FNotifyMethods[i](FComponent.ChaveEletronica, FComponent.Protocolo);
end;

function TModelServicesNFe.NumeroNota(Value: String): iModelServicesNFe;
begin
  result := Self;
  FDAONotaFiscal.Get('numero', Value);
end;

end.
