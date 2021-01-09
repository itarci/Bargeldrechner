unit DataModule;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.SQLite,
  FireDAC.Phys.SQLiteDef, FireDAC.Stan.ExprFuncs, FireDAC.VCLUI.Wait,
  FireDAC.Phys.SQLiteWrapper.Stat, FireDAC.Comp.UI, FireDAC.Comp.Client, Data.DB,
  FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt,
  FireDAC.Comp.DataSet, Datasnap.Provider, Datasnap.DBClient, DateUtils,
  frxClass, frxExportBaseDialog, frxDBSet, FireDAC.VCLUI.Error, frxExportPDF,
  frxExportHTMLDiv, frxExportDOCX, frxExportXLSX, frxExportText, frxExportHelpers;

type
  TDM = class(TDataModule)
    FDTransaction: TFDTransaction;
    FDGUIxWaitCursor: TFDGUIxWaitCursor;
    FDPhysSQLiteDriverLink: TFDPhysSQLiteDriverLink;
    FDConnection: TFDConnection;
    DsStueckelung: TDataSource;
    FDQuStueckelung: TFDQuery;
    FDQuStueckelungID: TIntegerField;
    FDQuStueckelungAnzahl200: TIntegerField;
    FDQuStueckelungAnzahl100: TIntegerField;
    FDQuStueckelungAnzahl50: TIntegerField;
    FDQuStueckelungAnzahl20: TIntegerField;
    FDQuStueckelungAnzahl10: TIntegerField;
    FDQuStueckelungAnzahl5: TIntegerField;
    FDQuStueckelungAnzahl2: TIntegerField;
    FDQuStueckelungAnzahl1: TIntegerField;
    FDQuStueckelungAnzahl050: TIntegerField;
    FDQuStueckelungAnzahl020: TIntegerField;
    FDQuStueckelungAnzahl010: TIntegerField;
    FDQuStueckelungAnzahl005: TIntegerField;
    FDQuStueckelungAnzahl002: TIntegerField;
    FDQuStueckelungAnzahl001: TIntegerField;
    FDQuStueckelungKassenstand: TFloatField;
    FDQuStueckelungBetrag200: TIntegerField;
    FDQuStueckelungBetrag100: TIntegerField;
    FDQuStueckelungBetrag50: TIntegerField;
    FDQuStueckelungBetrag20: TIntegerField;
    FDQuStueckelungBetrag10: TIntegerField;
    FDQuStueckelungBetrag5: TIntegerField;
    FDQuStueckelungBetrag2: TIntegerField;
    FDQuStueckelungBetrag1: TIntegerField;
    FDQuStueckelungBetrag050: TFloatField;
    FDQuStueckelungBetrag020: TFloatField;
    FDQuStueckelungBetrag010: TFloatField;
    FDQuStueckelungBetrag005: TFloatField;
    FDQuStueckelungBetrag002: TFloatField;
    FDQuStueckelungBetrag001: TFloatField;
    frxReport: TfrxReport;
    dsReport: TDataSource;
    FDQuReport: TFDQuery;
    FDQuReportID: TIntegerField;
    FDQuReportDatum: TDateTimeField;
    FDQuReportAnzahl200: TIntegerField;
    FDQuReportAnzahl100: TIntegerField;
    FDQuReportAnzahl50: TIntegerField;
    FDQuReportAnzahl20: TIntegerField;
    FDQuReportAnzahl10: TIntegerField;
    FDQuReportAnzahl5: TIntegerField;
    FDQuReportAnzahl2: TIntegerField;
    FDQuReportAnzahl1: TIntegerField;
    FDQuReportAnzahl050: TIntegerField;
    FDQuReportAnzahl020: TIntegerField;
    FDQuReportAnzahl010: TIntegerField;
    FDQuReportAnzahl005: TIntegerField;
    FDQuReportAnzahl002: TIntegerField;
    FDQuReportAnzahl001: TIntegerField;
    FDQuReportKassenstand: TFloatField;
    frxDBDataset: TfrxDBDataset;
    FDQuStueckelungDatum: TDateTimeField;
    FDQuReportBetrag200: TIntegerField;
    FDQuReportBetrag100: TIntegerField;
    FDQuReportBetrag50: TIntegerField;
    FDQuReportBetrag20: TIntegerField;
    FDQuReportBetrag10: TIntegerField;
    FDQuReportBetrag5: TIntegerField;
    FDQuReportBetrag2: TIntegerField;
    FDQuReportBetrag1: TIntegerField;
    FDQuReportBetrag050: TFloatField;
    FDQuReportBetrag020: TFloatField;
    FDQuReportBetrag010: TFloatField;
    FDQuReportBetrag005: TFloatField;
    FDQuReportBetrag002: TFloatField;
    FDQuReportBetrag001: TFloatField;
    FDGUIxErrorDialog: TFDGUIxErrorDialog;
    frxPDFExport: TfrxPDFExport;
    frxXLSXExport: TfrxXLSXExport;
    frxDOCXExport: TfrxDOCXExport;
    frxHTML5DivExport: TfrxHTML5DivExport;
    frxSimpleTextExport: TfrxSimpleTextExport;
    dsLetzterKassSta: TDataSource;
    FDQuLetzterKassSta: TFDQuery;
    FDQuLetzterKassStaDatum: TDateTimeField;
    FDQuLetzterKassStaLetzterKassenstand: TFloatField;
    procedure DataModuleCreate(Sender: TObject);
    procedure FDQuStueckelungCalcFields(DataSet: TDataSet);
    procedure FDQuStueckelungBeforeInsert(DataSet: TDataSet);
    procedure FDQuStueckelungNewRecord(DataSet: TDataSet);
    procedure FDQuStueckelungAnzahlValidate(Sender: TField);
    procedure FDQuStueckelungAnzahl200Change(Sender: TField);
    procedure FDConnectionError(ASender, AInitiator: TObject;
      var AException: Exception);
  private
    { Private-Deklarationen }
    dbLetzterKassenstand: Double;
    procedure UpdateKassesnStand;
  public
    { Public-Deklarationen }
    dtNextDay, dtFirstDayCurrMon, dtLastDate: TDatetime;
    wCurrYear, wCurrMonth, wLastDayCurrMon: word;
    procedure UpdateQuLetzterKassSta;
  end;

