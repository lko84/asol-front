unit ClickableSplitter;

interface

uses Vcl.ExtCtrls, System.Classes;

type
  TClickableSplitter = class(TSplitter)
  private
    FOnClick: TNotifyEvent;
  protected
    procedure Click; override;
  public
    property OnClick: TNotifyEvent read FOnClick write FOnClick;
  end;

implementation

procedure TClickableSplitter.Click;
begin
  if Assigned(FOnClick) then
    FOnClick(Self);
end;
