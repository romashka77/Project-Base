unit Menu.BuilderA;

interface

uses System.Classes, FMX.Types, FMX.Menus,
  Menu.Builder;

type
  TMenuBuilderA = class(TMenuBuilder)
  public
    procedure BuildMainMenu; override;
    // procedure BuildPopupMenu; override;
  public
    procedure SetEnable; override;
    function Find(aItem: string): TMenuItem; override;
    procedure BuildItem(aItem: string; aHandler: TNotifyEvent = nil); override;
    procedure BuildSubItem(aParentItem: TFmxObject; aItem: string;
      aHandler: TNotifyEvent = nil); overload; override;
    procedure BuildSubItem(aParentItem, aItem: string;
      aHandler: TNotifyEvent = nil); overload; override;
    procedure BuildSubLine(aParentItem: string); override;
  end;

implementation

uses System.SysUtils,
  Form.Builder // , FrameMainMenu
  // ufrMainMenuA
    ;

{ TMenuBuilderA }

procedure TMenuBuilderA.BuildItem(aItem: string; aHandler: TNotifyEvent);
var
  Item: TMenuItem;
begin
  Item := TMenuItem.Create(FMenu);
  Item.Text := aItem;
  FMenu.AddObject(Item);
end;

procedure TMenuBuilderA.BuildMainMenu;
begin
  FMenu := TMenuBar.Create(TFormBuilderSingleton.Instance.Builder.Form);
end;

procedure TMenuBuilderA.BuildSubItem(aParentItem, aItem: string;
  aHandler: TNotifyEvent);
begin
  BuildSubItem(Find(aParentItem), aItem, aHandler);
end;

procedure TMenuBuilderA.BuildSubLine(aParentItem: string);
begin
  BuildSubItem(Find(aParentItem), '-');
end;

function TMenuBuilderA.Find(aItem: string): TMenuItem;
var
  i: Integer;
  m: TMenuBar;
  function Find(aParentItem: TMenuItem; aItem: string): TMenuItem;
  var
    i: Integer;
  begin
    Result := nil;
    // item.ClassName
    if aParentItem.Text = aItem then
      Exit(aParentItem);
    for i := 0 to aParentItem.ItemsCount - 1 do
    begin
      if Assigned(Result) then
        Break;
      Result := Find(aParentItem.Items[i], aItem);
    end;
  end;

begin
  Result := nil;
  m := FMenu as TMenuBar;
  for i := 0 to m.ItemsCount - 1 do
  begin
    Result := Find(m.Items[i], aItem);
    if Assigned(Result) then
      Exit
  end;
end;

procedure TMenuBuilderA.SetEnable;

var
  i: Integer;
  m: TMenuBar;
  procedure Find(m: TMenuItem);
  var
    i: Integer;
  begin
    for i := 0 to m.ItemsCount - 1 do
    begin
      m.Items[i].Enabled := (m.Items[i].ItemsCount > 0) or
        Assigned(m.Items[i].OnClick);
      Find(m.Items[i]);
    end;
  end;

begin
  m := (FMenu as TMenuBar);
  for i := 0 to m.ItemsCount - 1 do
  begin
    m.Items[i].Enabled := (m.Items[i].ItemsCount > 0) or
      Assigned(m.Items[i].OnClick);
    Find(m.Items[i]);
  end;
end;

procedure TMenuBuilderA.BuildSubItem(aParentItem: TFmxObject; aItem: string;
  aHandler: TNotifyEvent);
var
  Item: TMenuItem;
begin
  Item := TMenuItem.Create(FMenu);
  Item.Text := aItem;
  aParentItem.AddObject(Item);
end;

end.
