unit Utils;

interface

uses Winapi.Windows, Winapi.Messages, Vcl.StdCtrls, Vcl.Controls;

procedure SetCueBanner(Control: TWinControl; const CueText: string);

implementation

procedure SetCueBanner(Control: TWinControl; const CueText: string);
const
  EM_SETCUEBANNER = $1501;
var
  EditHandle: HWND;
begin
  if Control is TEdit then
    SendMessage(Control.Handle, EM_SETCUEBANNER, 0, LPARAM(PChar(CueText)))
  else if Control is TComboBox then
  begin
    Control.HandleNeeded;
    EditHandle := FindWindowEx(Control.Handle, 0, 'Edit', nil);
    if EditHandle <> 0 then
      SendMessage(EditHandle, EM_SETCUEBANNER, 0, LPARAM(PChar(CueText)));
  end;
end;

end.
