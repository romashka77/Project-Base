unit uDBOracle;

interface

uses uDataBase, Data.DB;

type
  TOraSession = class(TSession)

  end;

  TDBOracle = class(TDataBase)
  private
    FSession: TOraSession;
    function Call(aName: string; const aParams: array of Variant): Variant;
  protected
    constructor Create;
  public
    destructor Destroy; override;
    function Clone: TDBOracle; reintroduce;
    function Cmd(aCommand: string; const aParams: array of Variant)
      : Variant; override;
    procedure Commit; override;
    procedure Connect; override;
    function Connected: Boolean; override;
    function Dataset(aCommand: string; const aParams: array of Variant)
      : TDataset; override;
    procedure Disconnect; override;
    function Func(aName: string; const aParams: array of Variant)
      : Variant; override;
    function InTransaction: Boolean; override;
    procedure Proc(aName: string; const aParams: array of Variant); override;
    procedure Rollback; override;
    procedure StartTransaction; override;
  end;

implementation

{ TDBOracle }

function TDBOracle.Call(aName: string; const aParams: array of Variant)
  : Variant;
begin

end;

function TDBOracle.Clone: TDBOracle;
begin

  { Result := nil;
    try
    Result := TDBOracle.Create;
    Result.Connect;
    except
    Result.Free;
    end; }
end;

function TDBOracle.Cmd(aCommand: string;
  const aParams: array of Variant): Variant;
var
  oraSQL: TOraSQL;
  i: Integer;
begin
  Result := varEmpty;
  oraSQL := TOraSQL.Create(nil);
  try
    oraSQL.Session := FSession;
    oraSQL.SQL.Text := aCommand;
    for i := Low(aParams) to High(aParams) do
      oraSQL.Params[i].Value := aParams[i];
    oraSQL.Execute;
    if Assigned(oraSQL.Params.FindParam(_RESULT)) then
      Result := oraSQL.ParamByName(_RESULT).Value;
  finally
    oraSQL.Free;
  end;
end;

procedure TDBOracle.Commit;
begin
  inherited;

end;

procedure TDBOracle.Connect;
begin
  inherited;

end;

function TDBOracle.Connected: Boolean;
begin

end;

constructor TDBOracle.Create;
begin

end;

function TDBOracle.Dataset(aCommand: string; const aParams: array of Variant)
  : TDataset;
begin

end;

destructor TDBOracle.Destroy;
begin
  FSession.Disconnect;
  FSession.Free;
  inherited;
end;

procedure TDBOracle.Disconnect;
begin
  inherited;

end;

function TDBOracle.Func(aName: string; const aParams: array of Variant)
  : Variant;
begin

end;

function TDBOracle.InTransaction: Boolean;
begin

end;

procedure TDBOracle.Proc(aName: string; const aParams: array of Variant);
begin
  inherited;

end;

procedure TDBOracle.Rollback;
begin
  inherited;

end;

procedure TDBOracle.StartTransaction;
begin
  inherited;

end;

end.
