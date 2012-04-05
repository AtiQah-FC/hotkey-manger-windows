object frmReminder: TfrmReminder
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'Reminder'
  ClientHeight = 246
  ClientWidth = 425
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsStayOnTop
  OldCreateOrder = False
  Position = poDesktopCenter
  OnCreate = FormCreate
  OnPaint = FormPaint
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 425
    Height = 246
    Align = alClient
    TabOrder = 0
    object BitBtn1: TBitBtn
      Left = 48
      Top = 208
      Width = 81
      Height = 24
      Caption = 'Continue'
      TabOrder = 0
      OnClick = BitBtn1Click
      Kind = bkOK
    end
    object BitBtn2: TBitBtn
      Left = 288
      Top = 208
      Width = 73
      Height = 24
      Caption = 'Close'
      TabOrder = 1
      OnClick = BitBtn2Click
      Kind = bkCancel
    end
    object DateTimePicker2: TDateTimePicker
      Left = 8
      Top = 143
      Width = 186
      Height = 21
      Date = 39307.910177766210000000
      Time = 39307.910177766210000000
      DateFormat = dfLong
      TabOrder = 2
    end
  end
  object DateTimePicker1: TDateTimePicker
    Left = 200
    Top = 143
    Width = 89
    Height = 21
    Date = 39307.910177766210000000
    Time = 39307.910177766210000000
    DateFormat = dfLong
    Kind = dtkTime
    TabOrder = 1
  end
  object Memo1: TMemo
    Left = 0
    Top = 0
    Width = 426
    Height = 137
    ReadOnly = True
    TabOrder = 2
  end
  object BitBtn3: TBitBtn
    Left = 392
    Top = 143
    Width = 25
    Height = 25
    TabOrder = 3
    OnMouseDown = BitBtn3MouseDown
    Glyph.Data = {
      B6050000424DB605000000000000360000002800000015000000160000000100
      1800000000008005000000000000000000000000000000000000808080808080
      8080808080808080808080808080808080808080808080808080808080808080
      80808080808080808080808080808080808080808080FFFFFF00C8D0D4C8D0D4
      C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0
      D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4FFFFFF00C8D0D4C8D0D4
      C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0
      D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4FFFFFF00C8D0D4C8D0D4
      C8D0D4000000000000C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0
      D4C8D0D4C8D0D4000000000000C8D0D4C8D0D4C8D0D4FFFFFF00C8D0D4C8D0D4
      C8D0D4000000000000000000C8D0D48080808080800000000000000000000000
      00C8D0D4000000000000000000C8D0D4C8D0D4C8D0D4FFFFFF00C8D0D4C8D0D4
      C8D0D4C8D0D4000000808080808080FFFFFFFFFFFF0000FF0000FF8080808080
      80000000000000000000C8D0D4C8D0D4C8D0D4C8D0D4FFFFFF00C8D0D4C8D0D4
      C8D0D4C8D0D4808080FFFFFFFFFFFFC0C0C0C0C0C00000FF0000FFC0C0C0C0C0
      C0808080808080000000C8D0D4C8D0D4C8D0D4C8D0D4FFFFFF00C8D0D4C8D0D4
      C8D0D4808080FFFFFFC0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
      C0C0C0C0C0C0C0808080000000C8D0D4C8D0D4C8D0D4FFFFFF00C8D0D4C8D0D4
      C8D0D4808080FFFFFFC0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
      C0C0C0C0C0C0C0808080000000C8D0D4C8D0D4C8D0D4FFFFFF00C8D0D4C8D0D4
      808080000080C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0808080C0C0C0C0C0C0C0C0
      C0808080C0C0C0C0C0C0808080000000C8D0D4C8D0D4FFFFFF00C8D0D4C8D0D4
      8080800000FF0000FFC0C0C0C0C0C0C0C0C08080800000000000000000000000
      000000008080800000FF0000FF000000C8D0D4C8D0D4FFFFFF00C8D0D4C8D0D4
      8080800000FF0000FFC0C0C0C0C0C0C0C0C0C0C0C0000000C0C0C0C0C0C0C0C0
      C0808080C0C0C00000FF0000FF000000C8D0D4C8D0D4FFFFFF00C8D0D4C8D0D4
      808080000080C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0000000C0C0C0C0C0C0C0C0
      C0C0C0C0C0C0C0C0C0C0808080000000C8D0D4C8D0D4FFFFFF00C8D0D4C8D0D4
      C8D0D4808080FFFFFFC0C0C0C0C0C0C0C0C0808080000000808080C0C0C0C0C0
      C0C0C0C0C0C0C0808080000000C8D0D4C8D0D4C8D0D4FFFFFF00C8D0D4C8D0D4
      C8D0D4808080FFFFFFC0C0C0C0C0C0C0C0C0C0C0C0808080C0C0C0C0C0C0C0C0
      C0C0C0C0C0C0C0808080000000C8D0D4C8D0D4C8D0D4FFFFFF00C8D0D4C8D0D4
      C8D0D4C8D0D4808080FFFFFFFFFFFFC0C0C0C0C0C00000FF0000FFC0C0C0C0C0
      C0FFFFFFFFFFFF000000C8D0D4C8D0D4C8D0D4C8D0D4FFFFFF00C8D0D4C8D0D4
      C8D0D4C8D0D4C8D0D4808080808080FFFFFFFFFFFF0000FF0000FFFFFFFFFFFF
      FF808080808080C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4FFFFFF00C8D0D4C8D0D4
      C8D0D4C8D0D4C8D0D4C8D0D4C8D0D48080800000000000000000000000008080
      80C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4FFFFFF00C8D0D4C8D0D4
      C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4000000000000000000000000C8D0
      D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4FFFFFF00C8D0D4C8D0D4
      C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0
      D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4FFFFFF00C8D0D4C8D0D4
      C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0
      D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4FFFFFF00C8D0D4C8D0D4
      C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0
      D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4FFFFFF00}
  end
  object MonthCalendar1: TMonthCalendar
    Left = 19
    Top = -17
    Width = 191
    Height = 154
    Date = 39307.048374375000000000
    TabOrder = 4
    Visible = False
  end
  object Button1: TButton
    Left = 168
    Top = 207
    Width = 89
    Height = 25
    Caption = 'Delete Macro'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clRed
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 5
  end
  object Timer1: TTimer
    OnTimer = Timer1Timer
    Left = 8
    Top = 216
  end
  object PopupMenu1: TPopupMenu
    TrackButton = tbLeftButton
    Left = 392
    Top = 216
    object N1minutelate1: TMenuItem
      Caption = '1 minute late'
      OnClick = N1minutelate1Click
    end
    object N2minuteslater1: TMenuItem
      Caption = '2 minutes later'
      OnClick = N1minutelate1Click
    end
    object N5minuteslater1: TMenuItem
      Caption = '5 minutes later'
      OnClick = N1minutelate1Click
    end
    object N10minuteslater1: TMenuItem
      Caption = '10 minutes later'
      OnClick = N1minutelate1Click
    end
    object N15minuteslater1: TMenuItem
      Caption = '15 minutes later'
      OnClick = N1minutelate1Click
    end
    object N30minuteslater1: TMenuItem
      Caption = '30 minutes later'
      OnClick = N1minutelate1Click
    end
    object N45minuteslater1: TMenuItem
      Caption = '45 minutes later'
      OnClick = N1minutelate1Click
    end
    object N1hour1: TMenuItem
      Caption = '1 hour later'
      OnClick = N1minutelate1Click
    end
    object N2hours1: TMenuItem
      Caption = '2 hours later'
      OnClick = N1minutelate1Click
    end
    object N3hours1: TMenuItem
      Caption = '3 hours later'
      OnClick = N1minutelate1Click
    end
    object N6hours1: TMenuItem
      Caption = '6 hours later'
      OnClick = N1minutelate1Click
    end
    object N7hours1: TMenuItem
      Caption = '7 hours later'
      OnClick = N1minutelate1Click
    end
    object N1: TMenuItem
      Caption = '-'
    end
    object Custom1: TMenuItem
      Caption = 'Custom time ...'
    end
  end
end
