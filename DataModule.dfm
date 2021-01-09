object DM: TDM
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 623
  Width = 765
  object FDTransaction: TFDTransaction
    Connection = FDConnection
    Left = 80
    Top = 120
  end
  object FDGUIxWaitCursor: TFDGUIxWaitCursor
    Provider = 'Forms'
    Left = 80
    Top = 248
  end
  object FDPhysSQLiteDriverLink: TFDPhysSQLiteDriverLink
    Left = 80
    Top = 184
  end
  object FDConnection: TFDConnection
    Params.Strings = (
      'Database=C:\RADStudio\Bargeldrechner\DB_Bargeldrechner.db'
      'DriverID=SQLite')
    FetchOptions.AssignedValues = [evAutoClose]
    FetchOptions.AutoClose = False
    LoginPrompt = False
    Transaction = FDTransaction
    OnError = FDConnectionError
    Left = 80
    Top = 56
  end
  object DsStueckelung: TDataSource
    DataSet = FDQuStueckelung
    Left = 328
    Top = 56
  end
  object FDQuStueckelung: TFDQuery
    BeforeInsert = FDQuStueckelungBeforeInsert
    OnCalcFields = FDQuStueckelungCalcFields
    OnNewRecord = FDQuStueckelungNewRecord
    Connection = FDConnection
    SQL.Strings = (
      'SELECT'
      '  ID, '
      '  Datum as "Datum::DATETIME", '
      '  Anzahl200, '
      '  Anzahl100, '
      '  Anzahl50, '
      '  Anzahl20,'
      '  Anzahl10, '
      '  Anzahl5, '
      '  Anzahl2, '
      '  Anzahl1, '
      '  Anzahl050, '
      '  Anzahl020, '
      '  Anzahl010, '
      '  Anzahl005, '
      '  Anzahl002, '
      '  Anzahl001, '
      '  Kassenstand'
      'FROM'
      '  Stueckelung S'
      'WHERE'
      '  strftime('#39'%m-%Y'#39', Datum) = :pDat'
      'ORDER BY '
      '  Datum')
    Left = 232
    Top = 56
    ParamData = <
      item
        Name = 'PDAT'
        ParamType = ptInput
      end>
    object FDQuStueckelungID: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'ID'
      Origin = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object FDQuStueckelungDatum: TDateTimeField
      FieldName = 'Datum'
      Origin = 'Datum'
      Required = True
    end
    object FDQuStueckelungAnzahl200: TIntegerField
      FieldName = 'Anzahl200'
      Origin = 'Anzahl200'
      OnChange = FDQuStueckelungAnzahl200Change
    end
    object FDQuStueckelungAnzahl100: TIntegerField
      FieldName = 'Anzahl100'
      Origin = 'Anzahl100'
      OnChange = FDQuStueckelungAnzahl200Change
    end
    object FDQuStueckelungAnzahl50: TIntegerField
      FieldName = 'Anzahl50'
      Origin = 'Anzahl50'
      OnChange = FDQuStueckelungAnzahl200Change
    end
    object FDQuStueckelungAnzahl20: TIntegerField
      FieldName = 'Anzahl20'
      Origin = 'Anzahl20'
      OnChange = FDQuStueckelungAnzahl200Change
    end
    object FDQuStueckelungAnzahl10: TIntegerField
      FieldName = 'Anzahl10'
      Origin = 'Anzahl10'
      OnChange = FDQuStueckelungAnzahl200Change
    end
    object FDQuStueckelungAnzahl5: TIntegerField
      FieldName = 'Anzahl5'
      Origin = 'Anzahl5'
      OnChange = FDQuStueckelungAnzahl200Change
    end
    object FDQuStueckelungAnzahl2: TIntegerField
      FieldName = 'Anzahl2'
      Origin = 'Anzahl2'
      OnChange = FDQuStueckelungAnzahl200Change
    end
    object FDQuStueckelungAnzahl1: TIntegerField
      FieldName = 'Anzahl1'
      Origin = 'Anzahl1'
      OnChange = FDQuStueckelungAnzahl200Change
    end
    object FDQuStueckelungAnzahl050: TIntegerField
      FieldName = 'Anzahl050'
      Origin = 'Anzahl050'
      OnChange = FDQuStueckelungAnzahl200Change
    end
    object FDQuStueckelungAnzahl020: TIntegerField
      FieldName = 'Anzahl020'
      Origin = 'Anzahl020'
      OnChange = FDQuStueckelungAnzahl200Change
    end
    object FDQuStueckelungAnzahl010: TIntegerField
      FieldName = 'Anzahl010'
      Origin = 'Anzahl010'
      OnChange = FDQuStueckelungAnzahl200Change
    end
    object FDQuStueckelungAnzahl005: TIntegerField
      FieldName = 'Anzahl005'
      Origin = 'Anzahl005'
      OnChange = FDQuStueckelungAnzahl200Change
    end
    object FDQuStueckelungAnzahl002: TIntegerField
      FieldName = 'Anzahl002'
      Origin = 'Anzahl002'
      OnChange = FDQuStueckelungAnzahl200Change
    end
    object FDQuStueckelungAnzahl001: TIntegerField
      FieldName = 'Anzahl001'
      Origin = 'Anzahl001'
      OnChange = FDQuStueckelungAnzahl200Change
    end
    object FDQuStueckelungKassenstand: TFloatField
      FieldName = 'Kassenstand'
      Origin = 'Kassenstand'
      Required = True
      DisplayFormat = '#,##0.00'
    end
    object FDQuStueckelungBetrag200: TIntegerField
      FieldKind = fkCalculated
      FieldName = 'Betrag200'
      Calculated = True
    end
    object FDQuStueckelungBetrag100: TIntegerField
      FieldKind = fkCalculated
      FieldName = 'Betrag100'
      Calculated = True
    end
    object FDQuStueckelungBetrag50: TIntegerField
      FieldKind = fkCalculated
      FieldName = 'Betrag50'
      Calculated = True
    end
    object FDQuStueckelungBetrag20: TIntegerField
      FieldKind = fkCalculated
      FieldName = 'Betrag20'
      Calculated = True
    end
    object FDQuStueckelungBetrag10: TIntegerField
      FieldKind = fkCalculated
      FieldName = 'Betrag10'
      Calculated = True
    end
    object FDQuStueckelungBetrag5: TIntegerField
      FieldKind = fkCalculated
      FieldName = 'Betrag5'
      Calculated = True
    end
    object FDQuStueckelungBetrag2: TIntegerField
      FieldKind = fkCalculated
      FieldName = 'Betrag2'
      Calculated = True
    end
    object FDQuStueckelungBetrag1: TIntegerField
      FieldKind = fkCalculated
      FieldName = 'Betrag1'
      Calculated = True
    end
    object FDQuStueckelungBetrag050: TFloatField
      FieldKind = fkCalculated
      FieldName = 'Betrag050'
      DisplayFormat = '#,##0.00'
      Calculated = True
    end
    object FDQuStueckelungBetrag020: TFloatField
      FieldKind = fkCalculated
      FieldName = 'Betrag020'
      DisplayFormat = '#,##0.00'
      Calculated = True
    end
    object FDQuStueckelungBetrag010: TFloatField
      FieldKind = fkCalculated
      FieldName = 'Betrag010'
      DisplayFormat = '#,##0.00'
      Calculated = True
    end
    object FDQuStueckelungBetrag005: TFloatField
      FieldKind = fkCalculated
      FieldName = 'Betrag005'
      DisplayFormat = '#,##0.00'
      Calculated = True
    end
    object FDQuStueckelungBetrag002: TFloatField
      FieldKind = fkCalculated
      FieldName = 'Betrag002'
      DisplayFormat = '#,##0.00'
      Calculated = True
    end
    object FDQuStueckelungBetrag001: TFloatField
      FieldKind = fkCalculated
      FieldName = 'Betrag001'
      DisplayFormat = '#,##0.00'
      Calculated = True
    end
  end
  object frxReport: TfrxReport
    Version = '6.9.3'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick, pbCopy, pbSelection]
    PreviewOptions.Zoom = 2.000000000000000000
    PrintOptions.Printer = 'Default'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 44197.588160555600000000
    ReportOptions.LastChange = 44199.695289537000000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    Left = 72
    Top = 432
    Datasets = <
      item
        DataSet = frxDBDataset
        DataSetName = 'frxDBDataset'
      end>
    Variables = <>
    Style = <>
    object Data: TfrxDataPage
      Height = 1000.000000000000000000
      Width = 1000.000000000000000000
    end
    object Page1: TfrxReportPage
      PaperWidth = 210.000000000000000000
      PaperHeight = 297.000000000000000000
      PaperSize = 9
      LeftMargin = 10.000000000000000000
      RightMargin = 10.000000000000000000
      TopMargin = 10.000000000000000000
      BottomMargin = 10.000000000000000000
      Frame.Typ = []
      MirrorMode = []
      object ReportTitle: TfrxReportTitle
        FillType = ftBrush
        Frame.Typ = []
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -19
        Font.Name = 'Calibri'
        Font.Style = []
        Height = 30.236240000000000000
        ParentFont = False
        Top = 18.897650000000000000
        Width = 718.110700000000000000
        object Memo19: TfrxMemoView
          AllowVectorExport = True
          Width = 226.771800000000000000
          Height = 22.677180000000000000
          Frame.Typ = []
          Memo.UTF8W = (
            'St'#252'ckelung Kassenbestand')
          WordWrap = False
        end
      end
      object PageHeader: TfrxPageHeader
        FillType = ftBrush
        Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
        Frame.BottomLine.Width = 2.000000000000000000
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Calibri'
        Font.Style = []
        Height = 15.118120000000000000
        ParentFont = False
        Top = 71.811070000000000000
        Width = 718.110700000000000000
        object Memo1: TfrxMemoView
          AllowVectorExport = True
          Width = 60.472480000000000000
          Height = 15.118120000000000000
          Frame.Typ = [ftRight]
          GapX = 5.000000000000000000
          Memo.UTF8W = (
            'Datum')
          WordWrap = False
        end
        object Memo2: TfrxMemoView
          AllowVectorExport = True
          Left = 109.606370000000000000
          Width = 37.795275590000000000
          Height = 15.118120000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Calibri'
          Font.Style = []
          Frame.Typ = [ftLeft]
          GapX = 5.000000000000000000
          HAlign = haRight
          Memo.UTF8W = (
            '200 '#8364)
          ParentFont = False
          WordWrap = False
        end
        object Memo3: TfrxMemoView
          AllowVectorExport = True
          Left = 147.401670000000000000
          Width = 37.795275590000000000
          Height = 15.118120000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Calibri'
          Font.Style = []
          Frame.Typ = [ftLeft]
          GapX = 5.000000000000000000
          HAlign = haRight
          Memo.UTF8W = (
            '100 '#8364)
          ParentFont = False
          WordWrap = False
        end
        object Memo4: TfrxMemoView
          AllowVectorExport = True
          Left = 185.196970000000000000
          Width = 37.795275590000000000
          Height = 15.118120000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Calibri'
          Font.Style = []
          Frame.Typ = [ftLeft]
          GapX = 5.000000000000000000
          HAlign = haRight
          Memo.UTF8W = (
            '50 '#8364)
          ParentFont = False
          WordWrap = False
        end
        object Memo5: TfrxMemoView
          AllowVectorExport = True
          Left = 222.992270000000000000
          Width = 37.795275590000000000
          Height = 15.118120000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Calibri'
          Font.Style = []
          Frame.Typ = [ftLeft]
          GapX = 5.000000000000000000
          HAlign = haRight
          Memo.UTF8W = (
            '20 '#8364)
          ParentFont = False
          WordWrap = False
        end
        object Memo6: TfrxMemoView
          AllowVectorExport = True
          Left = 260.787570000000000000
          Width = 37.795275590000000000
          Height = 15.118120000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Calibri'
          Font.Style = []
          Frame.Typ = [ftLeft]
          GapX = 5.000000000000000000
          HAlign = haRight
          Memo.UTF8W = (
            '10 '#8364)
          ParentFont = False
          WordWrap = False
        end
        object Memo7: TfrxMemoView
          AllowVectorExport = True
          Left = 298.582870000000000000
          Width = 37.795275590000000000
          Height = 15.118120000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Calibri'
          Font.Style = []
          Frame.Typ = [ftLeft]
          GapX = 5.000000000000000000
          HAlign = haRight
          Memo.UTF8W = (
            '5 '#8364)
          ParentFont = False
          WordWrap = False
        end
        object Memo8: TfrxMemoView
          AllowVectorExport = True
          Left = 336.378170000000000000
          Width = 37.795275590000000000
          Height = 15.118120000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Calibri'
          Font.Style = []
          Frame.Typ = [ftLeft]
          GapX = 5.000000000000000000
          HAlign = haRight
          Memo.UTF8W = (
            '2 '#8364)
          ParentFont = False
          WordWrap = False
        end
        object Memo9: TfrxMemoView
          AllowVectorExport = True
          Left = 374.173470000000000000
          Width = 37.795275590000000000
          Height = 15.118120000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Calibri'
          Font.Style = []
          Frame.Typ = [ftLeft]
          GapX = 5.000000000000000000
          HAlign = haRight
          Memo.UTF8W = (
            '1 '#8364)
          ParentFont = False
          WordWrap = False
        end
        object Memo10: TfrxMemoView
          AllowVectorExport = True
          Left = 411.968770000000000000
          Width = 37.795275590000000000
          Height = 15.118120000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Calibri'
          Font.Style = []
          Frame.Typ = [ftLeft]
          GapX = 5.000000000000000000
          HAlign = haRight
          Memo.UTF8W = (
            '50 Ct')
          ParentFont = False
          WordWrap = False
        end
        object Memo11: TfrxMemoView
          AllowVectorExport = True
          Left = 449.764070000000000000
          Width = 37.795275590000000000
          Height = 15.118120000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Calibri'
          Font.Style = []
          Frame.Typ = [ftLeft]
          GapX = 5.000000000000000000
          HAlign = haRight
          Memo.UTF8W = (
            '20 Ct')
          ParentFont = False
          WordWrap = False
        end
        object Memo12: TfrxMemoView
          AllowVectorExport = True
          Left = 487.559370000000000000
          Width = 37.795275590000000000
          Height = 15.118120000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Calibri'
          Font.Style = []
          Frame.Typ = [ftLeft]
          GapX = 5.000000000000000000
          HAlign = haRight
          Memo.UTF8W = (
            '10 Ct')
          ParentFont = False
          WordWrap = False
        end
        object Memo13: TfrxMemoView
          AllowVectorExport = True
          Left = 525.354670000000000000
          Width = 37.795275590000000000
          Height = 15.118120000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Calibri'
          Font.Style = []
          Frame.Typ = [ftLeft]
          GapX = 5.000000000000000000
          HAlign = haRight
          Memo.UTF8W = (
            '5 Ct')
          ParentFont = False
          WordWrap = False
        end
        object Memo14: TfrxMemoView
          AllowVectorExport = True
          Left = 563.149970000000000000
          Width = 37.795275590000000000
          Height = 15.118120000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Calibri'
          Font.Style = []
          Frame.Typ = [ftLeft]
          GapX = 5.000000000000000000
          HAlign = haRight
          Memo.UTF8W = (
            '2 Ct')
          ParentFont = False
          WordWrap = False
        end
        object Memo15: TfrxMemoView
          AllowVectorExport = True
          Left = 600.945270000000000000
          Width = 37.795275590000000000
          Height = 15.118120000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Calibri'
          Font.Style = []
          Frame.Typ = [ftLeft]
          GapX = 5.000000000000000000
          HAlign = haRight
          Memo.UTF8W = (
            '1 Ct')
          ParentFont = False
          WordWrap = False
        end
        object Memo16: TfrxMemoView
          AllowVectorExport = True
          Left = 638.740570000000000000
          Width = 79.370130000000000000
          Height = 15.118120000000000000
          Frame.Typ = [ftLeft]
          GapX = 5.000000000000000000
          HAlign = haRight
          Memo.UTF8W = (
            'Kassenstand')
          WordWrap = False
        end
      end
      object PageFooter: TfrxPageFooter
        FillType = ftBrush
        Frame.Typ = []
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Calibri'
        Font.Style = []
        Height = 22.677180000000000000
        ParentFont = False
        Top = 238.110390000000000000
        Width = 718.110700000000000000
        object SysMemo1: TfrxSysMemoView
          AllowVectorExport = True
          Top = 3.779530000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          Frame.Typ = []
          Memo.UTF8W = (
            '[DATE]')
          WordWrap = False
        end
        object SysMemo2: TfrxSysMemoView
          AllowVectorExport = True
          Left = 604.724800000000000000
          Top = 3.779530000000000000
          Width = 113.385900000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Calibri'
          Font.Style = []
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            '[PAGE#] von [TOTALPAGES#]')
          ParentFont = False
          WordWrap = False
        end
      end
      object MasterData: TfrxMasterData
        FillType = ftBrush
        Frame.Typ = [ftLeft, ftRight, ftBottom]
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Calibri'
        Font.Style = []
        Height = 30.236240000000000000
        ParentFont = False
        Top = 147.401670000000000000
        Width = 718.110700000000000000
        DataSet = frxDBDataset
        DataSetName = 'frxDBDataset'
        RowCount = 0
        object frxDBDatasetDatum: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Width = 60.472480000000000000
          Height = 15.118120000000000000
          DataField = 'Datum'
          DataSet = frxDBDataset
          DataSetName = 'frxDBDataset'
          Frame.Typ = [ftBottom]
          Frame.Width = 0.500000000000000000
          GapX = 5.000000000000000000
          HAlign = haRight
          Memo.UTF8W = (
            '[frxDBDataset."Datum"]')
          WordWrap = False
        end
        object frxDBDatasetAnzahl200: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 109.606370000000000000
          Width = 37.795275590000000000
          Height = 15.118120000000000000
          DataField = 'Anzahl200'
          DataSet = frxDBDataset
          DataSetName = 'frxDBDataset'
          Frame.Typ = [ftLeft, ftBottom]
          Frame.Width = 0.500000000000000000
          GapX = 5.000000000000000000
          HAlign = haRight
          HideZeros = True
          Memo.UTF8W = (
            '[frxDBDataset."Anzahl200"]')
          WordWrap = False
        end
        object frxDBDatasetAnzahl100: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 147.401670000000000000
          Width = 37.795275590000000000
          Height = 15.118110240000000000
          DataField = 'Anzahl100'
          DataSet = frxDBDataset
          DataSetName = 'frxDBDataset'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Calibri'
          Font.Style = []
          Frame.Typ = [ftLeft, ftBottom]
          Frame.Width = 0.500000000000000000
          GapX = 5.000000000000000000
          HAlign = haRight
          HideZeros = True
          Memo.UTF8W = (
            '[frxDBDataset."Anzahl100"]')
          ParentFont = False
          WordWrap = False
        end
        object frxDBDatasetAnzahl50: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 185.196970000000000000
          Width = 37.795275590000000000
          Height = 15.118110240000000000
          DataField = 'Anzahl50'
          DataSet = frxDBDataset
          DataSetName = 'frxDBDataset'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Calibri'
          Font.Style = []
          Frame.Typ = [ftLeft, ftBottom]
          Frame.Width = 0.500000000000000000
          GapX = 5.000000000000000000
          HAlign = haRight
          HideZeros = True
          Memo.UTF8W = (
            '[frxDBDataset."Anzahl50"]')
          ParentFont = False
          WordWrap = False
        end
        object frxDBDatasetAnzahl20: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 222.992270000000000000
          Width = 37.795275590000000000
          Height = 15.118110240000000000
          DataField = 'Anzahl20'
          DataSet = frxDBDataset
          DataSetName = 'frxDBDataset'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Calibri'
          Font.Style = []
          Frame.Typ = [ftLeft, ftBottom]
          Frame.Width = 0.500000000000000000
          GapX = 5.000000000000000000
          HAlign = haRight
          HideZeros = True
          Memo.UTF8W = (
            '[frxDBDataset."Anzahl20"]')
          ParentFont = False
          WordWrap = False
        end
        object frxDBDatasetAnzahl10: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 260.787570000000000000
          Width = 37.795275590000000000
          Height = 15.118110240000000000
          DataField = 'Anzahl10'
          DataSet = frxDBDataset
          DataSetName = 'frxDBDataset'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Calibri'
          Font.Style = []
          Frame.Typ = [ftLeft, ftBottom]
          Frame.Width = 0.500000000000000000
          GapX = 5.000000000000000000
          HAlign = haRight
          HideZeros = True
          Memo.UTF8W = (
            '[frxDBDataset."Anzahl10"]')
          ParentFont = False
          WordWrap = False
        end
        object frxDBDatasetAnzahl5: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 298.582870000000000000
          Width = 37.795275590000000000
          Height = 15.118110240000000000
          DataField = 'Anzahl5'
          DataSet = frxDBDataset
          DataSetName = 'frxDBDataset'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Calibri'
          Font.Style = []
          Frame.Typ = [ftLeft, ftBottom]
          Frame.Width = 0.500000000000000000
          GapX = 5.000000000000000000
          HAlign = haRight
          HideZeros = True
          Memo.UTF8W = (
            '[frxDBDataset."Anzahl5"]')
          ParentFont = False
          WordWrap = False
        end
        object frxDBDatasetAnzahl2: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 336.378170000000000000
          Width = 37.795275590000000000
          Height = 15.118110240000000000
          DataField = 'Anzahl2'
          DataSet = frxDBDataset
          DataSetName = 'frxDBDataset'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Calibri'
          Font.Style = []
          Frame.Typ = [ftLeft, ftBottom]
          Frame.Width = 0.500000000000000000
          GapX = 5.000000000000000000
          HAlign = haRight
          HideZeros = True
          Memo.UTF8W = (
            '[frxDBDataset."Anzahl2"]')
          ParentFont = False
          WordWrap = False
        end
        object frxDBDatasetAnzahl1: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 374.173470000000000000
          Width = 37.795275590000000000
          Height = 15.118110240000000000
          DataField = 'Anzahl1'
          DataSet = frxDBDataset
          DataSetName = 'frxDBDataset'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Calibri'
          Font.Style = []
          Frame.Typ = [ftLeft, ftBottom]
          Frame.Width = 0.500000000000000000
          GapX = 5.000000000000000000
          HAlign = haRight
          HideZeros = True
          Memo.UTF8W = (
            '[frxDBDataset."Anzahl1"]')
          ParentFont = False
          WordWrap = False
        end
        object frxDBDatasetKassenstand: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 638.740570000000000000
          Top = 15.118120000000000000
          Width = 79.370130000000000000
          Height = 15.118110240000000000
          DataField = 'Kassenstand'
          DataSet = frxDBDataset
          DataSetName = 'frxDBDataset'
          Frame.Typ = [ftLeft, ftTop]
          Frame.Width = 0.500000000000000000
          GapX = 5.000000000000000000
          HAlign = haRight
          HideZeros = True
          Memo.UTF8W = (
            '[frxDBDataset."Kassenstand"]')
          WordWrap = False
        end
        object frxDBDatasetAnzahl050: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 411.968770000000000000
          Width = 37.795275590000000000
          Height = 15.118110240000000000
          DataField = 'Anzahl050'
          DataSet = frxDBDataset
          DataSetName = 'frxDBDataset'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Calibri'
          Font.Style = []
          Frame.Typ = [ftLeft, ftBottom]
          Frame.Width = 0.500000000000000000
          GapX = 5.000000000000000000
          HAlign = haRight
          HideZeros = True
          Memo.UTF8W = (
            '[frxDBDataset."Anzahl050"]')
          ParentFont = False
          WordWrap = False
        end
        object frxDBDatasetAnzahl020: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 449.764070000000000000
          Width = 37.795275590000000000
          Height = 15.118110240000000000
          DataField = 'Anzahl020'
          DataSet = frxDBDataset
          DataSetName = 'frxDBDataset'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Calibri'
          Font.Style = []
          Frame.Typ = [ftLeft, ftBottom]
          Frame.Width = 0.500000000000000000
          GapX = 5.000000000000000000
          HAlign = haRight
          HideZeros = True
          Memo.UTF8W = (
            '[frxDBDataset."Anzahl020"]')
          ParentFont = False
          WordWrap = False
        end
        object frxDBDatasetAnzahl010: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 487.559370000000000000
          Width = 37.795275590000000000
          Height = 15.118110240000000000
          DataField = 'Anzahl010'
          DataSet = frxDBDataset
          DataSetName = 'frxDBDataset'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Calibri'
          Font.Style = []
          Frame.Typ = [ftLeft, ftBottom]
          Frame.Width = 0.500000000000000000
          GapX = 5.000000000000000000
          HAlign = haRight
          HideZeros = True
          Memo.UTF8W = (
            '[frxDBDataset."Anzahl010"]')
          ParentFont = False
          WordWrap = False
        end
        object frxDBDatasetAnzahl005: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 525.354670000000000000
          Width = 37.795275590000000000
          Height = 15.118110240000000000
          DataField = 'Anzahl005'
          DataSet = frxDBDataset
          DataSetName = 'frxDBDataset'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Calibri'
          Font.Style = []
          Frame.Typ = [ftLeft, ftBottom]
          Frame.Width = 0.500000000000000000
          GapX = 5.000000000000000000
          HAlign = haRight
          HideZeros = True
          Memo.UTF8W = (
            '[frxDBDataset."Anzahl005"]')
          ParentFont = False
          WordWrap = False
        end
        object frxDBDatasetAnzahl002: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 563.149970000000000000
          Width = 37.795275590000000000
          Height = 15.118110240000000000
          DataField = 'Anzahl002'
          DataSet = frxDBDataset
          DataSetName = 'frxDBDataset'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Calibri'
          Font.Style = []
          Frame.Typ = [ftLeft, ftBottom]
          Frame.Width = 0.500000000000000000
          GapX = 5.000000000000000000
          HAlign = haRight
          HideZeros = True
          Memo.UTF8W = (
            '[frxDBDataset."Anzahl002"]')
          ParentFont = False
          WordWrap = False
        end
        object frxDBDatasetAnzahl001: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 600.945270000000000000
          Width = 37.795275590000000000
          Height = 15.118110240000000000
          DataField = 'Anzahl001'
          DataSet = frxDBDataset
          DataSetName = 'frxDBDataset'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Calibri'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftBottom]
          Frame.Width = 0.500000000000000000
          GapX = 5.000000000000000000
          HAlign = haRight
          HideZeros = True
          Memo.UTF8W = (
            '[frxDBDataset."Anzahl001"]')
          ParentFont = False
          WordWrap = False
        end
        object Memo17: TfrxMemoView
          AllowVectorExport = True
          Left = 60.472480000000000000
          Width = 49.133890000000000000
          Height = 15.118120000000000000
          Frame.Typ = [ftLeft, ftBottom]
          Frame.Width = 0.500000000000000000
          GapX = 5.000000000000000000
          Memo.UTF8W = (
            'Anzahl')
          WordWrap = False
        end
        object Memo18: TfrxMemoView
          AllowVectorExport = True
          Left = 60.472480000000000000
          Top = 15.118120000000000000
          Width = 49.133890000000000000
          Height = 15.118120000000000000
          Frame.Typ = [ftLeft]
          Frame.Width = 0.500000000000000000
          GapX = 5.000000000000000000
          Memo.UTF8W = (
            'Betrag')
          WordWrap = False
        end
        object frxDBDatasetBetrag200: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 109.606370000000000000
          Top = 15.118120000000000000
          Width = 37.795275590000000000
          Height = 15.118120000000000000
          DataField = 'Betrag200'
          DataSet = frxDBDataset
          DataSetName = 'frxDBDataset'
          Frame.Typ = [ftLeft]
          Frame.Width = 0.500000000000000000
          GapX = 5.000000000000000000
          HAlign = haRight
          HideZeros = True
          Memo.UTF8W = (
            '[frxDBDataset."Betrag200"]')
          WordWrap = False
        end
        object frxDBDatasetBetrag100: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 147.401670000000000000
          Top = 15.118120000000000000
          Width = 37.795275590000000000
          Height = 15.118120000000000000
          DataField = 'Betrag100'
          DataSet = frxDBDataset
          DataSetName = 'frxDBDataset'
          Frame.Typ = [ftLeft]
          Frame.Width = 0.500000000000000000
          GapX = 5.000000000000000000
          HAlign = haRight
          HideZeros = True
          Memo.UTF8W = (
            '[frxDBDataset."Betrag100"]')
          WordWrap = False
        end
        object frxDBDatasetBetrag50: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 185.196970000000000000
          Top = 15.118120000000000000
          Width = 37.795275590000000000
          Height = 15.118120000000000000
          DataField = 'Betrag50'
          DataSet = frxDBDataset
          DataSetName = 'frxDBDataset'
          Frame.Typ = [ftLeft]
          Frame.Width = 0.500000000000000000
          GapX = 5.000000000000000000
          HAlign = haRight
          HideZeros = True
          Memo.UTF8W = (
            '[frxDBDataset."Betrag50"]')
          WordWrap = False
        end
        object frxDBDatasetBetrag20: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 222.992270000000000000
          Top = 15.118120000000000000
          Width = 37.795275590000000000
          Height = 15.118120000000000000
          DataField = 'Betrag20'
          DataSet = frxDBDataset
          DataSetName = 'frxDBDataset'
          Frame.Typ = [ftLeft]
          Frame.Width = 0.500000000000000000
          GapX = 5.000000000000000000
          HAlign = haRight
          HideZeros = True
          Memo.UTF8W = (
            '[frxDBDataset."Betrag20"]')
          WordWrap = False
        end
        object frxDBDatasetBetrag10: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 260.787570000000000000
          Top = 15.118120000000000000
          Width = 37.795275590000000000
          Height = 15.118120000000000000
          DataField = 'Betrag10'
          DataSet = frxDBDataset
          DataSetName = 'frxDBDataset'
          Frame.Typ = [ftLeft]
          Frame.Width = 0.500000000000000000
          GapX = 5.000000000000000000
          HAlign = haRight
          HideZeros = True
          Memo.UTF8W = (
            '[frxDBDataset."Betrag10"]')
          WordWrap = False
        end
        object frxDBDatasetBetrag5: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 298.582870000000000000
          Top = 15.118120000000000000
          Width = 37.795275590000000000
          Height = 15.118120000000000000
          DataField = 'Betrag5'
          DataSet = frxDBDataset
          DataSetName = 'frxDBDataset'
          Frame.Typ = [ftLeft]
          Frame.Width = 0.500000000000000000
          GapX = 5.000000000000000000
          HAlign = haRight
          HideZeros = True
          Memo.UTF8W = (
            '[frxDBDataset."Betrag5"]')
          WordWrap = False
        end
        object frxDBDatasetBetrag2: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 336.378170000000000000
          Top = 15.118120000000000000
          Width = 37.795275590000000000
          Height = 15.118120000000000000
          DataField = 'Betrag2'
          DataSet = frxDBDataset
          DataSetName = 'frxDBDataset'
          Frame.Typ = [ftLeft]
          Frame.Width = 0.500000000000000000
          GapX = 5.000000000000000000
          HAlign = haRight
          HideZeros = True
          Memo.UTF8W = (
            '[frxDBDataset."Betrag2"]')
          WordWrap = False
        end
        object frxDBDatasetBetrag1: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 374.173470000000000000
          Top = 15.118120000000000000
          Width = 37.795275590000000000
          Height = 15.118120000000000000
          DataField = 'Betrag1'
          DataSet = frxDBDataset
          DataSetName = 'frxDBDataset'
          Frame.Typ = [ftLeft]
          Frame.Width = 0.500000000000000000
          GapX = 5.000000000000000000
          HAlign = haRight
          HideZeros = True
          Memo.UTF8W = (
            '[frxDBDataset."Betrag1"]')
          WordWrap = False
        end
        object frxDBDatasetBetrag050: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 411.968770000000000000
          Top = 15.118120000000000000
          Width = 37.795275590000000000
          Height = 15.118120000000000000
          DataField = 'Betrag050'
          DataSet = frxDBDataset
          DataSetName = 'frxDBDataset'
          Frame.Typ = [ftLeft]
          Frame.Width = 0.500000000000000000
          GapX = 5.000000000000000000
          HAlign = haRight
          HideZeros = True
          Memo.UTF8W = (
            '[frxDBDataset."Betrag050"]')
          WordWrap = False
        end
        object frxDBDatasetBetrag020: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 449.764070000000000000
          Top = 15.118120000000000000
          Width = 37.795275590000000000
          Height = 15.118120000000000000
          DataField = 'Betrag020'
          DataSet = frxDBDataset
          DataSetName = 'frxDBDataset'
          Frame.Typ = [ftLeft]
          Frame.Width = 0.500000000000000000
          GapX = 5.000000000000000000
          HAlign = haRight
          HideZeros = True
          Memo.UTF8W = (
            '[frxDBDataset."Betrag020"]')
          WordWrap = False
        end
        object frxDBDatasetBetrag010: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 487.559370000000000000
          Top = 15.118120000000000000
          Width = 37.795275590000000000
          Height = 15.118120000000000000
          DataField = 'Betrag010'
          DataSet = frxDBDataset
          DataSetName = 'frxDBDataset'
          Frame.Typ = [ftLeft]
          Frame.Width = 0.500000000000000000
          GapX = 5.000000000000000000
          HAlign = haRight
          HideZeros = True
          Memo.UTF8W = (
            '[frxDBDataset."Betrag010"]')
          WordWrap = False
        end
        object frxDBDatasetBetrag005: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 525.354670000000000000
          Top = 15.118120000000000000
          Width = 37.795275590000000000
          Height = 15.118120000000000000
          DataField = 'Betrag005'
          DataSet = frxDBDataset
          DataSetName = 'frxDBDataset'
          Frame.Typ = [ftLeft]
          Frame.Width = 0.500000000000000000
          GapX = 5.000000000000000000
          HAlign = haRight
          HideZeros = True
          Memo.UTF8W = (
            '[frxDBDataset."Betrag005"]')
          WordWrap = False
        end
        object frxDBDatasetBetrag002: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 563.149970000000000000
          Top = 15.118120000000000000
          Width = 37.795275590000000000
          Height = 15.118120000000000000
          DataField = 'Betrag002'
          DataSet = frxDBDataset
          DataSetName = 'frxDBDataset'
          Frame.Typ = [ftLeft]
          Frame.Width = 0.500000000000000000
          GapX = 5.000000000000000000
          HAlign = haRight
          HideZeros = True
          Memo.UTF8W = (
            '[frxDBDataset."Betrag002"]')
          WordWrap = False
        end
        object frxDBDatasetBetrag001: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 600.945270000000000000
          Top = 15.118120000000000000
          Width = 37.795275590000000000
          Height = 15.118120000000000000
          DataField = 'Betrag001'
          DataSet = frxDBDataset
          DataSetName = 'frxDBDataset'
          Frame.Typ = [ftLeft]
          Frame.Width = 0.500000000000000000
          GapX = 5.000000000000000000
          HAlign = haRight
          HideZeros = True
          Memo.UTF8W = (
            '[frxDBDataset."Betrag001"]')
          WordWrap = False
        end
      end
    end
  end
  object dsReport: TDataSource
    DataSet = FDQuReport
    Left = 232
    Top = 520
  end
  object FDQuReport: TFDQuery
    Connection = FDConnection
    SQL.Strings = (
      'SELECT'
      
        '  ID, Datum as "Datum::DATETIME", Anzahl200, Anzahl100, Anzahl50' +
        ', Anzahl20, Anzahl10, Anzahl5, Anzahl2, Anzahl1, Anzahl050, Anza' +
        'hl020, Anzahl010, Anzahl005, Anzahl002, Anzahl001, Kassenstand,'
      #9'Anzahl200 * 200 as "Betrag200::INTEGER", '
      #9'Anzahl100 *100 as "Betrag100::INTEGER", '
      #9'Anzahl50 * 50  as "Betrag50::INTEGER", '
      #9'Anzahl20 * 20 as "Betrag20::INTEGER", '
      #9'Anzahl10 * 10 as "Betrag10::INTEGER", '
      #9'Anzahl5 * 5 as "Betrag5::INTEGER", '
      #9'Anzahl2 * 2 as "Betrag2::INTEGER", '
      #9'Anzahl1 as Betrag1, '
      #9'Anzahl050 * 0.5 as "Betrag050::DOUBLE", '
      #9'Anzahl020 * 0.2 as "Betrag020::DOUBLE", '
      #9'Anzahl010 * 0.1 as "Betrag010::DOUBLE", '
      #9'Anzahl005 * 0.05 as "Betrag005::DOUBLE", '
      #9'Anzahl002 * 0.02 as "Betrag002::DOUBLE", '
      #9'Anzahl001 * 0.01 as "Betrag001::DOUBLE"'
      'FROM'
      '  Stueckelung'
      'WHERE'
      '  strftime('#39'%m-%Y'#39', Datum) = :pDat'
      'ORDER BY '
      '  Datum')
    Left = 160
    Top = 520
    ParamData = <
      item
        Name = 'PDAT'
        ParamType = ptInput
      end>
    object FDQuReportID: TIntegerField
      FieldName = 'ID'
      Origin = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object FDQuReportDatum: TDateTimeField
      FieldName = 'Datum'
      Origin = 'Datum'
      Required = True
    end
    object FDQuReportAnzahl200: TIntegerField
      FieldName = 'Anzahl200'
      Origin = 'Anzahl200'
    end
    object FDQuReportAnzahl100: TIntegerField
      FieldName = 'Anzahl100'
      Origin = 'Anzahl100'
    end
    object FDQuReportAnzahl50: TIntegerField
      FieldName = 'Anzahl50'
      Origin = 'Anzahl50'
    end
    object FDQuReportAnzahl20: TIntegerField
      FieldName = 'Anzahl20'
      Origin = 'Anzahl20'
    end
    object FDQuReportAnzahl10: TIntegerField
      FieldName = 'Anzahl10'
      Origin = 'Anzahl10'
    end
    object FDQuReportAnzahl5: TIntegerField
      FieldName = 'Anzahl5'
      Origin = 'Anzahl5'
    end
    object FDQuReportAnzahl2: TIntegerField
      FieldName = 'Anzahl2'
      Origin = 'Anzahl2'
    end
    object FDQuReportAnzahl1: TIntegerField
      FieldName = 'Anzahl1'
      Origin = 'Anzahl1'
    end
    object FDQuReportAnzahl050: TIntegerField
      FieldName = 'Anzahl050'
      Origin = 'Anzahl050'
    end
    object FDQuReportAnzahl020: TIntegerField
      FieldName = 'Anzahl020'
      Origin = 'Anzahl020'
    end
    object FDQuReportAnzahl010: TIntegerField
      FieldName = 'Anzahl010'
      Origin = 'Anzahl010'
    end
    object FDQuReportAnzahl005: TIntegerField
      FieldName = 'Anzahl005'
      Origin = 'Anzahl005'
    end
    object FDQuReportAnzahl002: TIntegerField
      FieldName = 'Anzahl002'
      Origin = 'Anzahl002'
    end
    object FDQuReportAnzahl001: TIntegerField
      FieldName = 'Anzahl001'
      Origin = 'Anzahl001'
    end
    object FDQuReportKassenstand: TFloatField
      FieldName = 'Kassenstand'
      Origin = 'Kassenstand'
      Required = True
      DisplayFormat = '#,##0.00'
    end
    object FDQuReportBetrag200: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'Betrag200'
      Origin = 'Betrag200'
      ProviderFlags = []
      ReadOnly = True
    end
    object FDQuReportBetrag100: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'Betrag100'
      Origin = 'Betrag100'
      ProviderFlags = []
      ReadOnly = True
    end
    object FDQuReportBetrag50: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'Betrag50'
      Origin = 'Betrag50'
      ProviderFlags = []
      ReadOnly = True
    end
    object FDQuReportBetrag20: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'Betrag20'
      Origin = 'Betrag20'
      ProviderFlags = []
      ReadOnly = True
    end
    object FDQuReportBetrag10: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'Betrag10'
      Origin = 'Betrag10'
      ProviderFlags = []
      ReadOnly = True
    end
    object FDQuReportBetrag5: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'Betrag5'
      Origin = 'Betrag5'
      ProviderFlags = []
      ReadOnly = True
    end
    object FDQuReportBetrag2: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'Betrag2'
      Origin = 'Betrag2'
      ProviderFlags = []
      ReadOnly = True
    end
    object FDQuReportBetrag1: TIntegerField
      FieldName = 'Betrag1'
      Origin = 'Anzahl1'
      ProviderFlags = []
    end
    object FDQuReportBetrag050: TFloatField
      AutoGenerateValue = arDefault
      FieldName = 'Betrag050'
      Origin = 'Betrag050'
      ProviderFlags = []
      ReadOnly = True
      DisplayFormat = '#,##0.00'
    end
    object FDQuReportBetrag020: TFloatField
      AutoGenerateValue = arDefault
      FieldName = 'Betrag020'
      Origin = 'Betrag020'
      ProviderFlags = []
      ReadOnly = True
      DisplayFormat = '#,##0.00'
    end
    object FDQuReportBetrag010: TFloatField
      AutoGenerateValue = arDefault
      FieldName = 'Betrag010'
      Origin = 'Betrag010'
      ProviderFlags = []
      ReadOnly = True
      DisplayFormat = '#,##0.00'
    end
    object FDQuReportBetrag005: TFloatField
      AutoGenerateValue = arDefault
      FieldName = 'Betrag005'
      Origin = 'Betrag005'
      ProviderFlags = []
      ReadOnly = True
      DisplayFormat = '#,##0.00'
    end
    object FDQuReportBetrag002: TFloatField
      AutoGenerateValue = arDefault
      FieldName = 'Betrag002'
      Origin = 'Betrag002'
      ProviderFlags = []
      ReadOnly = True
      DisplayFormat = '#,##0.00'
    end
    object FDQuReportBetrag001: TFloatField
      AutoGenerateValue = arDefault
      FieldName = 'Betrag001'
      Origin = 'Betrag001'
      ProviderFlags = []
      ReadOnly = True
      DisplayFormat = '#,##0.00'
    end
  end
  object frxDBDataset: TfrxDBDataset
    UserName = 'frxDBDataset'
    CloseDataSource = True
    DataSet = FDQuReport
    BCDToCurrency = False
    Left = 72
    Top = 520
  end
  object FDGUIxErrorDialog: TFDGUIxErrorDialog
    Provider = 'Forms'
    Left = 80
    Top = 320
  end
  object frxPDFExport: TfrxPDFExport
    FileName = 'C:\RADStudio\Bargeldrechner\Bericht.pdf'
    UseFileCache = True
    ShowProgress = True
    OverwritePrompt = False
    CreationTime = 44199.691993472220000000
    DataOnly = False
    InteractiveFormsFontSubset = 'A-Z,a-z,0-9,#43-#47 '
    OpenAfterExport = True
    PrintOptimized = False
    Outline = False
    Background = False
    HTMLTags = True
    Quality = 95
    Transparency = False
    Author = 'FastReport'
    Subject = 'FastReport PDF export'
    ProtectionFlags = [ePrint, eModify, eCopy, eAnnot]
    HideToolbar = False
    HideMenubar = False
    HideWindowUI = False
    FitWindow = False
    CenterWindow = False
    PrintScaling = False
    PdfA = False
    PDFStandard = psNone
    PDFVersion = pv17
    Left = 304
    Top = 520
  end
  object frxXLSXExport: TfrxXLSXExport
    FileName = 'C:\RADStudio\Bargeldrechner\Bericht.xlsx'
    UseFileCache = True
    ShowProgress = True
    OverwritePrompt = False
    CreationTime = 44199.692495787040000000
    DataOnly = False
    ChunkSize = 0
    OpenAfterExport = True
    PictureType = gpPNG
    Left = 392
    Top = 520
  end
  object frxDOCXExport: TfrxDOCXExport
    FileName = 'C:\RADStudio\Bargeldrechner\Bericht.docx'
    UseFileCache = True
    ShowProgress = True
    OverwritePrompt = False
    CreationTime = 44199.692104363430000000
    DataOnly = False
    OpenAfterExport = True
    PictureType = gpPNG
    Left = 480
    Top = 520
  end
  object frxHTML5DivExport: TfrxHTML5DivExport
    UseFileCache = True
    ShowProgress = True
    OverwritePrompt = False
    DataOnly = False
    OpenAfterExport = False
    MultiPage = False
    Formatted = False
    PictureFormat = pfPNG
    UnifiedPictures = True
    Navigation = True
    EmbeddedPictures = True
    EmbeddedCSS = True
    Outline = False
    HTML5 = True
    AllPictures = False
    ExportAnchors = True
    PictureTag = 0
    Left = 680
    Top = 520
  end
  object frxSimpleTextExport: TfrxSimpleTextExport
    UseFileCache = True
    ShowProgress = True
    OverwritePrompt = False
    DataOnly = False
    Frames = False
    EmptyLines = False
    OEMCodepage = False
    UTF8 = False
    OpenAfterExport = False
    DeleteEmptyColumns = True
    Left = 576
    Top = 520
  end
  object dsLetzterKassSta: TDataSource
    DataSet = FDQuLetzterKassSta
    Left = 328
    Top = 120
  end
  object FDQuLetzterKassSta: TFDQuery
    MasterSource = DsStueckelung
    Connection = FDConnection
    SQL.Strings = (
      'SELECT'
      '  Datum as "Datum::DATETIME",'
      '  (SELECT '
      '       Kassenstand'
      '     FROM'
      '       Stueckelung  '
      '     WHERE '
      
        '       Datum <= date( S.Datum, '#39'start of month'#39', '#39'+1 month'#39', '#39'-1' +
        ' day'#39' )  '
      '     ORDER BY '
      '       Datum '
      '       DESC'
      '    ) as LetzterKassenstand'
      'FROM'
      '  Stueckelung S '
      'WHERE'
      '  strftime('#39'%Y-%m'#39', Datum) < :pDatum'
      'ORDER BY '
      '  Datum '
      '  DESC'
      'LIMIT 1')
    Left = 232
    Top = 120
    ParamData = <
      item
        Name = 'PDATUM'
        DataType = ftString
        ParamType = ptInput
      end>
    object FDQuLetzterKassStaDatum: TDateTimeField
      FieldName = 'Datum'
      Required = True
    end
    object FDQuLetzterKassStaLetzterKassenstand: TFloatField
      FieldName = 'LetzterKassenstand'
      Required = True
      DisplayFormat = '#,##0.00'
    end
  end
end
