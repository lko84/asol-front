unit UserListFrame;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs;

type
  TUserList = class(TFrame)
  private
    { Private declarations }
  public
    constructor Create(AOwner: TComponent);
  end;

implementation

{$R *.dfm}

constructor TUserList.Create(AOwner: TComponent);
begin
  inherited;

end;

end.
