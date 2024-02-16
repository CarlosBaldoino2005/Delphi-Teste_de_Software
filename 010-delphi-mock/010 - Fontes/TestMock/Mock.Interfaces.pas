unit Mock.Interfaces;

interface

uses
  Delphi.Mocks;

{$M+}

type
  iDAONotaFiscal = interface
    ['{5C6B97D3-4910-44E8-900E-81AF88A9F9F7}']
    function NumeroNota: string;
  end;

  iLog = interface
    ['{CA771241-C401-4012-9E50-0A39F59199F9}']
    procedure SaveLog(Content: String);
  end;

  iNFe = interface
    ['{76CA9C99-748A-4D7D-8DE3-7DBB1FD860DC}']
    function DAO(Value: iDAONotaFiscal): iNFe;
    function Log(Value: iLog): iNFe;

    function Emitir: String;
  end;

  TNFe = class(TInterfacedObject, iNFe)

  private
    FDAO: iDAONotaFiscal;
    FLog: iLog;

  protected
    function DAO(Value: iDAONotaFiscal): iNFe;
    function Log(Value: iLog): iNFe;

    function Emitir: String;
  end;

implementation

{ TNFe }

function TNFe.DAO(Value: iDAONotaFiscal): iNFe;
begin
  result := Self;
  FDAO := Value;
end;

function TNFe.Emitir: String;
var
  numero: String;
begin
  numero := FDAO.NumeroNota;
  FLog.SaveLog(numero);

  // Emitir

  result := '001';
end;

function TNFe.Log(Value: iLog): iNFe;
begin
  result := Self;
  FLog := Value;
end;

end.
