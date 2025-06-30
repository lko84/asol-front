unit Main;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus, Vcl.ComCtrls, Vcl.StdCtrls,
  Vcl.ExtCtrls, Vcl.WinXCtrls,
  Spring.Container,
  FrameRegistry, Utils, Lifetime
  ;

type
  TMainForm = class(TForm)
    PageControlMain: TPageControl;
    Panel1: TPanel;
    Drawer: TPanel;
    EditSearch: TEdit;
    ListBoxResults: TListBox;
    procedure FormCreate(Sender: TObject);
    procedure Initialize;
    procedure OnAppStateChange(NewState: TLifeTimeState);
    procedure OpenTab(const Title: string; Frame: TFrame);
    procedure AdjustListBoxHeight;
    procedure ToggleDrawer;
    procedure DrawerClick(Sender: TObject);
    procedure EditSearchChange(Sender: TObject);
    procedure ListBoxResultsClick(Sender: TObject);
    procedure EditSearchKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ListBoxResultsKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure PageControlMainMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  MainForm: TMainForm;
  DrawerOpen: Boolean = True;

implementation

{$R *.dfm}

procedure TMainForm.FormCreate(Sender: TObject);
begin
  SetCueBanner(EditSearch, 'Open dialog...');
  TLifetimeService.Instance.RegisterCallback(OnAppStateChange);
end;

procedure TMainForm.Initialize;
begin
  for var name in TFrameRegistry.Instance.findDisplayName('') do
  ListBoxResults.items.Add(name)
end;

procedure TMainForm.OnAppStateChange(NewState: TLifeTimeState);
begin
  if NewState = ltLogin then
    Initialize;
end;

procedure TMainForm.EditSearchChange(Sender: TObject);
var
  Matches: TArray<string>;
  Match: string;
begin
  ListBoxResults.Items.Clear;
  if Length(EditSearch.Text) < 1 then
  begin
    ListBoxResults.Visible := False;
    Exit;
  end;

  Matches := TFrameRegistry.Instance.findDisplayName(EditSearch.Text);
  for Match in Matches do
    ListBoxResults.Items.Add(Match);

  // AdjustListBoxHeight;
  ListBoxResults.Visible := Length(Matches) > 0;
end;

procedure TMainForm.EditSearchKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
    case Key of
    VK_DOWN:
      if ListBoxResults.Visible and (ListBoxResults.Items.Count > 0) then
      begin
        if ListBoxResults.ItemIndex = -1 then
        ListBoxResults.ItemIndex := 0
        else if ListBoxResults.ItemIndex+1<ListBoxResults.Items.Count then
        ListBoxResults.ItemIndex := ListBoxResults.ItemIndex+1;
      end;
     VK_UP:
      if ListBoxResults.Visible and (ListBoxResults.Items.Count > 0) then
      begin
        if ListBoxResults.ItemIndex = -1 then
        ListBoxResults.ItemIndex := ListBoxResults.Items.Count-1
        else if ListBoxResults.ItemIndex>0 then
        ListBoxResults.ItemIndex := ListBoxResults.ItemIndex-1;
      end;
    VK_RETURN:
      if ListBoxResults.Visible and (ListBoxResults.Items.Count > 0) then
      begin
        DrawerClick(sender);
        Key := 0; // prevent beep
      end;
    VK_ESCAPE:
      ListBoxResults.Visible := False;
  end;
end;

procedure TMainForm.ListBoxResultsClick(Sender: TObject);
begin
  if ListBoxResults.ItemIndex >= 0 then
  begin
    var displayname := ListBoxResults.Items[ListBoxResults.ItemIndex];
    var key := TFrameRegistry.Instance.GetKey(displayname);
    var frame := TFrameRegistry.Instance.get(key);

    OpenTab(displayname, frame); // resolve by key
  end;
end;

procedure TMainForm.ListBoxResultsKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case Key of
    VK_RETURN:
      begin
        ListBoxResultsClick(sender);
        Key := 0;
      end;
    VK_ESCAPE:
      begin
        ListBoxResults.Visible := False;
        EditSearch.SetFocus;
      end;
  end;
end;

procedure TMainForm.AdjustListBoxHeight;
const
  MaxVisibleItems = 8;
var
  ItemCount: Integer;
  ItemHeight, NewHeight: Integer;
begin
  ItemCount := ListBoxResults.Items.Count;
  if ItemCount > MaxVisibleItems then
    ItemCount := MaxVisibleItems;

  if ItemCount = 0 then
    NewHeight := 0
  else
  begin
    ItemHeight := ListBoxResults.ItemHeight;
    NewHeight := ItemCount * ItemHeight + 4; // +4 for border/padding
  end;

  ListBoxResults.Height := NewHeight;

  // Position ListBox so bottom aligns with EditSearch.Top
  ListBoxResults.Top := EditSearch.Top - ListBoxResults.Height;
  ListBoxResults.Left := EditSearch.Left;
  ListBoxResults.Width := EditSearch.Width;
end;

procedure TMainForm.DrawerClick(Sender: TObject);
begin
  ToggleDrawer;
end;

procedure TMainForm.OpenTab(const Title: string; Frame: TFrame);
var
  Tab: TTabSheet;
begin
  for var i := 0 to PageControlMain.PageCount - 1 do
    if PageControlMain.Pages[i].Caption = Title + ' ❌' then
    begin
      PageControlMain.ActivePage := PageControlMain.Pages[i];
      Exit;
    end;

  // Create new tab
  Tab := TTabSheet.Create(PageControlMain);
  Tab.PageControl := PageControlMain;
  Tab.Caption := Title + ' ❌';

  // Create frame
  Frame.Parent := Tab;
  Frame.Align := alClient;

  PageControlMain.ActivePage := Tab;
end;

procedure TMainForm.PageControlMainMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var
  i: Integer;
  TabRect: TRect;
begin
  for i := 0 to PageControlMain.PageCount - 1 do
  begin
    TabRect := PageControlMain.TabRect(i);

    // Rectangle for the "x" button area
    if PtInRect(Rect(TabRect.Right - 20, TabRect.Top + 2, TabRect.Right - 5, TabRect.Bottom - 2), Point(X, Y)) then
    begin
      PageControlMain.Pages[i].Free; // Remove the tab
      Break;
    end;
  end;
end;

procedure TMainForm.ToggleDrawer;
begin
  if DrawerOpen then
  begin
    Panel1.Width := 0;
  end
  else
  begin
    Panel1.Width := 200;
  end;
  DrawerOpen := not DrawerOpen;
end;

end.
