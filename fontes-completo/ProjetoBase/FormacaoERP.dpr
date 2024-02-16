program FormacaoERP;

uses
  Vcl.Forms,
  FMain in 'src\View\FMain.pas' {Form1},
  Model.Services.NFe in 'src\Model\Services\Model.Services.NFe.pas',
  Model.Services.Interfaces in 'src\Model\Services\Model.Services.Interfaces.pas',
  Controller.Interfaces in 'src\Controller\Controller.Interfaces.pas',
  Model.Services in 'src\Model\Services\Model.Services.pas',
  Controller in 'src\Controller\Controller.pas',
  Model.Interfaces in 'src\Model\Model.Interfaces.pas',
  Model in 'src\Model\Model.pas',
  Entities.NotaFiscal in 'src\Model\Entities\Entities.NotaFiscal.pas',
  Components.Connections.Interfaces in 'src\Model\Components\Connections\Components.Connections.Interfaces.pas',
  Components.Connections.Firedac in 'src\Model\Components\Connections\Components.Connections.Firedac.pas',
  DAO.Interfaces in 'src\Model\DAO\DAO.Interfaces.pas',
  DAO.NotaFiscal in 'src\Model\DAO\DAO.NotaFiscal.pas',
  Components.Services.Interfaces in 'src\Model\Components\Services\Components.Services.Interfaces.pas',
  Components.Services.NFe in 'src\Model\Components\Services\Components.Services.NFe.pas',
  Components.Services.NFe.ACBr in 'src\Model\Components\Services\Components.Services.NFe.ACBr.pas',
  Components.Services in 'src\Model\Components\Services\Components.Services.pas',
  Components.Connections in 'src\Model\Components\Connections\Components.Connections.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.