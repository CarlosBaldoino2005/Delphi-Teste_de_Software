program FormacaoERP;

uses
  Vcl.Forms,
  Model.Entities.NotaFiscal in 'src\Model\Entities\Model.Entities.NotaFiscal.pas',
  Model.DAO.NotaFiscal in 'src\Model\DAO\Model.DAO.NotaFiscal.pas',
  Model.Components.Connections.Firedac in 'src\Model\Components\Connections\Model.Components.Connections.Firedac.pas',
  Model.Components.Connections.Interfaces in 'src\Model\Components\Connections\Model.Components.Connections.Interfaces.pas',
  Model.Components.Connections.Factory in 'src\Model\Components\Connections\Model.Components.Connections.Factory.pas',
  Model.Services.NFe.Interfaces in 'src\Model\Services\NFe\Model.Services.NFe.Interfaces.pas',
  Model.Services.NFe in 'src\Model\Services\NFe\Model.Services.NFe.pas',
  Model.Interfaces in 'src\Model\Model.Interfaces.pas',
  Model in 'src\Model\Model.pas',
  Controller.Interfaces in 'src\Controller\Controller.Interfaces.pas',
  Controller in 'src\Controller\Controller.pas',
  View.Main in 'src\View\View.Main.pas' {Form1},
  Model.Components.Interfaces in 'src\Model\Components\Model.Components.Interfaces.pas',
  Model.Components.Factory in 'src\Model\Components\Model.Components.Factory.pas',
  Model.Services.NFe.Invoker in 'src\Model\Services\NFe\Model.Services.NFe.Invoker.pas',
  Model.Services.NFe.Command.Emitente in 'src\Model\Services\NFe\Commands\Model.Services.NFe.Command.Emitente.pas',
  Model.Services.NFe.Command.Destinatario in 'src\Model\Services\NFe\Commands\Model.Services.NFe.Command.Destinatario.pas',
  Model.Services.NFe.Command.Ide in 'src\Model\Services\NFe\Commands\Model.Services.NFe.Command.Ide.pas',
  Model.Services.Interfaces in 'src\Model\Services\Model.Services.Interfaces.pas',
  Model.Services.Factory in 'src\Model\Services\Model.Services.Factory.pas',
  Model.Services.NFe.Component.ACBr in 'src\Model\Services\NFe\Model.Services.NFe.Component.ACBr.pas',
  Model.Services.NFe.Command.EnviarNFe in 'src\Model\Services\NFe\Commands\Model.Services.NFe.Command.EnviarNFe.pas',
  Model.Services.NFe.Observer.AtualizarNota in 'src\Model\Services\NFe\Observers\Model.Services.NFe.Observer.AtualizarNota.pas',
  Model.DAO.Interfaces in 'src\Model\DAO\Model.DAO.Interfaces.pas',
  Model.DAO.Factory in 'src\Model\DAO\Model.DAO.Factory.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
