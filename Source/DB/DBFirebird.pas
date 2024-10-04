unit DBFirebird;

interface

uses DataBase, Singleton;

type
  TDBFirebird = class(TDatabase)
  private
    FSession: TSession;
  protected
    constructor Create;
  public
    destructor Destroy; override;
    function Clone: TDBFirebird; reintroduce;
  end;

  TDBFirebirdSingleton = class(TSingleton)
  private
    FDatabase: TDBFirebird;
  protected
    constructor Create; override;
  public
    class function Instance: TDBFirebirdSingleton; reintroduce;
    property Database: TDBFirebird read FDatabase;
    destructor Destroy; override;
  end;

implementation

{ TDBFirebird }

function TDBFirebird.Clone: TDBFirebird;
begin
  Result := nil;
  try
    Result := TDBFirebird.Create;
    Result.Connect;
  except
    Result.Free;
    raise;
  end;
end;

constructor TDBFirebird.Create;
var
  Login: TDBLoginSingleton;
begin
  inherited;
  FSession := TSession.Create;
  try
    Login := TDBLoginSingleton.Instance;
    FSession.Login := Login.Login;
  finally

  end;
end;

destructor TDBFirebird.Destroy;
begin
  FSession.Free;
  inherited;
end;

{ TDBFirebirdSingleton }

constructor TDBFirebirdSingleton.Create;
begin
  inherited;
  Register(TDBFirebirdSingleton.ClassName, Self);
  FDatabase := TDBFirebird.Create;
end;

destructor TDBFirebirdSingleton.Destroy;
begin
  FDatabase.Free;
  inherited;
end;

class function TDBFirebirdSingleton.Instance: TDBFirebirdSingleton;
begin
  Result := inherited Instance as TDBFirebirdSingleton;
end;

end.
