unit Services.Interfaces;

interface

uses
  System.JSON, REST.Client, REST.Types, REST.Response.Adapter,
  System.Classes, System.SysUtils;

type
  IAuthService = interface
    ['{A2C503EF-BDC5-4724-B249-B9F2F842D0FD}']
    function Login(const Username, Password: string): Boolean;
    function GetToken: string;
  end;

  IOrderService = interface
    ['{C47DFAD4-5CF7-42DB-B6A0-67832D7791AA}']
    function GetOrders: TJSONArray;
    function GetCustomerScore(CustomerId: Integer): Double;
  end;

implementation

end.

