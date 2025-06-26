unit Services.Orderservice;

interface

uses System.JSON, REST.Client, REST.Types, REST.Response.Adapter,
  System.Classes, System.SysUtils, Services.Interfaces;

type
  TOrderService = class(TInterfacedObject, IOrderService)
  private
    FToken: string;
    FClient: TRESTClient;
    FRequest: TRESTRequest;
    FResponse: TRESTResponse;
  public
    constructor Create;
    function GetOrders: TJSONArray;
    function GetCustomerScore(CustomerId: Integer): Double;
  end;

implementation

constructor TOrderService.Create;
begin
//
end;

function TOrderService.GetOrders: TJSONArray;
begin
  //
end;

function TOrderService.GetCustomerScore(CustomerId: Integer): Double;
begin
    //
end;

end.
