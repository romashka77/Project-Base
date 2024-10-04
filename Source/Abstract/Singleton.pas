unit Singleton;
{ Одиночка
  Singleton
  Тип: Порождающий
  Что это:
  Гарантирует, что класс имеет только
  один экземпляр и предоставляет
  глобальную точку доступа к нему. }

interface

uses Generics.Collections, TemplateMethod;

type
  // Одиночка (с реестром)
  TSingleton = class;

  TSingletonRegistry = class(TDictionary<string, TSingleton>)
  public
    destructor Destroy; override;
  end;

  TSingleton = class(TInterfacedObject, ITemplateMethod)
  strict private
    class var FSingletonRegistry: TSingletonRegistry;
  private
    class function Registry: TSingletonRegistry;

  protected
    constructor Create; virtual; abstract;
    class function Lookup(const ClassName: string): TSingleton; virtual;
  public
    class function Instance: TSingleton; virtual;
    class procedure Register(const ClassName: string; Instance: TSingleton);
  end;

implementation

{ TSingleton }
uses System.SysUtils;

class function TSingleton.Instance: TSingleton;
begin
  Result := Lookup(Self.ClassName);
  if not Assigned(Result) then
    Result := Self.Create;
end;

class function TSingleton.Lookup(const ClassName: string): TSingleton;
begin
  Registry.TryGetValue(ClassName, Result);
end;

class procedure TSingleton.Register(const ClassName: string;
  Instance: TSingleton);
begin
  Registry.Add(ClassName, Instance);
end;

class function TSingleton.Registry: TSingletonRegistry;
begin
  if not Assigned(FSingletonRegistry) then
    FSingletonRegistry := TSingletonRegistry.Create;
  Result := FSingletonRegistry;
end;

{ TSingletonRegistry }

destructor TSingletonRegistry.Destroy;
var
  i: Integer;
begin
  for i := 0 to Count - 1 do
    ToArray[i].Value.Free;
  inherited;
end;

initialization

finalization

TSingleton.Registry.Free;

end.
