unit Services.UserService;

interface

uses System.JSON, REST.Client, REST.Types, REST.Response.Adapter,
  System.Classes, System.SysUtils, Services.Interfaces;

type
  TUserService = class(TInterfacedObject, IAuthService)
  private
    FToken: string;
    FClient: TRESTClient;
    FRequest: TRESTRequest;
    FResponse: TRESTResponse;
  public
    constructor Create;
    function Login(const Username, Password: string): Boolean;
    function GetToken: string;
  end;

implementation

end.
