unit Unewmacro;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, Buttons, ImgList,ShellAPI,ShlObj, Menus;

type
  Tfrmnewmacro = class(TForm)
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Button1: TButton;
    Label1: TLabel;
    macro_name: TEdit;
    Label2: TLabel;
    HotKey1: THotKey;
    Label3: TLabel;
    Comb_action: TComboBox;
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    RadioButton3: TRadioButton;
    RadioButton4: TRadioButton;
    ComboBox2: TComboBox;
    lb_cmdline: TLabel;
    ed_cmdline: TEdit;
    OpenDialog1: TOpenDialog;
    ImageList1: TImageList;
    Memo2: TMemo;
    MemoReminder: TMemo;
    chb_sound: TCheckBox;
    bt_cmdline: TBitBtn;
    PopupMenu1: TPopupMenu;
    N1minutelate1: TMenuItem;
    N2minuteslater1: TMenuItem;
    N5minuteslater1: TMenuItem;
    N10minuteslater1: TMenuItem;
    N15minuteslater1: TMenuItem;
    N30minuteslater1: TMenuItem;
    N45minuteslater1: TMenuItem;
    N1hour1: TMenuItem;
    N2hours1: TMenuItem;
    N3hours1: TMenuItem;
    N6hours1: TMenuItem;
    N7hours1: TMenuItem;
    N1: TMenuItem;
    Custom1: TMenuItem;
    OpenDialog2: TOpenDialog;
    procedure Comb_actionChange(Sender: TObject);
    procedure bt_cmdlineClick(Sender: TObject);
    procedure Comb_actionDrawItem(Control: TWinControl; Index: Integer;
      Rect: TRect; State: TOwnerDrawState);
    procedure FormActivate(Sender: TObject);
    procedure bt_cmdlineMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure N1minutelate1Click(Sender: TObject);
    procedure chb_soundClick(Sender: TObject);
  private
    { Private declarations }

  public
    { Public declarations }
    sum_time:integer;
    path_sound:string;
    procedure DisplayHint(Sender:TObject);
    procedure Selected(sender:TObject);
  end;

var
  frmnewmacro: Tfrmnewmacro;

implementation

{$R *.dfm}

procedure Tfrmnewmacro.bt_cmdlineClick(Sender: TObject);
var
  TitleName : string;
  lpItemID : PItemIDList;
  BrowseInfo : TBrowseInfo;
  DisplayName : array[0..MAX_PATH] of char;
  TempPath : array[0..MAX_PATH] of char;
  p:TPoint;
