unit Main;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus, Vcl.ComCtrls, Vcl.StdCtrls, OrderListFrame;

type
  TMainForm = class(TForm)
    MainMenu1: TMainMenu;
    PageControlMain: TPageControl;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    procedure OpenTab(const Title: string; FrameClass: TFrame);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  MainForm: TMainForm;

implementation

{$R *.dfm}



procedure TMainForm.Button1Click(Sender: TObject);
begin
  OpenTab('Orders', TOrderList.Create(self));
end;

procedure TMainForm.OpenTab(const Title: string; FrameClass: TFrame);
var
  Tab: TTabSheet;
  Frame: TFrame;
begin
  for var i := 0 to PageControlMain.PageCount - 1 do
    if PageControlMain.Pages[i].Caption = Title then
    begin
      PageControlMain.ActivePage := PageControlMain.Pages[i];
      Exit;
    end;

  // Create new tab
  Tab := TTabSheet.Create(PageControlMain);
  Tab.PageControl := PageControlMain;
  Tab.Caption := Title;

  // Create frame
  Frame := FrameClass.Create(Tab);
  Frame.Parent := Tab;
  Frame.Align := alClient;

  //PageControlMain.ActivePage := Tab;
end;


end.
