unit Bootstrap;

interface

uses Spring.Container, Services.Interfaces, Services.AuthService, Services.UserService, Services.OrderService;

procedure RegisterServices;

implementation

procedure RegisterServices;
begin
  GlobalContainer.RegisterType<IAuthService, TAuthService>.AsSingleton;
  GlobalContainer.RegisterType<IUserService, TUserService>.AsSingleton;
  GlobalContainer.RegisterType<IOrderService, TOrderService>.AsSingleton;
  GlobalContainer.Build;
end;
end.
