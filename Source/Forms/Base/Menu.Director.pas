unit Menu.Director;

interface

uses Singleton, Builder, Menu.Builder, Menu.ProductClass, Handler,
  TemplateMethod;

type

  TMenuDirector = class(TInterfacedObject, IDirector, IHandler, ITemplateMethod)
  protected
    // Строитель меню
    FBuilder: TMenuBuilder;
    // Приемник
    FSuccessor: TMenuDirector;
    // Умеет конструировать меню указанного класса?
    function CanConstruct(aFormClass: TMenuProductClass): Boolean; virtual;
    // Конструирование формы
    procedure Constructing; virtual;
    // Назначает приемника в цепочке обязанностей
    procedure SetSuccessor; virtual;
  public
    // Конструировать меню указанного класса
    procedure Construct(aMenuClass: TMenuProductClass);
    constructor Create(aBuilder: TMenuBuilder);
    destructor Destroy; override;
  end;

  TMenuDirectorSingleton = class(TSingleton)
  private
    FDirector: TMenuDirector;
  protected
    constructor Create; override;
  public
    destructor Destroy; override;
    class function Instance: TMenuDirectorSingleton; reintroduce;
    property Director: TMenuDirector read FDirector;
  end;

implementation

uses MenuPopupDirector;

{ TMenuDirector }

function TMenuDirector.CanConstruct(aFormClass: TMenuProductClass): Boolean;
begin
  Result := False;
end;

procedure TMenuDirector.Construct(aMenuClass: TMenuProductClass);
begin
  // если умеет конструировать меню указанного класса
  if CanConstruct(aMenuClass) then
    // то конструирует
    Constructing
  else
  begin
    // иначе передает конструирование меню по цепочке приемнику
    if not Assigned(FSuccessor) then
      SetSuccessor;
    FSuccessor.Construct(aMenuClass);
  end;
end;

procedure TMenuDirector.Constructing;
begin

end;

constructor TMenuDirector.Create(aBuilder: TMenuBuilder);
begin
  FBuilder := aBuilder;
end;

destructor TMenuDirector.Destroy;
begin
  if Assigned(FSuccessor) then
    FSuccessor.Free;
  inherited;
end;

procedure TMenuDirector.SetSuccessor;
begin
  FSuccessor := TMenuPopupDirector.Create(FBuilder);
end;

{ TMenuDirectorSingleton }

constructor TMenuDirectorSingleton.Create;
begin
  inherited;
  Register(TMenuDirectorSingleton.ClassName, Self);
  FDirector := TMenuDirector.Create(TMenuBuilderSingleton.Instance.Builder);
end;

destructor TMenuDirectorSingleton.Destroy;
begin
  if Assigned(Director) then
    Director.Free;
  inherited;
end;

class function TMenuDirectorSingleton.Instance: TMenuDirectorSingleton;
begin
  Result := inherited Instance as TMenuDirectorSingleton;
end;

end.
