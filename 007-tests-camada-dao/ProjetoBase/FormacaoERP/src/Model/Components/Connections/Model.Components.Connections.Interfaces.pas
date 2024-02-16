unit Model.Components.Connections.Interfaces;

interface

uses
  Data.DB,
  System.Classes;

type
  iModelComponentsConnections = interface
    ['{40D3E554-99A1-4001-83DF-D7E8BBB85405}']
    function Active ( aValue : Boolean ) : iModelComponentsConnections;
    function AddParam ( aParam : String; aValue : Variant ) : iModelComponentsConnections; overload;
    function AddParam ( aParam : String; aValue : TPersistent ) : iModelComponentsConnections; overload;
    function DataSet : TDataSet;
    function ExecSQL : iModelComponentsConnections;
    function Open : iModelComponentsConnections;
    function SQL ( aValue : String ) : iModelComponentsConnections;
    function SQLClear : iModelComponentsConnections;
  end;

  iModelComponentsConnectionsFactory = interface
    ['{256D615B-C442-4FFB-87D5-418A9C16C0AD}']
    function Connections: iModelComponentsConnections;
  end;


implementation

end.