begin
 case comb_action.ItemIndex of
   1:begin
        bt_cmdline.PopupMenu:=nil;
       if not opendialog1.Execute then exit;
      ed_cmdline.Text:=opendialog1.FileName;
     end;
   2:begin
        bt_cmdline.PopupMenu:=nil;
        FillChar(BrowseInfo, sizeof(TBrowseInfo), #0);
        BrowseInfo.hwndOwner := frmnewmacro.Handle;
        BrowseInfo.pszDisplayName := @DisplayName;
        TitleName := 'Please specify a directory';
        BrowseInfo.lpszTitle := PChar(TitleName);
        BrowseInfo.ulFlags := BIF_RETURNONLYFSDIRS;
        lpItemID := SHBrowseForFolder(BrowseInfo);
        if lpItemId <> nil then
        SHGetPathFromIDList(lpItemID, TempPath);
        GlobalFreePtr(lpItemID);
        Ed_cmdline.Text:=TempPath;
//neu muon mo luon folder ra thi dung lenh sau
//      ShellExecute(0,'open',temppath,NIL,NIL,SW_SHOWNORMAL);
      end;
   3:begin
      //
       // bt_cmdline.PopupMenu:=PopupMenu1;
     end;
 end;
end;

procedure Tfrmnewmacro.bt_cmdlineMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var
  p:TPoint;
begin
//
  case comb_action.ItemIndex of
    3:
    begin
      if Button=mbleft then
      begin
        GetCursorPos(p);
        popupmenu1.Popup(P.x,P.y);
      end;
    end;

  end;
end;

procedure Tfrmnewmacro.chb_soundClick(Sender: TObject);
begin
  path_sound:='';
  if chb_sound.Checked then
  begin
    if not opendialog2.Execute then
    begin
      chb_sound.Checked:=false;
      exit;
    end
    else path_sound:=opendialog2.FileName;
  end;
end;

procedure Tfrmnewmacro.Comb_actionChange(Sender: TObject);
begin
  case comb_action.ItemIndex of
  0:
    begin
      lb_cmdline.Visible:=false;
      Memoreminder.Visible:=false;
      chb_sound.Visible:=false;
      ed_cmdline.Visible:=false;
      bt_cmdline.Visible:=false;
    end;
  1..2:
    begin
      Memoreminder.Visible:=false;
      chb_sound.Visible:=false;
      lb_cmdline.Caption:='Command Line';
      lb_cmdline.visible:=true;
      ed_cmdline.Visible:=true;
      bt_cmdline.Caption:='...';
      bt_cmdline.Glyph:=nil;
      frmnewmacro.bt_cmdline.Visible:=true;
    end;
  3:
    begin
      Memoreminder.Visible:=true;
      chb_sound.Visible:=true;
      lb_cmdline.Caption:='Reminder Text';
      lb_cmdline.visible:=true;
      ed_cmdline.Visible:=false;
      bt_cmdline.Caption:='';
      imagelist1.GetBitmap(5,bt_cmdline.Glyph);
      frmnewmacro.bt_cmdline.Visible:=true;
    end;
  end;
end;

procedure Tfrmnewmacro.Comb_actionDrawItem(Control: TWinControl; Index: Integer;
  Rect: TRect; State: TOwnerDrawState);
begin
  (* Заполняем прямоугольник *)
  Comb_action.canvas.fillrect(rect);

  (* Рисуем сам битмап *)
  imagelist1.Draw(Comb_action.Canvas,rect.left,rect.top,Index);

  (* Пишем текст после картинки *)
  Comb_action.canvas.textout(rect.left+imagelist1.width+2,rect.top,
                          Comb_action.items[index]);
end;

procedure Tfrmnewmacro.DisplayHint(Sender: TObject);
begin
  Memo2.Text:=Application.Hint;
end;

procedure Tfrmnewmacro.FormActivate(Sender: TObject);
begin
    Application.OnHint:=DisplayHint;
end;

procedure Tfrmnewmacro.N1minutelate1Click(Sender: TObject);
begin
   Selected(sender);
end;

procedure Tfrmnewmacro.Selected(sender: TObject);
begin
  N7hours1.Checked:=false;
  N6hours1.Checked:=false;
  N5minuteslater1.Checked:=false;
  N45minuteslater1.Checked:=false;
  N3hours1.Checked:=false;
  N30minuteslater1.Checked:=false;
  N2minuteslater1.Checked:=false;
  N2hours1.Checked:=false;
  N1minutelate1.Checked:=false;
  N1hour1.Checked:=false;
  N15minuteslater1.Checked:=false;
  N10minuteslater1.Checked:=false;
  if sender is TMenuITem then
    (sender as TmenuItem).Checked:=true;
  if (sender as TmenuItem).Name='N1minutelate1' then sum_time:=60
  else if (sender as TmenuItem).Name='N2minuteslater1' then sum_time:=120
  else if (sender as TmenuItem).Name='N5minuteslater1' then sum_time:=300
  else if (sender as TmenuItem).Name='N10minuteslater1' then sum_time:=600
  else if (sender as TmenuItem).Name='N15minuteslater1' then sum_time:=900
  else if (sender as TmenuItem).Name='N30minuteslater1' then sum_time:=1800
  else if (sender as TmenuItem).Name='N45minuteslater1' then sum_time:=2700
  else if (sender as TmenuItem).Name='N1hour1' then sum_time:=3600
  else if (sender as TmenuItem).Name='N2hours1' then sum_time:=7200
  else if (sender as TmenuItem).Name='N3hours1' then sum_time:=10800
  else if (sender as TmenuItem).Name='N6hours1' then sum_time:=21600
  else if (sender as TmenuItem).Name='N7hours1' then sum_time:=25200
end;
end.
