unit Model.Services.NFe.Invoker;

interface

uses
  Model.Services.NFe.Interfaces,
  System.Generics.Collections;

type TModelServicesNFeInvoker = class(TInterfacedObject, iModelServicesNFeInvoker)

  private
    FCommands: TList<iModelServicesNFeCommand>;

  protected
    function AddComand(Value: iModelServicesNFeCommand): iModelServicesNFeInvoker;
    function Execute: iModelServicesNFeInvoker;

  public
    constructor create;
    class function New: iModelServicesNFeInvoker;
    destructor Destroy; override;
end;

implementation

{ TModelServicesNFeInvoker }

function TModelServicesNFeInvoker.AddComand(Value: iModelServicesNFeCommand): iModelServicesNFeInvoker;
begin
  result := Self;
  FCommands.Add(Value);
end;

constructor TModelServicesNFeInvoker.create;
begin
  FCommands := TList<iModelServicesNFeCommand>.Create;
end;

destructor TModelServicesNFeInvoker.Destroy;
begin
  FCommands.Free;
  inherited;
end;

function TModelServicesNFeInvoker.Execute: iModelServicesNFeInvoker;
var
  i: Integer;
begin
  for i := 0 to Pred(FCommands.Count) do
    FCommands[i].Execute;
end;

class function TModelServicesNFeInvoker.New: iModelServicesNFeInvoker;
begin
  result := Self.create;
end;

end.
