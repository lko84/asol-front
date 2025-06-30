program AsolFront;

uses
  Vcl.Forms,
  Vcl.Dialogs,
  Main in 'src\Main.pas' {MainForm},
  Login in 'src\Login.pas' {LoginForm},
  Bootstrap in 'src\Bootstrap.pas',
  Services.AuthService in 'Src\Services\Services.AuthService.pas',
  Services.Interfaces in 'src\Services\Services.Interfaces.pas',
  Services.Orderservice in 'src\Services\Services.Orderservice.pas',
  Services.UserService in 'src\Services\Services.UserService.pas' {$R *.res},
  OrderDetailFrame in 'src\OrderDetailFrame.pas' {OrderDetail: TFrame},
  OrderListFrame in 'src\OrderListFrame.pas' {OrderList: TFrame},
  UserDetailFrame in 'src\UserDetailFrame.pas' {UserDetail: TFrame},
  UserListFrame in 'src\UserListFrame.pas' {UserList: TFrame},
  FrameHost in 'src\FrameHost.pas',
  FrameRegistry in 'src\FrameRegistry.pas',
  Utils in 'src\Utils.pas',
  Lifetime in 'src\Lifetime.pas',
  Dto in 'src\Dto.pas',
  Buttons in 'src\Buttons.pas' {BtnFrame: TFrame};

{$R *.res}

var
  LoginDlg: TLoginForm;
begin
  Application.Initialize;
  Bootstrap.Initialize;

  Application.CreateForm(TMainForm, MainForm);
  Application.MainFormOnTaskbar := False;
  Application.ShowMainForm := False;

  LoginDlg := TLoginForm.Create(nil);
  LoginDlg.ShowModal;

  Application.Run;
end.
