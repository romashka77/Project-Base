unit DBCreator;

interface

uses DataBase, TemplateMethod, DBDB2, DBFirebird;

type
  TDBCreator = class(TCreator)
  protected
    function CreateProduct: TDatabase; reintroduce;
  public
    // �������� �����������
    function Get: TDatabase; reintroduce;
    // ��������� ���������� (��������, ��� ���������� ������ ������)
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
    raise EDBCreator.Create('�� ��������� ��� ��');
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