var
  DM: TDM;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

procedure TDM.DataModuleCreate(Sender: TObject);
begin
  dtNextDay := Date();
  //dbLetzterKassenstand := 0;
end;

procedure TDM.FDQuStueckelungCalcFields(DataSet: TDataSet);
begin
  FDQuStueckelungBetrag200.Value := FDQuStueckelungAnzahl200.AsInteger * 200;
  FDQuStueckelungBetrag100.Value := FDQuStueckelungAnzahl100.AsInteger * 100;
  FDQuStueckelungBetrag50.Value := FDQuStueckelungAnzahl50.AsInteger * 50;
  FDQuStueckelungBetrag20.Value := FDQuStueckelungAnzahl50.AsInteger * 20;
  FDQuStueckelungBetrag10.Value := FDQuStueckelungAnzahl10.AsInteger * 10;
  FDQuStueckelungBetrag5.Value := FDQuStueckelungAnzahl5.AsInteger * 5;
  FDQuStueckelungBetrag2.Value := FDQuStueckelungAnzahl2.AsInteger * 2;
  FDQuStueckelungBetrag1.Value := FDQuStueckelungAnzahl1.AsInteger * 1;
  FDQuStueckelungBetrag050.Value := FDQuStueckelungAnzahl050.AsInteger * 0.5;
  FDQuStueckelungBetrag020.Value := FDQuStueckelungAnzahl020.AsInteger * 0.2;
  FDQuStueckelungBetrag010.Value := FDQuStueckelungAnzahl010.AsInteger * 0.1;
  FDQuStueckelungBetrag005.Value := FDQuStueckelungAnzahl005.AsInteger * 0.05;
  FDQuStueckelungBetrag002.Value := FDQuStueckelungAnzahl002.AsInteger * 0.02;
  FDQuStueckelungBetrag001.Value := FDQuStueckelungAnzahl001.AsInteger * 0.01;
