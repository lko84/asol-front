unit Dto;

interface

uses Rest.JSON, System.TypInfo;

type
TUserRole = (ADMIN, USER, ANY);
function StringToUserRole(const S: string): TUserRole;

type
TUser = class
  UserId: string;
  Fullname: String;
  Email: String;
  Phone: String;
  Active: Boolean;
end;

type
TUserSession = class
  Token: string;
  UserId: string;
  Username: string;
  User: TUser;
  Roles: TArray<TUserRole>;
  function HasRole(Role: TUserRole): Boolean;
  function HasAnyRole(Roles: TArray<TUserRole>): Boolean;
end;

type
TOrderItem = class
  OrderId: string;
  Line: Word;
  Name: string;
  Quantity: integer;
  Price: Currency;
end;

type
TOrder = class
  orderId: String;
  Customer: TUser;
  OrderDate: TDateTime;
  OrderItems: TArray<TOrderItem>;
  function toJSON: string;
  class function fromJson(JSONstr:string): TOrder;
end;

implementation

function TOrder.toJSON: string;
begin
  exit(TJson.ObjectToJsonString(self));
end;

class function TOrder.fromJson(JSONstr:string): TOrder;
var
  Order: TOrder;
begin
  exit(TJson.JsonToObject<TOrder>(JSONStr));
end;

function StringToUserRole(const S: string): TUserRole;
begin
  Result := TUserRole(GetEnumValue(TypeInfo(TUserRole), S));
end;

function TUserSession.HasRole(Role: TUserRole): Boolean;
begin
  for var fRole in Roles do
  if Role=fRole then Exit(true);
  Result := False;
end;

function TUserSession.HasAnyRole(Roles: TArray<TUserRole>): Boolean;
var
  Role: TUserRole;
begin
  for Role in Roles do
    if (Role=TUserRole.ANY) or (HasRole(Role)) then
      Exit(True);
  Result := False;
end;

end.
