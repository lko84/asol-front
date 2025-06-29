unit UserDetailFrame;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, FrameHost;

type
  TUserDetail = class(TFrame, IFrameHost)
  private
    { Private declarations }
  public
    constructor Create(AOwner: TComponent);
    function GetFrame: TFrame;
  end;

implementation

{$R *.dfm}

constructor TUserDetail.Create(AOwner: TComponent);
begin
  inherited;

end;

function TUserDetail.GetFrame: TFrame;
begin
  Result := Self;
end;

end.
