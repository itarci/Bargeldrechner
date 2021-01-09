unit XmlSettings;

interface

uses
  ActiveX,
  SysUtils,
  XmlDoc,
  XmlIntf;
//this class mimic the basics functionalities of an TIniFile
//you can improve a lot the code adding exception handling and more methods for specifics tasks.
type
  TXMLSettings = class
  private
    FFileName: string;
    FXMLDoc: IXMLDocument; //Main XMLObject
  public
    constructor Create(const FileName: string); overload;
    destructor  Destroy; override;
    function    ReadString(const Section, Key, default: string): string;
    procedure   WriteString(const Section, Key, Value: string);
    function    ReadInteger(const Section, Key: string; default: Integer): Integer;
    procedure   WriteInteger(const Section, Key: string; Value: Integer);
    function    ReadBoolean(const Section, Key: string; default: Boolean): Boolean;
    procedure   WriteBoolean(const Section, Key: string; Value: Boolean);
    function    ReadDouble(const Section, Key: string; default: Double): Double;
    procedure   WriteDouble(const Section, Key: string; Value: Double);
    function    ReadDateTime(const Section, Key: string; default: TDatetime): TDateTime;
    procedure   WriteDatetime(const Section, Key: string; Value: TDatetime);
    function    ReadDate(const Section, Key: string; default: TDatetime): TDateTime;
    procedure   WriteDate(const Section, Key: string; Value: TDatetime);
    procedure   Save;
  end;

implementation

{ TXMLSettings }

constructor TXMLSettings.Create(const FileName: string);
begin
  inherited Create;
  FFileName       := FileName;
  FXMLDoc         := NewXMLDocument; //Create  aNew instance of a XML Document
  FXMLDoc.Encoding:= 'UTF-8'; //Set the encoding
  FXMLDoc.Options := [doNodeAutoIndent];//optional, is used to indent the Xml document

  if FileExists(FFileName) then
    FXMLDoc.LoadFromFile(FFileName)
  else
    FXMLDoc.AddChild('Root'); //Create the root Node
end;

destructor TXMLSettings.Destroy;
begin
  Save;
  inherited;
end;

function TXMLSettings.ReadBoolean(const Section, Key: string; default: Boolean): Boolean;
begin
  Result := Boolean(ReadInteger(Section, Key, Integer(default)));
end;

function TXMLSettings.ReadDate(const Section, Key: string; default: TDatetime): TDateTime;
begin
  Result := StrToDate(ReadString(Section, Key, DateToStr(default)));
end;

function TXMLSettings.ReadDateTime(const Section, Key: string; default: TDatetime): TDateTime;
begin
  Result := StrToDateTime(ReadString(Section, Key, DateTimeToStr(default)));
end;

function TXMLSettings.ReadDouble(const Section, Key: string;  default: Double): Double;
begin
  Result := StrToFloat(ReadString(Section, Key, FloatToStr(default)));
end;

function TXMLSettings.ReadInteger(const Section, Key: string; default: Integer): Integer;
begin
  Result := StrToInt(ReadString(Section, Key, IntToStr(default)));
end;

function TXMLSettings.ReadString(const Section, Key, default: string): string;
var
  XMLNode: IXMLNode;
begin
  XMLNode := FXMLDoc.DocumentElement.ChildNodes.FindNode(Section);
  if Assigned(XMLNode) and XMLNode.HasAttribute(Key) then //Check if exist the Key
    Result := XMLNode.Attributes[Key]
  else
    Result := default;
end;

procedure TXMLSettings.Save;
begin
  FXMLDoc.SaveToFile(FFileName);
end;

procedure TXMLSettings.WriteBoolean(const Section, Key: string; Value: Boolean);
begin
  WriteInteger(Section, Key, Integer(Value));
end;

procedure TXMLSettings.WriteDate(const Section, Key: string; Value: TDatetime);
begin
  WriteString(Section, Key, DateToStr(Value));
end;

procedure TXMLSettings.WriteDatetime(const Section, Key: string;  Value: TDatetime);
begin
  WriteString(Section, Key, DateTimeToStr(Value));
end;

procedure TXMLSettings.WriteDouble(const Section, Key: string; Value: Double);
begin
  WriteString(Section, Key, FloatToStr(Value));
end;

procedure TXMLSettings.WriteInteger(const Section, Key: string; Value: Integer);
begin
  WriteString(Section, Key, IntToStr(Value));
end;

procedure TXMLSettings.WriteString(const Section, Key, Value: string);
var
  XMLNode: IXMLNode;
begin
  XMLNode := FXMLDoc.DocumentElement.ChildNodes.FindNode(Section);
  if not Assigned(XMLNode) then
  XMLNode := FXMLDoc.DocumentElement.AddChild(Section);
  XMLNode.Attributes[Key] := Value;
end;

end.
