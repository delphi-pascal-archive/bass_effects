object Form1: TForm1
  Left = 216
  Top = 133
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'BASS effects'
  ClientHeight = 458
  ClientWidth = 665
  Color = clScrollBar
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -14
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  Icon.Data = {
    0000010001002020040000000000E80200001600000028000000200000004000
    0000010004000000000000020000000000000000000000000000000000000000
    000000008000008000000080800080000000800080008080000080808000C0C0
    C0000000FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00CCC0
    000CCCC0000000000CCCC8888CCCCCCC0000CCCC00000000CCCC8888CCCCCCCC
    C0000CCCCCCCCCCCCCC8888CCCCC0CCCCC0000CCCCCCCCCCCC8888CCCCC800CC
    C00CCCC0000000000CCCC88CCC88000C0000CCCC00000000CCCC8888C8880000
    00000CCCC000000CCCC888888888C000C00000CCCC0000CCCC88888C888CCC00
    CC00000CCCCCCCCCC88888CC88CCCCC0CCC000CCCCC00CCCCC888CCC8CCCCCCC
    CCCC0CCCCCCCCCCCCCC8CCCCCCCCCCCC0CCCCCCCCCCCCCCCCCCCCCC8CCC80CCC
    00CCCCCCCC0CC0CCCCCCCC88CC8800CC000CCCCCC000000CCCCCC888CC8800CC
    0000CCCC00000000CCCC8888CC8800CC0000C0CCC000000CCC8C8888CC8800CC
    0000C0CCC000000CCC8C8888CC8800CC0000CCCC00000000CCCC8888CC8800CC
    000CCCCCC000000CCCCCC888CC8800CC00CCCCCCCC0CC0CCCCCCCC88CC880CCC
    0CCCCCCCCCCCCCCCCCCCCCC8CCC8CCCCCCCC0CCCCCCCCCCCCCC8CCCCCCCCCCC0
    CCC000CCCCC00CCCCC888CCC8CCCCC00CC00000CCCCCCCCCC88888CC88CCC000
    C00000CCCC0000CCCC88888C888C000000000CCCC000000CCCC888888888000C
    0000CCCC00000000CCCC8888C88800CCC00CCCC0000000000CCCC88CCC880CCC
    CC0000CCCCCCCCCCCC8888CCCCC8CCCCC0000CCCCCCCCCCCCCC8888CCCCCCCCC
    0000CCCC00000000CCCC8888CCCCCCC0000CCCC0000000000CCCC8888CCC0000
    0000000000000000000000000000000000000000000000000000000000000000
    0000000000000000000000000000000000000000000000000000000000000000
    0000000000000000000000000000000000000000000000000000000000000000
    000000000000000000000000000000000000000000000000000000000000}
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 120
  TextHeight = 16
  object Bevel1: TBevel
    Left = 200
    Top = 32
    Width = 57
    Height = 25
  end
  object Label1: TLabel
    Left = 200
    Top = 10
    Width = 50
    Height = 16
    Caption = 'Latency:'
  end
  object Label2: TLabel
    Left = 225
    Top = 36
    Width = 7
    Height = 16
    Alignment = taCenter
    Caption = '0'
  end
  object Label3: TLabel
    Left = 8
    Top = 10
    Width = 86
    Height = 16
    Caption = 'Sound source:'
  end
  object Label4: TLabel
    Left = 8
    Top = 69
    Width = 148
    Height = 16
    Caption = 'Sound level of aquisition:'
  end
  object ComboBox1: TComboBox
    Left = 8
    Top = 32
    Width = 177
    Height = 24
    Style = csDropDownList
    ItemHeight = 16
    TabOrder = 0
    OnChange = ComboBox1Change
  end
  object TrackBar1: TTrackBar
    Left = 8
    Top = 89
    Width = 177
    Height = 21
    Max = 100
    TabOrder = 1
    ThumbLength = 10
    TickMarks = tmBoth
    TickStyle = tsNone
    OnChange = TrackBar1Change
  end
  object Panel1: TPanel
    Left = 8
    Top = 112
    Width = 649
    Height = 337
    TabOrder = 2
    object LTypeFlanger: TLabel
      Left = 502
      Top = 138
      Width = 85
      Height = 16
      Caption = 'LTypeFlanger'
    end
    object Label5: TLabel
      Left = 450
      Top = 59
      Width = 149
      Height = 16
      Caption = 'Banque pre-enregistrees'
    end
    object Label6: TLabel
      Left = 459
      Top = 138
      Width = 35
      Height = 16
      Caption = 'Nom :'
    end
    object Bevel2: TBevel
      Left = 453
      Top = 128
      Width = 188
      Height = 41
    end
    object Label8: TLabel
      Left = 79
      Top = 55
      Width = 35
      Height = 16
      Caption = 'R      L'
    end
    object Reverb: TCheckBox
      Left = 167
      Top = 20
      Width = 80
      Height = 21
      Caption = 'Reverb'
      TabOrder = 0
      OnClick = ReverbClick
    end
    object Chorus: TCheckBox
      Left = 89
      Top = 20
      Width = 72
      Height = 21
      Caption = 'Chorus'
      TabOrder = 1
      OnClick = ChorusClick
    end
    object Flanger: TCheckBox
      Left = 256
      Top = 20
      Width = 80
      Height = 21
      Caption = 'Flanger'
      TabOrder = 2
      OnClick = FlangerClick
    end
    object Gargle: TCheckBox
      Left = 10
      Top = 20
      Width = 80
      Height = 21
      Caption = 'Gargle'
      TabOrder = 3
      OnClick = GargleClick
    end
    object FlangerSon1: TPanel
      Left = 256
      Top = 49
      Width = 188
      Height = 189
      BevelOuter = bvLowered
      BevelWidth = 5
      Color = clSilver
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -15
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      ParentFont = False
      TabOrder = 4
      object Label14: TLabel
        Left = 20
        Top = 10
        Width = 52
        Height = 20
        Caption = 'Flanger'
      end
      object FFRS1: TLabel
        Left = 102
        Top = 160
        Width = 9
        Height = 20
        Caption = '0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -15
        Font.Name = 'Comic Sans MS'
        Font.Style = []
        ParentFont = False
      end
      object FFS1: TLabel
        Left = 74
        Top = 160
        Width = 9
        Height = 20
        Caption = '0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -15
        Font.Name = 'Comic Sans MS'
        Font.Style = []
        ParentFont = False
      end
      object FDS1: TLabel
        Left = 42
        Top = 160
        Width = 18
        Height = 20
        Caption = '25'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -15
        Font.Name = 'Comic Sans MS'
        Font.Style = []
        ParentFont = False
      end
      object FWS1: TLabel
        Left = 9
        Top = 160
        Width = 9
        Height = 20
        Caption = '0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -15
        Font.Name = 'Comic Sans MS'
        Font.Style = []
        ParentFont = False
      end
      object FDeS1: TLabel
        Left = 132
        Top = 160
        Width = 9
        Height = 20
        Caption = '0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -15
        Font.Name = 'Comic Sans MS'
        Font.Style = []
        ParentFont = False
      end
      object FWetS1: TTrackBar
        Left = 7
        Top = 31
        Width = 41
        Height = 123
        Max = 99
        Orientation = trVertical
        TabOrder = 0
        ThumbLength = 15
        TickMarks = tmBoth
        TickStyle = tsNone
        OnChange = FWetS1Change
      end
      object FDeptS1: TTrackBar
        Left = 37
        Top = 31
        Width = 41
        Height = 123
        Max = 99
        Orientation = trVertical
        Position = 25
        TabOrder = 1
        ThumbLength = 15
        TickMarks = tmBoth
        TickStyle = tsNone
        OnChange = FDeptS1Change
      end
      object FFeedS1: TTrackBar
        Left = 66
        Top = 31
        Width = 44
        Height = 123
        Max = 99
        Min = -99
        Orientation = trVertical
        TabOrder = 2
        ThumbLength = 15
        TickMarks = tmBoth
        TickStyle = tsNone
        OnChange = FFeedS1Change
      end
      object FFreqS1: TTrackBar
        Left = 96
        Top = 31
        Width = 41
        Height = 123
        Orientation = trVertical
        TabOrder = 3
        ThumbLength = 15
        TickMarks = tmBoth
        TickStyle = tsNone
        OnChange = FFreqS1Change
      end
      object FDelayS1: TTrackBar
        Left = 126
        Top = 31
        Width = 40
        Height = 123
        Max = 4
        Orientation = trVertical
        TabOrder = 4
        ThumbLength = 15
        TickMarks = tmBoth
        TickStyle = tsNone
        OnChange = FDelayS1Change
      end
    end
    object TTabFlanger: TTrackBar
      Left = 447
      Top = 79
      Width = 194
      Height = 21
      TabOrder = 5
      ThumbLength = 11
      OnChange = TTabFlangerChange
    end
    object Echo: TCheckBox
      Left = 10
      Top = 79
      Width = 60
      Height = 21
      Caption = 'Echo'
      TabOrder = 6
      OnClick = EchoClick
    end
    object Disto: TCheckBox
      Left = 148
      Top = 177
      Width = 60
      Height = 21
      Caption = 'Disto'
      TabOrder = 7
      OnClick = DistoClick
    end
    object Compressor: TCheckBox
      Left = 10
      Top = 128
      Width = 100
      Height = 21
      Caption = 'Compressor'
      TabOrder = 8
      OnClick = CompressorClick
    end
    object Reverb2: TCheckBox
      Left = 10
      Top = 177
      Width = 119
      Height = 21
      Caption = 'Reverb Meileur'
      TabOrder = 9
      OnClick = Reverb2Click
    end
    object Panel2: TPanel
      Left = 0
      Top = 207
      Width = 257
      Height = 119
      BevelWidth = 5
      Caption = 'Panel2'
      Color = clActiveCaption
      TabOrder = 10
      Visible = False
      object Label7: TLabel
        Left = 20
        Top = 10
        Width = 45
        Height = 16
        Caption = 'Reverb'
      end
      object TReverb9: TTrackBar
        Left = 167
        Top = 30
        Width = 21
        Height = 80
        Max = 100
        Orientation = trVertical
        Frequency = 100
        Position = 1
        TabOrder = 0
        ThumbLength = 10
        TickMarks = tmBoth
      end
      object TReverb8: TTrackBar
        Left = 148
        Top = 30
        Width = 21
        Height = 80
        Max = 2000
        Min = -10000
        Orientation = trVertical
        Frequency = 100
        Position = 200
        TabOrder = 1
        ThumbLength = 10
        TickMarks = tmBoth
      end
      object TReverb7: TTrackBar
        Left = 128
        Top = 30
        Width = 21
        Height = 80
        Max = 30
        Orientation = trVertical
        Frequency = 100
        Position = 3
        TabOrder = 2
        ThumbLength = 10
        TickMarks = tmBoth
      end
      object TReverb6: TTrackBar
        Left = 108
        Top = 30
        Width = 21
        Height = 80
        Max = 1000
        Min = -10000
        Orientation = trVertical
        Frequency = 100
        Position = -2602
        TabOrder = 3
        ThumbLength = 10
        TickMarks = tmBoth
      end
      object TReverb5: TTrackBar
        Left = 89
        Top = 30
        Width = 21
        Height = 80
        Max = 2
        Orientation = trVertical
        Frequency = 100
        TabOrder = 4
        ThumbLength = 10
        TickMarks = tmBoth
      end
      object TReverb4: TTrackBar
        Left = 69
        Top = 30
        Width = 21
        Height = 80
        Max = 20
        Orientation = trVertical
        Frequency = 100
        Position = 1
        TabOrder = 5
        ThumbLength = 10
        TickMarks = tmBoth
      end
      object TReverb3: TTrackBar
        Left = 49
        Top = 30
        Width = 21
        Height = 80
        Orientation = trVertical
        Frequency = 100
        TabOrder = 6
        ThumbLength = 10
        TickMarks = tmBoth
      end
      object TReverb2: TTrackBar
        Left = 30
        Top = 30
        Width = 20
        Height = 80
        Max = 0
        Min = -1000
        Orientation = trVertical
        Frequency = 100
        TabOrder = 7
        ThumbLength = 10
        TickMarks = tmBoth
      end
      object TReverb12: TTrackBar
        Left = 226
        Top = 30
        Width = 21
        Height = 80
        Max = 20000
        Orientation = trVertical
        Frequency = 100
        Position = 5000
        TabOrder = 8
        ThumbLength = 10
        TickMarks = tmBoth
      end
      object TReverb11: TTrackBar
        Left = 207
        Top = 30
        Width = 21
        Height = 80
        Max = 100
        Orientation = trVertical
        Frequency = 100
        Position = 100
        TabOrder = 9
        ThumbLength = 10
        TickMarks = tmBoth
      end
      object TReverb10: TTrackBar
        Left = 187
        Top = 30
        Width = 21
        Height = 80
        Max = 100
        Orientation = trVertical
        Frequency = 100
        Position = 100
        TabOrder = 10
        ThumbLength = 10
        TickMarks = tmBoth
      end
      object TReverb1: TTrackBar
        Left = 10
        Top = 30
        Width = 21
        Height = 80
        Min = -1000
        Orientation = trVertical
        Frequency = 100
        Position = -1000
        TabOrder = 11
        ThumbLength = 10
        TickMarks = tmBoth
      end
    end
    object DelayRight: TTrackBar
      Left = 69
      Top = 69
      Width = 21
      Height = 41
      Max = 1000
      Orientation = trVertical
      Frequency = 200
      Position = 333
      TabOrder = 11
      ThumbLength = 10
      TickMarks = tmBoth
    end
    object DelayLeft: TTrackBar
      Left = 98
      Top = 69
      Width = 21
      Height = 41
      Max = 1000
      Orientation = trVertical
      Frequency = 200
      Position = 333
      TabOrder = 12
      ThumbLength = 10
      TickMarks = tmBoth
    end
    object TCompression: TTrackBar
      Left = 118
      Top = 128
      Width = 110
      Height = 31
      Max = 60
      Min = -60
      Frequency = 10
      TabOrder = 13
      ThumbLength = 10
    end
    object TDisto: TTrackBar
      Left = 148
      Top = 207
      Width = 99
      Height = 18
      Max = 100
      Frequency = 10
      Position = 50
      TabOrder = 14
      ThumbLength = 10
    end
  end
  object Timer1: TTimer
    Enabled = False
    Interval = 250
    OnTimer = Timer1Timer
    Left = 264
    Top = 8
  end
end
