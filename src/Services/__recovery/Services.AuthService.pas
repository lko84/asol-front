unit Services.AuthService;

interface

uses
  System.JSON, REST.Client, REST.Types, REST.Response.Adapter,
  System.Classes, System.SysUtils, Services.Interfaces;

type
  TAuthService = class(TInterfacedObject, IAuthService)
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

constructor TAuthService.Create;
begin
  FClient := TRESTClient.Create('http://localhost:8080');
  FRequest := TRESTRequest.Create(nil);
  FResponse := TRESTResponse.Create(nil);
  FRequest.Client := FClient;
  FRequest.Response := FResponse;
end;

function TAuthService.Login(const Username, Password: string): Boolean;
var
  JsonObj: TJSONObject;
begin
  FRequest.ResetToDefaults;

  FRequest.Resource := 'auth/login';
  FRequest.Method := rmPOST;
  FRequest.Client := FClient;
  FRequest.Response := FResponse;
  // FRequest.ContentType := 'application/json';

  // Build JSON manually
  JsonObj := TJSONObject.Create;
  try
    JsonObj.AddPair('username', Username);
    JsonObj.AddPair('password', Password);
    FRequest.Body.ClearBody;
    FRequest.AddBody(JsonObj.ToJSON, ctAPPLICATION_JSON);
  finally
    JsonObj.Free;
  end;

  FRequest.Execute;

  if FResponse.StatusCode = 200 then
  begin
    FToken := TJSONObject.ParseJSONValue(FResponse.Content)
                  .GetValue<string>('token');
    Result := True;
  end
  else
    Result := False;
end;

function TAuthService.GetToken: string;
begin
  Result := FToken;
end;
end.
