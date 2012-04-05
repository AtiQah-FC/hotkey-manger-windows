unit ScktComp;

interface

uses
  SysUtils, Classes, DB, DBClient, MConnect, SConnect;

type
  TSocketConnection1 = class(TSocketConnection)
  private
    { Private declarations }
  protected
    { Protected declarations }
  public
    { Public declarations }
  published
    { Published declarations }
  end;

procedure Register;

implementation

procedure Register;
begin
  RegisterComponents('Samples', [TSocketConnection1]);
end;

end.
