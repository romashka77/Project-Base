unit Menu.Builder;

interface

uses FMX.Menus, System.Classes, FMX.Types,
  Singleton, Builder, FMX.Controls;

type
  TMenuBuilder = class(TInterfacedObject, IBuilder)
  private
  protected
    FMenu: TControl;
    function Find(aItem: string): TControl; virtual; abstract;
  public
    procedure SetEnable; virtual; abstract;
    procedure BuildLine; virtual; abstract;
    procedure BuildItem(aItem: string; aHandler: TNotifyEvent = nil);
      virtual; abstract;
    procedure BuildSubLine(aParentItem: string); virtual; abstract;
    procedure BuildSubItem(aParentItem, aItem: string;
      aHandler: TNotifyEvent = nil); overload; virtual; abstract;
    procedure BuildSubItem(aParentItem: TFmxObject; aItem: string;
      aHandler: TNotifyEvent = nil); overload; virtual; abstract;
    procedure BeginUpdate; virtual;
    procedure EndUpdate; virtual;
  public
    procedure BuildMainMenu; virtual; abstract;
    procedure BuildPopupMenu; virtual; abstract;
  public
    function Get: TControl;
  end;

  TMenuBuilderSingleton = class(TSingleton)
  private
    FBuilder: TMenuBuilder;
  protected
    constructor Create; override;
  public
    destructor Destroy; override;
    class function Instance: TMenuBuilderSingleton; reintroduce;
    property Builder: TMenuBuilder read FBuilder;
  end;

implementation

uses Menu.BuilderA;

{ TMenuBuilderSingleton }

constructor TMenuBuilderSingleton.Create;
begin
  inherited;
  Register(TMenuBuilderSingleton.ClassName, Self);
  FBuilder := TMenuBuilderA.Create;
end;

destructor TMenuBuilderSingleton.Destroy;
begin
  if Assigned(Builder) then
    Builder.Free;
  inherited;
end;

class function TMenuBuilderSingleton.Instance: TMenuBuilderSingleton;
begin
  Result := inherited Instance as TMenuBuilderSingleton;
end;

{ TMenuBuilder }

procedure TMenuBuilder.BeginUpdate;
begin
  FMenu.BeginUpdate;
end;

procedure TMenuBuilder.EndUpdate;
begin
  FMenu.EndUpdate;
end;

function TMenuBuilder.Get: TControl;
begin
  Result := FMenu;
end;

end.
