program ProvaDelphiApp;

uses
  Vcl.Forms,
  ufTarefa1 in 'ufTarefa1.pas' {fTarefa1},
  uPrincipal in 'uPrincipal.pas' {fPrincipal},
  uTarefa3 in 'uTarefa3.pas' {fTarefa3},
  uspThreadProvaDelphiapp in 'uspThreadProvaDelphiapp.pas',
  ufTarefa2 in 'ufTarefa2.pas' {fTarefa2};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfPrincipal, fPrincipal);
  Application.Run;
end.
