unit Services.Orderservice;

interface

uses System.JSON, REST.Client, REST.Types, REST.Json, REST.Response.Adapter,
  System.Classes, System.SysUtils, Services.Interfaces, Dto, Spring.Container,
  System.Generics.Collections ;

type
  TOrderService = class(TInterfacedObject, IOrderService)
  private
    FAuthService: IAuthService;
    FToken: string;
    FClient: TRESTClient;
    FRequest: TRESTRequest;
    FResponse: TRESTResponse;
  public
    constructor Create;
    function GetOrders: TArray<TOrder>;
    function GetCustomerScore(CustomerId: Integer): Double;
  end;

implementation

constructor TOrderService.Create;
begin
  FAuthService := GlobalContainer.Resolve<IAuthService>;
  FClient := TRESTClient.Create('http://localhost:8080');
  FRequest := TRESTRequest.Create(nil);
  FResponse := TRESTResponse.Create(nil);
  FRequest.Client := FClient;
  FRequest.Response := FResponse;
end;

function TOrderService.GetOrders: TArray<TOrder>;
begin
  FRequest.ResetToDefaults;

  FRequest.Resource := 'api/orders';
  FRequest.Method := rmGet;
  FRequest.Client := FClient;
  FRequest.Response := FResponse;

  FRequest.Body.ClearBody;
  FAuthService.AddAuthHeader(FRequest);
  FRequest.Execute;

  if FResponse.StatusCode = 200 then
  begin
    var JSONArray := TJSONObject.ParseJSONValue(FResponse.Content) as TJSONArray;
    var ObjList := TObjectList<TOrder>.Create;
    try
      for var i := 0 to JSONArray.Count - 1 do
        ObjList.Add(TJson.JsonToObject<TOrder>(JSONArray.Items[i] as TJSONObject));
      Result := ObjList.ToArray;
    finally
      ObjList.Free;
    end;
  end;
end;

function TOrderService.GetCustomerScore(CustomerId: Integer): Double;
begin
    //
end;

end.
