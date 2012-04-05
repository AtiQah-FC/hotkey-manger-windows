object frmMain: TfrmMain
  Left = 0
  Top = 0
  Caption = 'TSP'
  ClientHeight = 396
  ClientWidth = 422
  Color = clBtnFace
  Constraints.MinHeight = 442
  Constraints.MinWidth = 430
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Menu = MainMenu1
  OldCreateOrder = False
  Position = poDesktopCenter
  ShowHint = True
  OnActivate = FormActivate
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 422
    Height = 396
    Align = alClient
    BevelInner = bvLowered
    BevelKind = bkSoft
    BevelOuter = bvNone
    BevelWidth = 3
    TabOrder = 0
    DesignSize = (
      418
      392)
    object Label1: TLabel
      Left = 8
      Top = 12
      Width = 89
      Height = 14
      Caption = 'Select a macro'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object TreeView1: TTreeView
      Left = 3
      Top = 35
      Width = 239
      Height = 270
      Anchors = [akLeft, akTop, akRight, akBottom]
      Images = frmnewmacro.ImageList1
      Indent = 19
      ReadOnly = True
      TabOrder = 0
      OnGetImageIndex = TreeView1GetImageIndex
      OnMouseDown = TreeView1MouseDown
    end
    object GroupBox1: TGroupBox
      Left = 248
      Top = 35
      Width = 161
      Height = 236
      Anchors = [akTop, akRight, akBottom]
      Caption = 'Select a macro'
      TabOrder = 1
      object Label2: TLabel
        Left = 16
        Top = 16
        Width = 37
        Height = 13
        Caption = 'Hot key'
      end
      object Label3: TLabel
        Left = 16
        Top = 62
        Width = 34
        Height = 13
        Caption = 'Action:'
      end
      object bt_edit: TButton
        Left = 40
        Top = 143
        Width = 89
        Height = 25
        Hint = 'Use "Edit" button to modify the highlighted macro'
        Caption = 'Edit'
        Default = True
        TabOrder = 0
        OnClick = bt_editClick
      end
      object bt_del: TButton
        Left = 40
        Top = 174
        Width = 89
        Height = 25
        Hint = 'Use "Delete" button to delete the highlighted macro'
        Caption = 'Delete'
        Default = True
        TabOrder = 1
        OnClick = bt_delClick
      end
      object Memo1: TMemo
        Left = 18
        Top = 81
        Width = 140
        Height = 56
        ParentColor = True
        ReadOnly = True
        TabOrder = 2
      end
      object edithotkey: THotKey
        Left = 16
        Top = 35
        Width = 142
        Height = 21
        HotKey = 0
        Modifiers = []
        TabOrder = 3
      end
      object Button1: TButton
        Left = 40
        Top = 205
        Width = 89
        Height = 25
        Hint = 'Use "Delete" button to delete the highlighted macro'
        Caption = 'Reminder'
        Default = True
        TabOrder = 4
      end
    end
    object CheckBox1: TCheckBox
      Left = 8
      Top = 311
      Width = 241
      Height = 17
      Anchors = [akLeft, akBottom]
      Caption = 'Start me automatically on Windows startup'
      TabOrder = 2
      OnClick = CheckBox1Click
    end
    object Memo2: TMemo
      Left = 3
      Top = 334
      Width = 412
      Height = 55
      Align = alBottom
      Color = clInfoBk
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 3
    end
    object bt_newmacro: TButton
      Left = 248
      Top = 277
      Width = 161
      Height = 25
      Hint = 'Use "New Macro" button to create a new macro'
      Anchors = [akRight, akBottom]
      Caption = 'New Macro'
      TabOrder = 4
      OnClick = bt_newmacroClick
    end
  end
  object MediaPlayer1: TMediaPlayer
    Left = 48
    Top = 61
    Width = 253
    Height = 30
    Visible = False
    TabOrder = 1
  end
  object MainMenu1: TMainMenu
    Left = 120
    Top = 8
    object File1: TMenuItem
      Caption = 'File'
      object Importfromfile1: TMenuItem
        Caption = 'Import from file...'
      end
      object Exporttofile1: TMenuItem
        Caption = 'Export to file...'
      end
      object N1: TMenuItem
        Caption = '-'
      end
      object Quit1: TMenuItem
        Caption = 'Quit'
        OnClick = Quit1Click
      end
    end
    object Setting1: TMenuItem
      Caption = 'Settings'
      object Options1: TMenuItem
        Caption = 'HotKey'
      end
      object OptionsforVocabulary1: TMenuItem
        Caption = 'Trainer'
      end
      object Reminder1: TMenuItem
        Caption = 'Reminder'
      end
    end
    object Help1: TMenuItem
      Caption = 'Help'
    end
  end
  object TrayIcon1: TTrayIcon
    Icon.Data = {
      0000010001002020000000000000A80800001600000028000000200000004000
      0000010008000000000080040000000000000000000000010000000000000000
      0000000080000080000000808000800000008000800080800000C0C0C000C0DC
      C000F0CAA600CCFFFF0099FFFF0066FFFF0033FFFF00FFCCFF00CCCCFF0099CC
      FF0066CCFF0033CCFF0000CCFF00FF99FF00CC99FF009999FF006699FF003399
      FF000099FF00FF66FF00CC66FF009966FF006666FF003366FF000066FF00FF33
      FF00CC33FF009933FF006633FF003333FF000033FF00CC00FF009900FF006600
      FF003300FF00FFFFCC00CCFFCC0099FFCC0066FFCC0066FFCC0033FFCC0000FF
      CC00FFCCCC00CCCCCC0099CCCC0066CCCC0033CCCC0000CCCC00FF99CC00CC99
      CC009999CC006699CC003399CC000099CC00FF66CC00CC66CC009966CC006666
      CC003366CC000066CC00FF33CC00CC33CC009933CC006633CC003333CC000033
      CC00FF00CC00CC00CC009900CC006600CC003300CC000000CC00FFFF9900CCFF
      990099FF990066FF990033FF990000FF9900FFCC9900CCCC990099CC990066CC
      990033CC990000CC9900FF999900CC9999009999990066999900339999000099
      9900FF669900CC66990099669900666699003366990000669900FF339900CC33
      990099339900663399003333990000339900FF009900CC009900990099006600
      99003300990000009900FFFF6600CCFF660099FF660066FF660033FF660000FF
      6600FFCC6600CCCC660099CC660066CC660033CC660000CC6600FF996600CC99
      660099996600669966003399660000996600FF666600CC666600996666006666
      66003366660000666600FF336600CC3366009933660066336600333366000033
      6600FF006600CC00660099006600660066003300660000006600FFFF3300CCFF
      330099FF330066FF330033FF330000FF3300FFCC3300CCCC330099CC330066CC
      330033CC330000CC3300FF993300CC9933009999330066993300339933000099
      3300FF663300CC66330099663300666633003366330000663300FF333300CC33
      330099333300663333003333330000333300FF003300CC003300990033006600
      33003300330000003300CCFF000099FF000066FF000033FF0000FFCC0000CCCC
      000099CC000066CC000033CC000000CC0000FF990000CC990000999900006699
      00003399000000990000FF660000CC6600009966000066660000006600003366
      0000FF330000CC33000099330000663300003333000000330000CC0000009900
      000066000000330000000000DD000000BB000000AA0000008800000077000000
      5500000044000000220000DD000000BB000000AA000000880000007700000055
      00000044000000220000DDDDDD00555555007777770077777700444444002222
      22001111110077000000550000004400000022000000F0FBFF00A4A0A0008080
      80000000FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000B90000000000000000000000
      0000000000000000000000000000000000DDEDEDB30000000000000000000000
      00000000000000000000000000000096DDEDED07F70000000000000000000000
      00000000000000000000B9BABADEDEDDDDED0707F7F78888B9B9B9B9B9000000
      0000000000000000000096DDDD72DD4EDDED0700B3ED00EDED07ED07ED000000
      0000000000000000B3B3DD72DDDDF9F9F9ED07EDEDEDED00ED00B30000000000
      000000000000B3B3ECDDDDDDF9F9F9F9F9ED0707F7DDDDED0707B300ED000000
      0000000000B3EC88EDDD4EF9F9F9F9F91DDDED07F7DDF9073207F7ED00000000
      B900BAE08FED5D5D5DDDF9F9F924241D24DCDE6B5DED6B0707F7EC88B90000B9
      9696DDDD6BF7F7F7F7DDF91D1D161D72DD0000ED0732EDED0700EF00000000BA
      DDDDDDF940F7F7F7F7ED471624DDDDBA0096DDED07070700EDEDB900000000DE
      DDF9F9F947F7F7073207DDDDDD0000BADDDDDDED070000EDED000000000000DD
      F9F9F9F96BF707320732DD00009696DDDDF9F9ED88EDEDED00000000000000DB
      F9F92424240732070707EF96DE4E4EF9F9F9F9ED0707F7ED00000000000000DF
      F91D16244EED0707323264DDF9F9F9F9F9F9F9DDF7EDED000000000000000095
      F91DF9DD00DD0732070764DDF9F9F9F91D1D16F96BED00000000000000000000
      00DD000096DD07070732F7DDF9F9F91D1723F9DD000000000000000000000000
      00009696DDDDED07F6F6EBEDF9F91C1DDDDD00000000000000000000000000B9
      9696DDDD4EF9F907F6F6320707F9EDE0000000000000000000000000000000B9
      DD4EF9F9F9F9F9244040F7F7EFB3B90000000000000000000000000000000095
      F9F9F9F9F91E1C17F9DDE0000000000000000000000000000000000000000000
      00F9F9F91D16F9DD000000000000000000000000000000000000000000000000
      00E2F91C47DD0000000000000000000000000000000000000000000000000000
      0000F5E200000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE1FFFFFF81FFFFFE00FFFFF0
      0001FFC00001FF000001FC000001F0000003C000000180000007800000070000
      000F0000001F0000001F8000003F8000007FC00000FFC00003FF80000FFF8000
      7FFF8003FFFFC00FFFFFE03FFFFFF0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
    PopupMenu = PopupMenu1
    Visible = True
    OnClick = TrayIcon1Click
    OnMouseMove = TrayIcon1MouseMove
    OnMouseDown = TrayIcon1MouseDown
    Left = 200
    Top = 192
  end
  object PopupMenu1: TPopupMenu
    Left = 104
    Top = 192
    object Show1: TMenuItem
      Caption = 'Show'
      OnClick = Show1Click
    end
    object Options2: TMenuItem
      Caption = 'Options'
      object Hotkey1: TMenuItem
        Caption = 'Hot key'
      end
      object rianer1: TMenuItem
        Caption = 'Trainer'
      end
      object Reminder2: TMenuItem
        Caption = 'Reminder'
      end
    end
    object N2: TMenuItem
      Caption = '-'
    end
    object Exit1: TMenuItem
      Caption = 'Exit'
      OnClick = Exit1Click
    end
  end
  object Timer_alarm: TTimer
    Enabled = False
    OnTimer = Timer_alarmTimer
    Left = 104
    Top = 240
  end
end
