program Bargeldrechner;

uses
  Vcl.Forms,
  DataModule in 'DataModule.pas' {DM: TDataModule},
  Tabelle in 'Tabelle.pas' {FrmBargeldrechner},
  Utils in 'Utils.pas',
  XmlSettings in 'XmlSettings.pas',
  Vcl.Themes,
  Vcl.Styles;

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  TStyleManager.TrySetStyle('Aqua Light Slate');
  Application.CreateForm(TDM, DM);
  Application.CreateForm(TFrmBargeldrechner, FrmBargeldrechner);
  Application.Run;
end.
