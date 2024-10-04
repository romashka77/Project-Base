unit DataBase;

interface

uses
  System.SysUtils, Prototype, Product, Singleton, Data.DB;

type
  // параметры подкючения к базе данных
  TDBServer = (dbsFiles, dbsFirebird, dbsDB2, dbsOracole);

  // подключение к базе данных
  TDatabase = class(TInterfacedObject, IPrototype, IProduct)
  public
    function Clone: IPrototype; virtual; abstract;
    function Cmd(aCommand: string; const aParams: array of Variant): Variant;
      virtual; abstract;
    procedure Commit; virtual; abstract;
    procedure Connect; virtual; abstract;
    function Connected: Boolean; virtual; abstract;
    function Dataset(aCommand: string; const aParams: array of Variant)
      : TDataset; virtual; abstract;
    procedure Disconnect; virtual; abstract;
    function Func(aName: string; const aParams: array of Variant): Variant;
      virtual; abstract;
    function InTransaction: Boolean; virtual; abstract;
    procedure Proc(aName: string; const aParams: array of Variant);
      virtual; abstract;
    procedure Rollback; virtual; abstract;
    procedure StartTransaction; virtual; abstract;
  end;

  EDBCreator = class(Exception)
  end;

  TSession = class
  private
    FDatabase: string;
    FPassword: string;
    FServer: string;
    FLogin: string;
  public
    property Login: string read FLogin write FLogin;
    property Database: string read FDatabase;
    property Password: string read FPassword;
    property Server: string read FServer;
  end;

  TDBLoginSingleton = class(TSingleton)
  private
    FDatabase: string;
    FPassword: string;
    FLogin: string;
    FServer: TDBServer;
  protected
    constructor Create; override;
  public
    property Login: string read FLogin;
    property Server: TDBServer read FServer;
    class function Instance: TDBLoginSingleton; reintroduce;
  end;

implementation

{ TDBLoginSingleton }

constructor TDBLoginSingleton.Create;
begin
  inherited;
  Register(TDBLoginSingleton.ClassName, Self);
  FDatabase := '';
  FPassword := '';
  FLogin := '';
  FServer := dbsFiles;
end;

class function TDBLoginSingleton.Instance: TDBLoginSingleton;
begin
  Result := inherited Instance as TDBLoginSingleton;
end;

end.
