unit Model.DAO.Interfaces;

interface

uses
  Data.DB,
  Model.Entities.NotaFiscal;

{$M+}

type
  iModelDAOEntity<T> = interface
    ['{D18B092C-BC20-488A-B326-F5CE51A5BB19}']
    function DataSet ( aValue : TDataSource ) : iModelDAOEntity<T>; overload;
    function DataSet : TDataSet; overload;
    function Delete : iModelDAOEntity<T>;
    function Get : iModelDAOEntity<T>; overload;
    function Get ( aValue : Variant ) : iModelDAOEntity<T>; overload;
    function Get ( aParam : String; aValue : Variant ) : iModelDAOEntity<T>; overload;
    function Insert : iModelDAOEntity<T>;
    function This : T;
    function Update : iModelDAOEntity<T>;
  end;

  IModelDAOFactory = interface
    ['{9E12D111-2E69-4613-8444-7FF00A8863C7}']
    function NotaFiscalDAO: iModelDAOEntity<TModelEntitiesNotaFiscal>;
  end;

implementation

end.
