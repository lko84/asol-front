unit Bootstrap;

interface

uses Spring.Container, Services.AuthService;

implementation

procedure RegisterServices;
begin
  GlobalContainer.RegisterType<IAuthService, TAuthService>.AsSingleton;
  GlobalContainer.RegisterType<IOrderService, TOrderService>.AsSingleton;
  GlobalContainer.Build;
end;
