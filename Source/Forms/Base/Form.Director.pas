unit Form.Director;

interface

uses Singleton, Builder, Form.Builder, Form.ProductClass, Handler,
  TemplateMethod;

type
  TFormDirector = class(TInterfacedObject, IDirector, IHandler, ITemplateMethod)
  protected
    // Строитель фоормы
    FBuilder: TFormBuilder;
    // Приемник
    FSuccessor: TFormDirector;
    // Умеет конструировать форму указанного класса?
    function CanConstruct(aFormClass: TFormProductClass): Boolean; virtual;
    // Конструирование формы
    procedure Constructing; virtual;
    // Назначает приемника в цепочке обязанностей
    procedure SetSuccessor; virtual;
  public
    // Конструировать форму указанного класса
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
  // если умеет конструировать форму указанного класса
  if CanConstruct(aFormClass) then
    // то конструирует
    Constructing
  else
  begin
    // иначе передает конструирование формы по цепочке приемнику
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
