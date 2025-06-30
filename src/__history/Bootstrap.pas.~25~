unit Bootstrap;

interface

uses Spring.Container, Services.Interfaces, Services.AuthService, Services.UserService, Services.OrderService, FrameHost, UserListFrame, UserDetailFrame, OrderListFrame, OrderDetailFrame, FrameRegistry, Lifetime, Dto;

procedure Initialize;
procedure RegisterServices;
procedure RegisterFrames;
procedure RegistryBuild;

implementation

procedure Initialize;
begin
  RegisterServices;
  RegisterFrames;
  TLifetimeService.Instance;
  RegistryBuild;
end;

procedure RegisterServices;
begin
  GlobalContainer.RegisterType<IAuthService, TAuthService>.AsSingleton;
  GlobalContainer.RegisterType<IUserService, TUserService>.AsSingleton;
  GlobalContainer.RegisterType<IOrderService, TOrderService>.AsSingleton;
end;

procedure RegisterFrames;
begin
  var ANY:=TArray<TUserRole>.Create(ANY);
  var FrameRegistry: TFrameRegistry := TFrameRegistry.Instance;
  FrameRegistry.Register<TUserList>('U001', 'U001: Users', ANY);
  FrameRegistry.Register<TUserDetail>('U002', 'U002: User Detail', ANY);
  FrameRegistry.Register<TOrderList>('O001', 'O001: Orders', ANY);
  FrameRegistry.Register<TOrderDetail>('O002', 'O002: Order Detail', ANY);
end;

procedure RegistryBuild;
begin
  GlobalContainer.Build;
end;

end.
