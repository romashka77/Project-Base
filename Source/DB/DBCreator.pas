unit DBCreator;

interface

uses DataBase, TemplateMethod, DBDB2, DBFirebird;

type
  TDBCreator = class(TCreator)
  protected
    function CreateProduct: TDatabase; reintroduce;
  public
    // основное подключение
    function Get: TDatabase; reintroduce;
    // отдельное пдключение (например, для выполнения долгой задачи)
    function GetOne: TDatabase;
  end;

implementation

{ TDBCreator }

function TDBCreator.CreateProduct: TDatabase;
begin
  case TDBLoginSingleton.Instance.Server of
    dbsDB2:
      Result := TDBDB2Singleton.Instance.DataBase;
    // dbsFiles:
    dbsFirebird:
      Result := TDBFirebirdSingleton.Instance.DataBase;
  else
    raise EDBCreator.Create('Не известный тип БД');
  end;
end;

function TDBCreator.Get: TDatabase;
begin
  Result := nil;
end;

function TDBCreator.GetOne: TDatabase;
begin
  Result := nil;
end;

end.
