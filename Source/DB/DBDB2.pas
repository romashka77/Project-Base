unit DBDB2;

interface

uses DataBase, Singleton;

type
  TDBDB2 = class(TDatabase)
  private
  private
    FSession: TSession;
  protected
    constructor Create;
  public
    destructor Destroy; override;
    function Clone: TDBDB2; reintroduce;
  end;

  TDBDB2Singleton = class(TSingleton)
  private
    FDatabase: TDBDB2;
  protected
    constructor Create; override;
    destructor Destroy; override;
  public
    class function Instance: TDBDB2Singleton; reintroduce;
    property Database: TDBDB2 read FDatabase;
  end;

implementation

{ TDBDB2 }

function TDBDB2.Clone: TDBDB2;
begin
  Result := nil;
  try
    Result := TDBDB2.Create;
    Result.Connect;
  except
    Result.Free;
    raise;
  end;
end;

constructor TDBDB2.Create;
begin
  inherited;
  FSession := TSession.Create;
end;

destructor TDBDB2.Destroy;
begin
  FSession.Free;
  inherited;
end;

{ TDBDB2Singleton }

constructor TDBDB2Singleton.Create;
begin
  inherited;
  Register(TDBDB2Singleton.ClassName, Self);
  FDatabase := TDBDB2.Create;
end;

destructor TDBDB2Singleton.Destroy;
begin
  FDatabase.Free;
  inherited;
end;

class function TDBDB2Singleton.Instance: TDBDB2Singleton;
begin
  Result := inherited Instance as TDBDB2Singleton;
end;

end.
