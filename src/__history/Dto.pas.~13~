unit Dto;

interface

uses System.TypInfo;

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

implementation

function StringToUserRole(const S: string): TUserRole;
begin
  Result := TUserRole(GetEnumValue(TypeInfo(TUserRole), S));
end;

function TUserSession.HasRole(Role: TUserRole): Boolean;
begin
  Result := Length(Roles) > 0;
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
