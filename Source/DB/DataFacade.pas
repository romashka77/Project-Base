unit DataFacade;

interface

uses
  DataBase;

type
  TDBProcedure = procedure(aDatabase: TDatabase) of object;

  TData = class
    class function Connection: TDatabase;
    class procedure DoInTransaction(const aProcedures
      : array of TDBProcedure);
  end;

implementation

{ TData }

class function TData.Connection: TDatabase;
begin
//  Result := TDBFirebirdSingleton.Instance.Database.Clone;
end;

class procedure TData.DoInTransaction(const aProcedures
  : array of TDBProcedure);
var
  db: TDatabase;
  i: Integer;
begin
  db := TData.Connection;
  try
    db.StartTransaction;
    try
      for i := Low(aProcedures) to High(aProcedures) do
        aProcedures[i](db);
      db.Commit;
    except
      db.Rollback;
      raise;
    end;
  finally
    db.Free;
  end;
end;

end.
