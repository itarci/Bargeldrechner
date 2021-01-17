unit About;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, ShellApi,
  Vcl.VirtualImage, System.ImageList, Vcl.ImgList, Vcl.VirtualImageList;

type
  TFrmAbout = class(TForm)
    BtnOk: TButton;
    lblEmail: TLabel;
    LlbEmail: TLinkLabel;
    Label1: TLabel;
    lblWebsite: TLabel;
    LlbWebsite: TLinkLabel;
    VirtualImage1: TVirtualImage;
    procedure BtnOkClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure LlbWebsiteClick(Sender: TObject);
    procedure LlbEmailLinkClick(Sender: TObject; const Link: string;
      LinkType: TSysLinkType);
  private
    { Private-Deklarationen }
  public
    { Public-Deklarationen }
  end;

var
  FrmAbout: TFrmAbout;

implementation

{$R *.dfm}

uses Tabelle;

procedure TFrmAbout.BtnOkClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmAbout.FormCreate(Sender: TObject);
begin
  LlbWebsite.Caption := '<a href="https://github.com/itarci/Bargeldrechner">Bargeldrechner</a>';
  LlbEmail.Caption   := '<a href="mailto:itarci@outlook.com">itarci@outlook.com</a>';
end;

procedure TFrmAbout.LlbWebsiteClick(Sender: TObject);
begin
  ShellExecute(0, 'open', PChar('https://github.com/itarci/Bargeldrechner'), nil, nil, SW_SHOWNORMAL);
end;

procedure TFrmAbout.LlbEmailLinkClick(Sender: TObject; const Link: string;
  LinkType: TSysLinkType);
begin
  ShellExecute(0, 'open', PChar('mailto:itarci@outlook.com'), nil, nil, SW_SHOWNORMAL);
end;

end.
