object FrmAbout: TFrmAbout
  Left = 0
  Top = 0
  ActiveControl = BtnOk
  BorderStyle = bsDialog
  Caption = #220'ber Bargeldrechner'
  ClientHeight = 371
  ClientWidth = 594
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 16
  object lblEmail: TLabel
    Left = 24
    Top = 248
    Width = 36
    Height = 16
    Caption = 'Email:'
  end
  object Label1: TLabel
    Left = 24
    Top = 88
    Width = 201
    Height = 16
    Caption = 'Entwickelt von Itarci Jos'#233' Possamai'
  end
  object lblWebsite: TLabel
    Left = 24
    Top = 216
    Width = 41
    Height = 16
    Caption = 'Github:'
  end
  object VirtualImage1: TVirtualImage
    Left = 432
    Top = 8
    Width = 153
    Height = 128
    ImageCollection = FrmBargeldrechner.ImageCollection
    ImageWidth = 0
    ImageHeight = 0
    ImageIndex = 16
    ImageName = 'ledger_128px'
  end
  object BtnOk: TButton
    Left = 256
    Top = 328
    Width = 81
    Height = 33
    Caption = 'OK'
    TabOrder = 0
    OnClick = BtnOkClick
  end
  object LlbEmail: TLinkLabel
    Left = 64
    Top = 248
    Width = 113
    Height = 20
    Hint = 'Email'
    Caption = 'itarci@outlook.com'
    TabOrder = 1
    OnLinkClick = LlbEmailLinkClick
  end
  object LlbWebsite: TLinkLabel
    Left = 72
    Top = 216
    Width = 235
    Height = 20
    Caption = 'https://github.com/itarci/Bargeldrechner'
    TabOrder = 2
    OnClick = LlbWebsiteClick
  end
end
