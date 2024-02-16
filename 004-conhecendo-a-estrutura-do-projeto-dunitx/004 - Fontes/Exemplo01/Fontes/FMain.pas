unit FMain;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TForm1 = class(TForm)
    Label1: TLabel;
    edtTexto: TEdit;
    btnConverter: TButton;
    edtTextoConvertido: TEdit;
    procedure btnConverterClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

uses
  uStringUtils;

procedure TForm1.btnConverterClick(Sender: TObject);
var
  utils: TStringUtils;
begin
  utils := TStringUtils.Create;
  try
    edtTextoConvertido.Text := utils.ApenasNumeros(edtTexto.Text);
  finally
    utils.Free;
  end;
end;

end.
