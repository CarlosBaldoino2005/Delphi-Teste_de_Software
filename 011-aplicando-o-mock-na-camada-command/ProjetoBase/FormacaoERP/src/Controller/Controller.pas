unit Controller;

interface

uses
  Controller.Interfaces,
  Model.Interfaces,
  Model;

type TController = class(TInterfacedObject, IController)

  private
    FModel: IModel;

  protected
    function Model: IModel;

  public
    class function New: IController;

end;

implementation

{ TController }

class function TController.New: IController;
begin
  result := Self.Create;
end;

function TController.Model: IModel;
begin
  if not Assigned(FModel) then
    FModel := TModel.New;
  result := FModel;
end;

end.
