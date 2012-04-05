unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, ExtCtrls, StdCtrls, ComCtrls,ShellAPI,Inifiles,Registry,
  MPlayer;

type
  TPMacro=^PMacro;
  PMacro=record
    mcr_name:string;
    mcr_hotkey:word;
    mcr_action:string;
    mcr_path:string;
    mcr_time:TDateTime;
    mcr_numberregister:integer;
    mcr_index:byte;//1 la execute , 2 la open a folder,
    next:TPMacro;
  end;
  TfrmMain = class(TForm)
    Panel1: TPanel;
    MainMenu1: TMainMenu;
    File1: TMenuItem;
    Importfromfile1: TMenuItem;
    Exporttofile1: TMenuItem;
    N1: TMenuItem;
    Quit1: TMenuItem;
    Setting1: TMenuItem;
    Options1: TMenuItem;
    Help1: TMenuItem;
    Label1: TLabel;
    TreeView1: TTreeView;
    GroupBox1: TGroupBox;
    CheckBox1: TCheckBox;
    Label2: TLabel;
    Label3: TLabel;
    bt_edit: TButton;
    bt_del: TButton;
    Memo1: TMemo;
    Memo2: TMemo;
    OptionsforVocabulary1: TMenuItem;
    Reminder1: TMenuItem;
    bt_newmacro: TButton;
    TrayIcon1: TTrayIcon;
    PopupMenu1: TPopupMenu;
    Show1: TMenuItem;
    Exit1: TMenuItem;
    Options2: TMenuItem;
    Hotkey1: TMenuItem;
    rianer1: TMenuItem;
    Reminder2: TMenuItem;
    N2: TMenuItem;
    edithotkey: THotKey;
    Timer_alarm: TTimer;
    Button1: TButton;
    MediaPlayer1: TMediaPlayer;
    procedure Quit1Click(Sender: TObject);
    procedure bt_newmacroClick(Sender: TObject);
    procedure Exit1Click(Sender: TObject);
    procedure TrayIcon1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Show1Click(Sender: TObject);
    procedure bt_editClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure TreeView1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure bt_delClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure edithotkeyChange(Sender: TObject);
    procedure TrayIcon1Click(Sender: TObject);
    procedure TrayIcon1MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure TreeView1GetImageIndex(Sender: TObject; Node: TTreeNode);
    procedure Timer_alarmTimer(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
  protected
     procedure ControlWindow(var Msg: TMessage);
     message WM_SYSCOMMAND;
  private
    { Private declarations }
        procedure WMHotkey(var msg:TMsg);
        message WM_HOTKEY;
        procedure Registershortcut;
        procedure Saveshortcut;
        procedure Loadshortcut;
        procedure DisplayHint(Sender: TObject);
  public
    { Public declarations }
    mcr:TPMacro;
    counter:integer;
  end;
var
  frmMain: TfrmMain;
  head:TPMacro;
  Reg:TRegistry;

implementation

uses Unewmacro, Ureminder;
{$R *.dfm}

(* slower loop...
  for I := 0 to TreeView1.Items.Count - 1 do
  begin
    if TreeView1.Items [I].Text = BaseClass.ClassName then
    begin
      Result := TreeView1.Items [I];
      Exit;
    end;
    Application.ProcessMessages;
  end;*)

procedure TfrmMain.Loadshortcut;
var
  path_file:string;
  inifile:Tinifile;
  rhk:word;
  j:byte;
  ParentNode: TTreeNode;
  I: Integer;
  item:integer;
  macro_type:byte;
begin
  path_file:=extractfilepath(application.ExeName)+'tsp.rmd';
  try
    inifile:=Tinifile.Create(path_file);
    if inifile.ReadString('TITLE','TITLE','')='MyTsp' then
    begin
       j:=1;
       while inifile.ReadString('Link'+inttostr(j),'Name','')<>'' do
       begin
          new(mcr);
          mcr^.mcr_name:=inifile.ReadString('Link'+inttostr(j),'Name','');
          macro_type:=strtoint(inifile.ReadString('Link'+inttostr(j),'Index',''));
          case macro_type of
            1: begin
                  for I := 0 to treeview1.Items.Count - 1 do
                  if treeview1.Items[i].Text='Execute a program' then
                  begin
                      item:=i;
                      break;
                  end;
                  ParentNode:=Treeview1.Items[item];
                  Treeview1.Items.AddChild(ParentNode,mcr^.mcr_name);

            end;
            2: begin
                  for I := 0 to treeview1.Items.Count - 1 do
                  if treeview1.Items[i].Text='Open a folder' then
                  begin
                      item:=i;
                      break;
                  end;
                 ParentNode:=Treeview1.Items[item];
                 Treeview1.Items.AddChild(ParentNode,mcr^.mcr_name);
            end;
            3: Treeview1.Items.AddChild(nil,mcr^.mcr_name)
          end;
          rhk:=strtoint(inifile.ReadString('Link'+inttostr(j),'Hotkey',''));
          mcr^.mcr_hotkey:=rhk;
          mcr^.mcr_action:=inifile.ReadString('Link'+inttostr(j),'Action','');
          mcr^.mcr_path:=inifile.ReadString('Link'+inttostr(j),'Path','');
          mcr^.mcr_numberregister:=strtoint(Inifile.ReadString('Link'+inttostr(j),'NumberRegister',''));
          mcr^.mcr_index:=macro_type;
          mcr^.next:=head;
          head:=mcr;
          inc(j);
       end;
    end;
  finally
    inifile.Free;
  end;
  Registershortcut;
end;
//xoa 
procedure TfrmMain.bt_delClick(Sender: TObject);
var
  mcr1:TPMacro;
  p:TTreeNode;
  I: Integer;
  index:integer;
  Temp:TPMacro;
  found:boolean;
begin
  p:=treeview1.Selected;
  for I := 0 to treeview1.Items.Count - 1 do
  if treeview1.Items[i]=p then
  begin
    index:=i;
    break;
  end;
  new(mcr1);
  mcr1:=head;
  temp:=nil;
  found:=false;
  while (mcr1<>nil) and (not found) do
  begin
    if mcr1^.mcr_name=treeview1.Items[index].Text then
    begin
      found:=true;
      break;
    end
    else
    begin
      temp:=mcr1;
      mcr1:=mcr1^.next;
    end;
  end;
  if found then
  begin
    if temp=nil then head:=mcr1^.next
    else temp^.next:=mcr1^.next;
    treeview1.Items.Delete(treeview1.Items[index]);
  end;
{
  doan nay dung de test xem nhung phan tu trong treeview co tuong ung voi mang record head ko
  mcr1:=head;
  while mcr1<>nil do
  begin
    showmessage(mcr1^.mcr_name);
    mcr1:=mcr1^.next;
  end;
}
end;

procedure TfrmMain.bt_editClick(Sender: TObject);
var
  mcr1:TPMacro;
  p:TTreeNode;
  I: Integer;
  index:integer;
begin
  p:=treeview1.Selected;
  for I := 0 to treeview1.Items.Count - 1 do
  if treeview1.Items[i]=p then
  begin
    index:=i;
    break;
  end;
  new(mcr1);
  mcr1:=head;
  while mcr1 <> nil  do
  begin
    if mcr1^.mcr_name=treeview1.Items[index].Text then
    begin
      case mcr1^.mcr_index of
        1..2:
            begin
              frmnewmacro.ed_cmdline.Text:=mcr1^.mcr_path;
            end;
        3:    frmnewmacro.MemoReminder.Text:=mcr1^.mcr_action;
      end;
      frmnewmacro.macro_name.Text:=mcr1^.mcr_name;
      frmnewmacro.HotKey1.HotKey:=mcr1^.mcr_hotkey;
      frmnewmacro.ed_cmdline.Text:=mcr1^.mcr_path;
      if mcr1^.mcr_action='None' then frmnewmacro.Comb_action.ItemIndex:=0
      else if mcr1^.mcr_index=1 then frmnewmacro.Comb_action.ItemIndex:=1
      else if mcr1^.mcr_index=2 then frmnewmacro.Comb_action.ItemIndex:=2
      else if mcr1^.mcr_index=3 then frmnewmacro.Comb_action.ItemIndex:=3;
      frmnewmacro.Comb_actionChange(sender);
      frmnewmacro.ShowModal;
      if frmnewmacro.ModalResult=mrOk then
      begin
        mcr1^.mcr_name:=frmnewmacro.macro_name.Text;
        mcr1^.mcr_hotkey:= frmnewmacro.HotKey1.HotKey;
        mcr1^.mcr_action:= frmnewmacro.Comb_action.Text;
        mcr1^.mcr_path:=  frmnewmacro.ed_cmdline.Text;
        case frmnewmacro.Comb_action.ItemIndex of
        1: mcr1^.mcr_index:=1;
        2: mcr1^.mcr_index:=2;
        3: begin
              mcr1^.mcr_index:=3;
              mcr^.mcr_path:='Day la macro remider';
              mcr^.mcr_action:=frmnewmacro.MemoReminder.Text;
              counter:=frmnewmacro.sum_time;
              timer_alarm.Enabled:=true;
           end;
        end;
        treeview1.Items[index].Text:=mcr1^.mcr_name;
      end;
      break;
    end
    else mcr1:=mcr1^.next;
  end;
//  AddMacro(inttostr(random(100)));
end;

procedure TfrmMain.bt_newmacroClick(Sender: TObject);
var
  ParentNode: TTreeNode;
  mcr1:TPMacro;
  found:boolean;
  I: Integer;
  item:integer;
  mcr2:TPMacro;
  found_numberregister:boolean;
  number_register:integer;
begin
  frmnewmacro.lb_cmdline.Visible:=false;
  frmnewmacro.Memoreminder.Visible:=false;
  frmnewmacro.chb_sound.Visible:=false;
  frmnewmacro.ed_cmdline.Visible:=false;
  frmnewmacro.bt_cmdline.Visible:=false;
  frmnewmacro.Comb_action.ItemIndex:=0;
  frmnewmacro.showModal();
  if (frmnewMacro.ModalResult=mrOK) and
      (frmnewmacro.macro_name.Text<>'') and
      (frmnewmacro.comb_action.itemindex>0)then
  begin
      randomize;
      new(mcr1);
      found:=false;
      mcr1:=head;
      while mcr1 <> nil do
      begin
          if (mcr1^.mcr_path=frmnewmacro.ed_cmdline.Text) or
          (mcr1^.mcr_hotkey=frmnewmacro.HotKey1.HotKey) or
          (mcr1^.mcr_name=frmnewmacro.macro_name.Text)  then
          begin
            found:=true;
            break;
          end;
          mcr1:=mcr1^.next;
      end;
      if found=false then
      begin
          new(mcr);
          if (frmnewmacro.macro_name.Text<>'') and
          ((frmnewmacro.ed_cmdline.Text<>'') or (frmnewmacro.MemoReminder.Text<>''))
          and (frmnewmacro.HotKey1.HotKey<>0)
          then
          begin
            //record
              mcr^.mcr_name:=frmnewmacro.macro_name.Text;
              mcr^.mcr_hotkey:=frmnewmacro.HotKey1.HotKey;
              if frmnewmacro.comb_action.ItemIndex=1 then
              begin
                  mcr^.mcr_path:=frmnewmacro.ed_cmdline.Text;
                  mcr^.mcr_action:=frmnewmacro.comb_action.text;
                  mcr^.mcr_index:=1;
              end
              else if frmnewmacro.comb_action.ItemIndex=2 then
              begin
                  mcr^.mcr_path:=frmnewmacro.ed_cmdline.Text;
                  mcr^.mcr_action:=frmnewmacro.comb_action.text;
                  mcr^.mcr_index:=2
              end
              else if frmnewmacro.Comb_action.ItemIndex=3 then
              begin
                  mcr^.mcr_path:='Day la macro remider';
                  mcr^.mcr_action:=frmnewmacro.MemoReminder.Text;
                  mcr^.mcr_index:=3;
              end;
//xet xem so nay da ton tai chua?
              new(mcr2);
              mcr2:=head;
              found_numberregister:=true;
              while found_numberregister do
              begin
                  found_numberregister:=false;
                  number_register:=random(16383)+49153;
                  while mcr2 <> nil  do
                  begin
                    if number_register=mcr2^.mcr_numberregister then
                    begin
                        found_numberregister:=true;
                        break;
                    end
                    else found_numberregister:=false;
                    mcr2:=mcr2^.next;
                  end;
              end;
              mcr^.mcr_numberregister:=number_register;
              //xac dinh goc de add vao treeview
              case frmnewmacro.comb_action.ItemIndex of
              1..2:
                 begin
                 for I := 0 to treeview1.Items.Count - 1 do
                 if ((treeview1.Items[i].Text='Execute a program') and
                    (frmnewmacro.comb_action.ItemIndex=1))
                    or ((treeview1.Items[i].Text='Open a folder') and
                        (frmnewmacro.comb_action.ItemIndex=2))
                 then
                    begin
                        item:=i;
                        break;
                    end;
                    //xac dinh node goc de add vao
                    ParentNode:=Treeview1.Items[item];
                    //add vao treeview
                    Treeview1.Items.AddChild(ParentNode,frmnewmacro.macro_name.Text);
                  end;
              3:  begin
                     Treeview1.Items.AddChild(nil,frmnewmacro.macro_name.Text);
                     counter:=frmnewmacro.sum_time;
                     timer_alarm.enabled:=true;
                  end;
            end;//het case
            frmnewmacro.macro_name.Text:='';
            frmnewmacro.ed_cmdline.Text:='';
            frmnewmacro.Comb_action.Text:=frmnewmacro.Comb_action.Items[0];
            frmnewmacro.HotKey1.HotKey:=0;
            mcr^.next:=head;
            head:=mcr;
        end;// het if
     end;//het if found=false
  end;   //het if dieu kien tu dau
  Application.OnHint:=DisplayHint;
  Registershortcut;
end;

procedure TfrmMain.CheckBox1Click(Sender: TObject);
var s:string;
begin
      s:=extractfilepath(application.ExeName)+extractfilename(application.ExeName);
      Reg:=TRegistry.Create;
      try
        Reg.RootKey:= HKEY_CURRENT_USER;
        if Reg.OpenKey('Software\Microsoft\Windows\CurrentVersion\Run',true) then
        begin
          if checkbox1.Checked then
          begin
              Reg.WriteString('TSP-3 in 1',s);
              Reg.WriteString('TSP-checked','1');
          end
          else
          begin
              Reg.DeleteValue('TSP-3 in 1');
              Reg.WriteString('TSP-checked','0');
          end;
          Reg.CloseKey;
        end;
      finally
          Reg.Free;
          Inherited;
      end;
end;

procedure TfrmMain.ControlWindow(var Msg: TMessage);
begin
      if Msg.WParam = SC_MINIMIZE then
      begin
        ShowWindow(Handle,SW_HIDE);        //an cua so chuong trinh
        ShowWindow(Application.Handle, SW_HIDE); // an bieu tuong cua chuong trinh tren taskbar
       end
     else
     inherited;
end;

procedure TfrmMain.DisplayHint(Sender: TObject);
begin
  Memo2.Text:=Application.Hint;//GetLongHint(Application.Hint);
end;

procedure TfrmMain.edithotkeyChange(Sender: TObject);
begin
  edithotkey.HotKey:=0;
end;

procedure TfrmMain.Exit1Click(Sender: TObject);
begin
  close;
end;

procedure TfrmMain.FormActivate(Sender: TObject);
begin
  Application.OnHint:=DisplayHint;
end;

procedure TfrmMain.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Saveshortcut;
end;

procedure TfrmMain.FormCreate(Sender: TObject);
var
node:TTreeNode;
  I: Integer;
begin
  Treeview1.Items.AddChildFirst(nil,'Execute a program');
  Treeview1.Items.AddChild(nil,'Open a folder');
  Treeview1.Items.AddChild(nil,'Sound volume control');
  for I := 0 to treeview1.Items.Count - 1 do
  if treeview1.Items[i].Text='Sound volume control' then
  begin
    node:=Treeview1.Items[i];
    break;
  end;
  Treeview1.Items.AddChild(node,'Mute');
  Loadshortcut;
  reg:=Tregistry.Create;
  try
      Reg.RootKey:= HKEY_CURRENT_USER;
      if Reg.OpenKey('Software\Microsoft\Windows\CurrentVersion\Run',true) then
      begin
        if reg.ReadString('TSP-checked')='1' then
              checkbox1.Checked:=true
        else checkbox1.Checked:=false;
        Reg.CloseKey;
      end;
  finally
      Inherited;
  end;
end;

procedure TfrmMain.Quit1Click(Sender: TObject);
begin
 close;
end;

procedure TfrmMain.Registershortcut;
var
  key:word;
  shiftstate  :word;
  state:TShiftstate;
  mcr1:TPMacro;
begin
  mcr1:=head;
  while mcr1 <> nil do
  begin
    ShortCutToKey(mcr1^.mcr_hotkey,key,state);
    shiftstate:=0;
    if ssshift in State then
      shiftstate:=shiftstate or MOD_SHIFT;
    if ssAlt in state then
      shiftstate:=Shiftstate or MOD_ALT;
    if ssCtrl in state then
      shiftstate:=Shiftstate or MOD_CONTROL;
    RegisterHotkey(handle,mcr1^.mcr_numberregister,shiftstate,key);
    mcr1:=mcr1^.next;
  end;
end;

procedure TfrmMain.Saveshortcut;
var
mcr1:TPmacro;
path_file:string;
inifile:TInifile;
j:byte;
begin
  //chuan bi
  path_file:=extractfilepath(application.ExeName)+'tsp.rmd';
  try
     inifile:=TInifile.Create(path_file);
     if inifile.ReadString('TITLE','TITLE','')='MyTsp' then
     begin
        j:=1;
        while inifile.ReadString('Link'+inttostr(j),'Name','')<>'' do
        begin
          inifile.EraseSection('Link'+inttostr(j));
          inc(j);
        end
     end
     else
     begin
        inifile.WriteString('TITLE','TITLE','MyTsp');
     end;
     j:=1;
     mcr1:=head;
     while mcr1 <> nil do
     begin
         inifile.writestring('Link'+inttostr(j),'Name',mcr1^.mcr_name);
         inifile.WriteInteger('Link'+inttostr(j),'Hotkey',mcr1^.mcr_hotkey);
         inifile.WriteString('Link'+inttostr(j),'Action',mcr1^.mcr_action);
         inifile.WriteString('Link'+inttostr(j),'Path',mcr1^.mcr_path);
         inifile.WriteInteger('Link'+inttostr(j),'Index',mcr1^.mcr_index);
         inifile.WriteInteger('Link'+inttostr(j),'NumberRegister',mcr1^.mcr_numberregister);
         mcr1:=mcr1^.next;
         inc(j);
     end;
  finally
    inifile.Free;
  end;
end;

procedure TfrmMain.Show1Click(Sender: TObject);
begin
   ShowWindow(handle,SW_SHOW);
end;

procedure TfrmMain.Timer_alarmTimer(Sender: TObject);
begin
  dec(counter);
  if counter=0 then
  begin
      Timer_alarm.Enabled:=false;
      if frmnewmacro.chb_sound.Checked then
      begin
        Mediaplayer1.FileName:=frmnewmacro.path_sound;
        Mediaplayer1.Open;
        Mediaplayer1.Play;
      end;
      frmReminder.showmodal();
      if frmnewmacro.chb_sound.Checked then
      begin
        Mediaplayer1.FileName:=frmnewmacro.path_sound;
        Mediaplayer1.Open;
        Mediaplayer1.Stop;
      end;
  end;
end;

procedure TfrmMain.TrayIcon1Click(Sender: TObject);
begin
   ShowWindow(handle,SW_SHOW);
end;

procedure TfrmMain.TrayIcon1MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  Trayicon1.PopupMenu;
end;

procedure TfrmMain.TrayIcon1MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
  TrayIcon1.Hint:='TSP-Special program 3 in 1';
end;

procedure TfrmMain.TreeView1GetImageIndex(Sender: TObject; Node: TTreeNode);
begin
    if node.Text='Execute a program' then node.ImageIndex:=0
    else if node.Text='Open a folder' then node.ImageIndex:=1
    else if node.Text='Sound volume control' then  node.ImageIndex:=3
    else node.ImageIndex:=2;

end;

procedure TfrmMain.TreeView1MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
var
  p:TTreeNode;
  I: Integer;
  index:integer;
begin
  p:=treeview1.Selected;
  for I := 0 to treeview1.Items.Count - 1 do
  if treeview1.Items[i]=p then
  begin
    index:=i;
    break;
  end;
  mcr:=head;
  while mcr <> nil  do
  begin
    if mcr^.mcr_name=treeview1.Items[index].Text then
    begin
      Memo1.Text:=mcr^.mcr_action;
      edithotkey.HotKey:=mcr^.mcr_hotkey;
      break;
    end
    else
    begin
      Memo1.Text:='';
      edithotkey.HotKey:=0;
    end;
    mcr:=mcr^.next;
  end;
end;
procedure TfrmMain.WMHotkey(var msg: TMsg);
var
  mcr1:TPMacro;
begin
  mcr1:=head;
  while mcr1 <> nil  do
  begin
    if msg.message=mcr1^.mcr_numberregister then
    begin
       if (mcr1^.mcr_index=1) or (mcr1^.mcr_index=2) then
       begin
           ShellExecute(0,'open',pchar(mcr1^.mcr_path),NIL,NIL,SW_SHOWNORMAL);
           break;
       end
       else if (mcr1^.mcr_index=3) then
       begin
          frmReminder.Memo1.text:=mcr1^.mcr_action;
//           timer_clarm.Enabled:=true;
          frmReminder.showmodal();
          break;
       end;

    end
    else
    mcr1:=mcr1^.next;
  end;
  inherited;
end;
end.
