unit View.Main;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls,
  Controller, Controller.Interfaces, Data.DB, Vcl.Grids, Vcl.DBGrids,
  Vcl.ExtCtrls;

type
  TForm1 = class(TForm)
    btnNFe: TButton;
    edtNumeroNota: TLabeledEdit;
    edtChaveEletronica: TLabeledEdit;
    edtProtocolo: TLabeledEdit;
    Memo1: TMemo;
    procedure btnNFeClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    FController: IController;
    { Private declarations }
    procedure MostrarDadosEmissao(ChaveEletronica, Protocolo: String);
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.btnNFeClick(Sender: TObject);
begin
  FController
    .Model
      .Services
        .NFe
          .AddNotifyMethod(MostrarDadosEmissao)
          .Clear
          .NumeroNota(edtNumeroNota.Text)
          .Enviar;


  ShowMessage('Nota Enviada com sucesso.');
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  ReportMemoryLeaksOnShutdown := True;
  FController := TController.New;
end;

procedure TForm1.MostrarDadosEmissao(ChaveEletronica, Protocolo: String);
begin
  edtChaveEletronica.Text := ChaveEletronica;
  edtProtocolo.Text := Protocolo;
end;

end.
