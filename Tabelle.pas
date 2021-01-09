unit Tabelle;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, Data.DB, Vcl.Menus,
  Vcl.ExtCtrls, Vcl.DBCtrls, Vcl.StdCtrls, Vcl.Mask, Vcl.DBCGrids, DateUtils,
  Vcl.Buttons, Vcl.VirtualImageList, Vcl.BaseImageCollection, Vcl.ImageCollection,
  Vcl.WinXCtrls, Vcl.ImgList, System.ImageList, IniFiles, Utils;

type
  TFrmBargeldrechner = class(TForm)
    MainMenu: TMainMenu;
    DBCtrlGrid: TDBCtrlGrid;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    DBEdit1: TDBEdit;
    DBEdit3: TDBEdit;
    DBEdit4: TDBEdit;
    DBEdit5: TDBEdit;
    DBEdit6: TDBEdit;
    DBEdit7: TDBEdit;
    DBEdit8: TDBEdit;
    DBEdit9: TDBEdit;
    DBEdit10: TDBEdit;
    DBEdit11: TDBEdit;
    DBEdit12: TDBEdit;
    DBEdit13: TDBEdit;
    DBEdit2: TDBEdit;
    DBEdit14: TDBEdit;
    DBEdit15: TDBEdit;
    DBEdit16: TDBEdit;
    sbJan: TSpeedButton;
    sbFeb: TSpeedButton;
    sbMrz: TSpeedButton;
    sbApr: TSpeedButton;
    sbMai: TSpeedButton;
    sbJun: TSpeedButton;
    sbJul: TSpeedButton;
    sbAug: TSpeedButton;
    sbSep: TSpeedButton;
    sbOkt: TSpeedButton;
    sbNov: TSpeedButton;
    sbDez: TSpeedButton;
    sbLinks: TSpeedButton;
    sbRechts: TSpeedButton;
    edtJahr: TEdit;
    DBEdit17: TDBEdit;
    DBEdit18: TDBEdit;
    DBEdit19: TDBEdit;
    DBEdit20: TDBEdit;
    DBEdit21: TDBEdit;
    DBEdit22: TDBEdit;
    DBEdit23: TDBEdit;
    DBEdit24: TDBEdit;
    DBEdit25: TDBEdit;
    DBEdit26: TDBEdit;
    DBEdit27: TDBEdit;
    DBEdit28: TDBEdit;
    DBEdit29: TDBEdit;
    DBEdit30: TDBEdit;
    DBNavigator: TDBNavigator;
    sbPrint: TSpeedButton;
    ImageCollection: TImageCollection;
    VirtualImageList: TVirtualImageList;
    SplitView: TSplitView;
    Label17: TLabel;
    DBEdit32: TDBEdit;
    procedure FormCreate(Sender: TObject);
    procedure sbLinksClick(Sender: TObject);
    procedure sbRechtsClick(Sender: TObject);
    procedure DBCtrlGridKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure sbMonthClick(Sender: TObject);
    procedure DBCtrlGridExit(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormResize(Sender: TObject);
    procedure sbPrintClick(Sender: TObject);
  private
    procedure UpdateQuStueckelung;
    procedure SaveOnControlExit;
    procedure SaveSettings;
    procedure OpenSettings;
    { Private-Deklarationen }
  public
    { Public-Deklarationen }
  end;

var
  FrmBargeldrechner: TFrmBargeldrechner;

implementation

{$R *.dfm}

uses DataModule, XmlSettings;

procedure TFrmBargeldrechner.FormCreate(Sender: TObject);
var
  sName, sVers: string;
  iCompCount: integer;
  Ini: TIniFile;
begin
  sName := '';
  sVers := Funktion.ReadVerInfo(Application.ExeName, sName);
  Self.Caption := sName+' (v'+sVers+')';

  OpenSettings;

  DM.wCurrYear:= integer(YearOf(Date));
  DM.wCurrMonth := integer(MonthOf(Date));

  for iCompCount := 0 to ComponentCount - 1 do
    if Components[iCompCount] is TSpeedButton then
      if TSpeedButton(Components[iCompCount]).Tag = DM.wCurrMonth then
        TSpeedButton(Components[iCompCount]).Down := true;

  try
     // Establish the connection.
     DM.FDConnection.Open;
     DM.FDQuStueckelung.ParamByName('pDat').AsString :=
       Format('%.*d',[2, DM.wCurrMonth]) + '-'+ Format('%.*d',[2, DM.wCurrYear]);
     DM.FDQuStueckelung.Active := true;
     DM.FDQuLetzterKassSta.Active := true;
   except
     on E: EDatabaseError do
       E.Message := 'Exception mit Meldung ausgelöst' + E.Message;
   end;

  DM.UpdateQuLetzterKassSta;
  OpenSettings;
end;

Procedure TFrmBargeldrechner.SaveSettings; //Store the settings
Var
  AppSettings: TXMLSettings;
begin
  AppSettings := TXMLSettings.Create(ExtractFilePath(ParamStr(0)) + 'Settings.xml');
  try
    AppSettings.WriteInteger('Form', 'Top',     Top);
    AppSettings.WriteInteger('Form', 'Left',    Left);
    AppSettings.WriteBoolean('Form', 'InitMax', WindowState = wsMaximized);
    AppSettings.Save;
  finally
    AppSettings.Free;
  end;
end;

Procedure TFrmBargeldrechner.OpenSettings; //Read the settings
var
  AppSettings:  TXMLSettings;
begin
  AppSettings := TXMLSettings.Create(ExtractFilePath(ParamStr(0)) + 'Settings.xml');
  try
    Self.Top := AppSettings.ReadInteger('Form', 'Top', 0);
    Self.Left := AppSettings.ReadInteger('Form', 'Left', 0);
    if AppSettings.ReadBoolean('Form','InitMax', false) then
      WindowState := wsMaximized
    else
      WindowState := wsNormal;
  finally
    AppSettings.Free;
  end;
end;

procedure TFrmBargeldrechner.FormClose(Sender: TObject;
  var Action: TCloseAction);
var
  Ini: TIniFile;
begin
  SaveOnControlExit;
  SaveSettings;
end;

procedure TFrmBargeldrechner.SaveOnControlExit;
begin
  if DM.FDQuStueckelung.State in [dsEdit, dsInsert] then
    DM.FDQuStueckelung.Post;
end;

procedure TFrmBargeldrechner.DBCtrlGridExit(Sender: TObject);
begin
  SaveOnControlExit;
end;

procedure TFrmBargeldrechner.DBCtrlGridKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  case Key of
    VK_RETURN: begin  // TAB simulation
      Key := VK_TAB;
      DBCtrlGrid.DoKey(gkNull);
      Exit;
    end;
    VK_UP: begin      // Previous control
      DBCtrlGrid.DoKey(gkUp);
    end;
    VK_DOWN: begin    // Next control
      DBCtrlGrid.DoKey(GkDown);
    end;
  end;
end;

procedure TFrmBargeldrechner.FormResize(Sender: TObject);
var
  iAbstand: integer;
begin
  iAbstand:= Trunc(((Self.Height - DBCtrlGrid.PanelHeight) -
    (DBCtrlGrid.Height + DBCtrlGrid.Top)) / DBCtrlGrid.PanelHeight);
  if (DBCtrlGrid.RowCount + iAbstand) > 9 then
    DBCtrlGrid.RowCount := DBCtrlGrid.RowCount + iAbstand;
end;

procedure TFrmBargeldrechner.sbMonthClick(Sender: TObject);
begin
  DM.wCurrMonth := TSpeedButton(Sender).Tag;
  UpdateQuStueckelung;
  DM.UpdateQuLetzterKassSta;
end;

procedure TFrmBargeldrechner.sbPrintClick(Sender: TObject);
var
  sfr3Datei: String;
begin
  sfr3Datei := GetCurrentDir + '\Bericht.fr3';
  DM.FDQuReport.ParamByName('pDat').AsString :=
    Format('%.*d',[2, DM.wCurrMonth]) + '-'+ Format('%.*d',[2, DM.wCurrYear]);

  DM.frxReport.LoadFromFile(sfr3Datei);
  if DM.frxReport.PrepareReport then begin
    DM.frxReport.ShowPreparedReport;
  end;
end;

procedure TFrmBargeldrechner.sbLinksClick(Sender: TObject);
begin
  if (edtJahr.GetTextLen > 0) then
    if StrToInt(edtJahr.Text) > (integer(YearOf(Date)) - 10) then begin
      edtJahr.Text := IntToStr(StrToInt(edtJahr.Text) - 1);
      sbRechts.Enabled := true;
      if sbJan.Down then begin
        sbDez.Down := true;
        DM.wCurrMonth := sbDez.Tag;
      end;
      DM.wCurrYear := StrToInt(edtJahr.Text);
      UpdateQuStueckelung;
    end else
     sbLinks.Enabled := false;
end;

procedure TFrmBargeldrechner.sbRechtsClick(Sender: TObject);
begin
  if edtJahr.GetTextLen > 0 then
    if StrToInt(edtJahr.Text) < (integer(YearOf(Date)) + 10) then begin
      edtJahr.Text := IntToStr(StrToInt(edtJahr.Text) + 1);
      sbLinks.Enabled := true;
      if sbDez.Down then begin
        sbJan.Down := true;
        DM.wCurrMonth := sbJan.Tag;
      end;
      DM.wCurrYear := StrToInt(edtJahr.Text);
      UpdateQuStueckelung;
    end else
       sbRechts.Enabled := false;
end;

procedure TFrmBargeldrechner.UpdateQuStueckelung;
begin
  DM.FDQuStueckelung.DisableControls;
  DM.FDQuStueckelung.Active := false;
  DM.FDQuStueckelung.ParamByName('pDat').AsString :=
    Format('%.*d',[2, DM.wCurrMonth]) + '-'+ Format('%.*d',[2, DM.wCurrYear]);
  DM.FDQuStueckelung.Active := true;
  DM.FDQuStueckelung.EnableControls;
end;

end.
