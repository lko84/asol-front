unit Buttons;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls;

type
  TBtnFrame = class(TFrame)
    BtnPanel: TPanel;

    BtnRead: TButton;
    BtnClear: TButton;
    BtnNew: TButton;
    BtnDelete: TButton;
    BtnSave: TButton;
    procedure btnReadClick(Sender: TObject);
    procedure btnClearClick(Sender: TObject);
    procedure btnNewClick(Sender: TObject);
    procedure btnDeleteClick(Sender: TObject);
    procedure btnSaveClick(Sender: TObject);
  private
    FOnReadClick: TNotifyEvent;
    FOnClearClick: TNotifyEvent;
    FOnNewClick: TNotifyEvent;
    FOnDeleteClick: TNotifyEvent;
    FOnSaveClick: TNotifyEvent;
  public
    property OnReadClick: TNotifyEvent read FOnReadClick write FOnReadClick;
    property OnClearClick: TNotifyEvent read FOnClearClick write FOnClearClick;
    property OnNewClick: TNotifyEvent read FOnNewClick write FOnNewClick;
    property OnDeleteClick: TNotifyEvent read FOnDeleteClick write FOnDeleteClick;
    property OnSaveClick: TNotifyEvent read FOnSaveClick write FOnSaveClick;
  end;

implementation

{$R *.dfm}

procedure TBtnFrame.btnReadClick(Sender: TObject);
begin
  if Assigned(FOnReadClick) then FOnReadClick(Sender);
end;

procedure TBtnFrame.btnClearClick(Sender: TObject);
begin
  if Assigned(FOnClearClick) then FOnClearClick(Sender);
end;

procedure TBtnFrame.btnNewClick(Sender: TObject);
begin
  if Assigned(FOnNewClick) then FOnNewClick(Sender);
end;

procedure TBtnFrame.btnDeleteClick(Sender: TObject);
begin
  if Assigned(FOnDeleteClick) then FOnDeleteClick(Sender);
end;

procedure TBtnFrame.btnSaveClick(Sender: TObject);
begin
  if Assigned(FOnSaveClick) then FOnSaveClick(Sender);
end;

end.
