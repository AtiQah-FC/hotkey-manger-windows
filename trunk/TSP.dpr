program TSP;

uses
  Forms,
  Unit1 in 'Unit1.pas' {frmMain},
  Unewmacro in 'Unewmacro.pas' {frmnewmacro},
  Ureminder in 'Ureminder.pas' {frmReminder};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmMain, frmMain);
  Application.CreateForm(Tfrmnewmacro, frmnewmacro);
  Application.CreateForm(TfrmReminder, frmReminder);
  Application.Run;
end.
