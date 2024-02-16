unit uStringUtils;

interface

uses
  System.SysUtils;

type TStringUtils = class

  public
    function ApenasNumeros(Value: String): string;
end;

implementation

{ TStringUtils }

function TStringUtils.ApenasNumeros(Value: String): string;
var
  i: Integer;
begin
  result := '';
  for i := 1 to Value.Length do
    if ((Value[i] in ['0'..'9']))   then
      Result := result + Value[i];
end;

end.
