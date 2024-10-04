unit Form.Director;

interface

uses Singleton, Builder, Form.Builder, Form.ProductClass, Handler,
  TemplateMethod;

type
  TFormDirector = class(TInterfacedObject, IDirector, IHandler, ITemplateMethod)
  protected
    // ��������� ������
    FBuilder: TFormBuilder;
    // ��������
    FSuccessor: TFormDirector;
    // ����� �������������� ����� ���������� ������?
    function CanConstruct(aFormClass: TFormProductClass): Boolean; virtual;
    // ��������������� �����
    procedure Constructing; virtual;
    // ��������� ��������� � ������� ������������
    procedure SetSuccessor; virtual;
  public
    // �������������� ����� ���������� ������
    procedure Construct(aFormClass: TFormProductClass);
    constructor Create(aBuilder: TFormBuilder);
    destructor Destroy; override;
  end;

  TFormDirectorSingleton = class(TSingleton)
  private
    FDirector: TFormDirector;
  protected
    constructor Create; override;
  public
    destructor Destroy; override;
    class function Instance: TFormDirectorSingleton; reintroduce;
    property Director: TFormDirector read FDirector;
  end;

implementation

uses FormMessageDirector;

{ TFormDirectorSingleton }

constructor TFormDirectorSingleton.Create;
begin
  inherited;
  Register(TFormDirectorSingleton.ClassName, Self);
  FDirector := TFormDirector.Create(TFormBuilderSingleton.Instance.Builder);
end;

destructor TFormDirectorSingleton.Destroy;
begin
  if Assigned(Director) then
    Director.Free;
  inherited;
end;

class function TFormDirectorSingleton.Instance: TFormDirectorSingleton;
begin
  Result := inherited Instance as TFormDirectorSingleton;
end;

{ TFormDirector }

function TFormDirector.CanConstruct(aFormClass: TFormProductClass): Boolean;
begin
  Result := False;
end;

procedure TFormDirector.Construct(aFormClass: TFormProductClass);
begin
  // ���� ����� �������������� ����� ���������� ������
  if CanConstruct(aFormClass) then
    // �� ������������
    Constructing
  else
  begin
    // ����� �������� ��������������� ����� �� ������� ���������
    if not Assigned(FSuccessor) then
      SetSuccessor;
    FSuccessor.Construct(aFormClass);
  end;
end;

procedure TFormDirector.Constructing;
begin

end;

constructor TFormDirector.Create(aBuilder: TFormBuilder);
begin
  FBuilder := aBuilder;
end;

destructor TFormDirector.Destroy;
begin
  if Assigned(FSuccessor) then
    FSuccessor.Free;
  inherited;
end;

procedure TFormDirector.SetSuccessor;
begin
  FSuccessor := TFormMessageDirector.Create(FBuilder);
end;

end.
