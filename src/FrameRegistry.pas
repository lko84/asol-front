unit FrameRegistry;

interface

uses System.Generics.Collections, System.SysUtils, Spring.Container, FrameHost, Vcl.Forms;

type
  TFrameRegistry = class
  private
    var FMap: TDictionary<string, string>; // DisplayName ? Key
    class var FInstance: TFrameRegistry;
  public
   destructor Destroy;
   class function Instance: TFrameRegistry;
   procedure Register<TFrameType>(const Key, DisplayName: string);
   function Search(const Partial: string): TArray<string>;
   function GetKey(DisplayName: string): string;
   function get(Key: string): TFrame;
  private
   constructor Create;
  end;

implementation

constructor TFrameRegistry.Create;
begin
  FMap := TDictionary<string, string>.Create;
end;

destructor TFrameRegistry.Destroy;
begin
  FMap.Free;
end;

class function TFrameRegistry.Instance: TFrameRegistry;
begin
  if not Assigned(FInstance) then
    FInstance := TFrameRegistry.Create;
  Result := FInstance;
end;

procedure TFrameRegistry.Register<TFrameType>(const Key, DisplayName: string);
begin
  FMap.AddOrSetValue(DisplayName, Key);
  GlobalContainer.RegisterType<TFrameType>.Implements<IFrameHost>(Key);
end;

function TFrameRegistry.GetKey(DisplayName: string): string;
begin
  if not FMap.TryGetValue(DisplayName, Result) then
    Result := '';
end;

function TFrameRegistry.Search(const Partial: string): TArray<string>;
var
  DisplayName: string;
begin
  Result := [];

  for DisplayName in FMap.Keys do
  begin
    if LowerCase(DisplayName).Contains(Partial.ToLower) then Result := Result + [DisplayName];
  end;
end;

function TFrameRegistry.get(Key: string): TFrame;
begin
  Result := GlobalContainer.Resolve<IFrameHost>(key).GetFrame;
end;

end.