end;

procedure TDM.UpdateKassesnStand;
begin
  FDQuStueckelungKassenstand.Value :=
    dbLetzterKassenstand +
    FDQuStueckelungBetrag200.Value +
    FDQuStueckelungBetrag100.Value +
    FDQuStueckelungBetrag50.Value +
    FDQuStueckelungBetrag20.Value +
    FDQuStueckelungBetrag10.Value +
    FDQuStueckelungBetrag5.Value +
    FDQuStueckelungBetrag2.Value +
    FDQuStueckelungBetrag1.Value +
    FDQuStueckelungBetrag050.Value +
    FDQuStueckelungBetrag020.Value +
    FDQuStueckelungBetrag010.Value +
    FDQuStueckelungBetrag005.Value +
    FDQuStueckelungBetrag002.Value +
    FDQuStueckelungBetrag001.Value;
end;

procedure TDM.UpdateQuLetzterKassSta;
var
  tmpDate: string;
begin
  DM.FDQuLetzterKassSta.DisableControls;
  DM.FDQuLetzterKassSta.Active := false;
  DM.FDQuLetzterKassSta.ParamByName('pDatum').AsString :=
    Format('%.*d',[2, DM.wCurrYear]) + '-'+ Format('%.*d',[2, DM.wCurrMonth]);
  DM.FDQuLetzterKassSta.Active := true;
  DM.FDQuLetzterKassSta.EnableControls;
end;

procedure TDM.FDQuStueckelungNewRecord(DataSet: TDataSet);
begin
  DataSet.FieldByName('Datum').Value := dtLastDate;
  UpdateQuLetzterKassSta;
  FDQuStueckelungKassenstand.Value := dbLetzterKassenstand;
end;

procedure TDM.FDConnectionError(ASender, AInitiator: TObject;
  var AException: Exception);
var
   oExc: EFDDBEngineException;
begin
  if AException is EFDDBEngineException then begin
   oExc := EFDDBEngineException(AException);
   if oExc.Kind = ekRecordLocked then
     oExc.Message := 'Bitte versuchen Sie den Vorgang später. Im Moment ist der Datensatz belegt'
   else if (oExc.Kind = ekUKViolated) and SameText(oExc[0].ObjName, 'Stueckelung.Datum') then
     oExc.Message := 'Das Feld Datum kann keine sich wiederholenden Werte enthalten';
  end;
end;

procedure TDM.FDQuStueckelungAnzahl200Change(Sender: TField);
begin
  UpdateKassesnStand;
end;

procedure TDM.FDQuStueckelungAnzahlValidate(Sender: TField);
begin
  UpdateKassesnStand;
end;

procedure TDM.FDQuStueckelungBeforeInsert(DataSet: TDataSet);
var
  wYear, wMonth: Word;
begin
  DecodeDate(EndOfAMonth(wCurrYear, wCurrMonth), wYear, wMonth, wLastDayCurrMon);
  dtFirstDayCurrMon := StartOfAMonth(wCurrYear, wCurrMonth);
  if Dataset.RecordCount >= wLastDayCurrMon then begin
    //Abort;  // raise a silent exception
    raise Exception.Create('Sie können nicht mehr als '+
      IntToStr(Dataset.RecordCount) +' Datensätze in dieser Tabelle speichern');
  end
  else begin
    if FDQuStueckelungDatum.Value = 0.0 then
      dtLastDate := dtFirstDayCurrMon
    else
      dtLastDate := IncDay(FDQuStueckelungDatum.Value, 1);
  end;

  if FDQuStueckelung.RecordCount = 0 then
    begin
      dbLetzterKassenstand := FDQuLetzterKassStaLetzterKassenstand.Value;
    end else
      dbLetzterKassenstand := FDQuStueckelungKassenstand.Value;
end;

end.
