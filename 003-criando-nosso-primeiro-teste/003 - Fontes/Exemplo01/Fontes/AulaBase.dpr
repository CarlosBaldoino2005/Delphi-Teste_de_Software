program AulaBase;

uses
  Vcl.Forms,
  FMain in 'FMain.pas' {Form1},
  uStringUtils in 'uStringUtils.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
