unit Ureminder;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, ComCtrls, StdCtrls, Buttons, Menus, TeCanvas, TeePenDlg,
  Grids, Calendar, MPlayer;

type
  TfrmReminder = class(TForm)
    Panel1: TPanel;
    Timer1: TTimer;
    DateTimePicker1: TDateTimePicker;
    Memo1: TMemo;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
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
    BitBtn3: TBitBtn;
    MonthCalendar1: TMonthCalendar;
    DateTimePicker2: TDateTimePicker;
    Button1: TButton;

    procedure FormPaint(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn3MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure FormCreate(Sender: TObject);
    procedure N1minutelate1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    sum_time:integer;
    procedure Selected(sender:TObject);
  end;

var
  frmReminder: TfrmReminder;

implementation

uses Unewmacro;

{$R *.dfm}

procedure TfrmReminder.BitBtn1Click(Sender: TObject);
begin
  ModalResult:=mrOk;
end;

procedure TfrmReminder.BitBtn2Click(Sender: TObject);
begin
  ModalResult:=mrCancel;
end;

procedure TfrmReminder.BitBtn3MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
var
  p:TPoint;
begin
      if Button=mbleft then
      begin
        GetCursorPos(p);
        popupmenu1.Popup(P.x,P.y);
      end;

end;

procedure TfrmReminder.FormCreate(Sender: TObject);
begin
  DateTimePicker1.Date:=MonthCalendar1.Date;
end;

procedure TfrmReminder.FormPaint(Sender: TObject);
begin
    Application.RestoreTopMosts;
end;

procedure TfrmReminder.N1minutelate1Click(Sender: TObject);
begin
  Selected(sender);
end;

procedure TfrmReminder.Selected(sender: TObject);
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

procedure TfrmReminder.Timer1Timer(Sender: TObject);
var
  DateTime:TDateTime;
begin
 frmReminder.Caption:='Reminder '+DateTostr(MonthCalendar1.Date)+' '+TimeToStr(Now());
end;

end.
