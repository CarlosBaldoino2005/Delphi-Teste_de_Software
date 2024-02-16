unit Model.Services.NFe.Interfaces;

interface

uses
  Model.Entities.NotaFiscal,
  Model.Services.NFe.Component.ACBr,
  Model.DAO.Interfaces,
  System.SysUtils;

{$M+}

type
  iModelServicesNFeObserver = interface;

  iModelServicesNFe = interface
    ['{DAD2E926-8072-4F6B-95E3-21A6F21A2BDF}']
    function AddNotifyMethod(Value: TProc<String, String>): iModelServicesNFe;
    function Component: TModelServicesNFeComponentACBr;
    function DAO(Value: iModelDAOEntity<TModelEntitiesNotaFiscal>): iModelServicesNFe; overload;
    function DAO: iModelDAOEntity<TModelEntitiesNotaFiscal>; overload;
    function NumeroNota(Value: String): iModelServicesNFe;
    function Clear: iModelServicesNFe;
    function Enviar: iModelServicesNFe;
  end;

  iModelServicesNFeObserver = interface
    ['{A95C7BAC-B512-4451-B96D-1A4563494562}']
    procedure Update(ChaveEletronica, Protocolo: String);
  end;

  iModelServicesNFeSubject = interface
    ['{C1A4B9E3-C157-497A-856B-C2F6C1965C20}']
    function AddObserver(Value: iModelServicesNFeObserver): iModelServicesNFeSubject;
    function Notify(ChaveEletronica, Protocolo: String): iModelServicesNFeSubject;

    function &End: iModelServicesNFe;
  end;

  iModelServicesNFeCommand = interface
    ['{52437D2F-63E3-4435-ACC5-E1D87B7DB260}']
    function Execute: iModelServicesNFeCommand;
  end;

  iModelServicesNFeInvoker = interface
    ['{FA5D08B9-B1C8-4891-A24E-3ADDACA88882}']
    function AddComand(Value: iModelServicesNFeCommand): iModelServicesNFeInvoker;
    function Execute: iModelServicesNFeInvoker;
  end;



implementation

end.
