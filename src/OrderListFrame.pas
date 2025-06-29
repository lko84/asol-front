unit OrderListFrame;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, FrameHost, Dto;

type
  TOrderList = class(TFrame, IFrameHost)
  private
    { Private declarations }
  public
    constructor Create(AOwner: TComponent); override;
    function GetFrame: TFrame;
  end;

implementation

{$R *.dfm}

constructor TOrderList.Create(AOwner: TComponent);
begin

end;

function TOrderList.GetFrame: TFrame;
begin
  Result := Self;
end;

end.
