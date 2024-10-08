unit Menu.BuilderA;

interface

uses System.Classes, FMX.Types, FMX.Menus,
  Menu.Builder, FMX.Controls;

type
  TMenuBuilderA = class(TMenuBuilder)
  private
  public
    procedure BuildMainMenu; override;
    // procedure BuildPopupMenu; override;
  public
    procedure SetEnable; override;
    function Find(aItem: string): TControl; override;
    procedure BuildItem(aItem: string; aHandler: TNotifyEvent = nil); override;
    procedure BuildSubItem(aParentItem: TFmxObject; aItem: string;
      aHandler: TNotifyEvent = nil); overload; override;
    procedure BuildSubItem(aParentItem, aItem: string;
      aHandler: TNotifyEvent = nil); overload; override;
    procedure BuildSubLine(aParentItem: string); override;
  end;

implementation

uses System.SysUtils,
  Form.Builder,
  FMX.StdCtrls, FMX.Forms, FMX.ListBox

  // , FrameMainMenu
  // ufrMainMenuA
    ;

{ TMenuBuilderA }

procedure TMenuBuilderA.BuildItem(aItem: string; aHandler: TNotifyEvent);
var
  Item: TListBoxItem;
begin
  Item := TListBoxItem.Create(FMenu);
  Item.Text := aItem;
  // Item.StyleLookup := 'buttonstyle';

  FMenu.AddObject(Item);
  // FMenu.AddObject(Item);
end;

procedure TMenuBuilderA.BuildMainMenu;
begin
  // FMenu := TMenuBar.Create(TFormBuilderSingleton.Instance.Builder.Form);
  FMenu := TListBox.Create(Application);
end;

procedure TMenuBuilderA.BuildSubItem(aParentItem, aItem: string;
  aHandler: TNotifyEvent);
begin
  // BuildSubItem(Find(aParentItem), aItem, aHandler);
end;

procedure TMenuBuilderA.BuildSubLine(aParentItem: string);
begin
  BuildSubItem(Find(aParentItem), '-');
end;

function TMenuBuilderA.Find(aItem: string): TControl;
var
  i: Integer;
  // m: TMenuBar;
  m: TListBox;
  function Find(aParentItem: TListBoxItem; aItem: string): TListBoxItem;
  var
    i: Integer;
  begin
    Result := nil;
    // item.ClassName
    if aParentItem.Text = aItem then
      Exit(aParentItem);
    { for i := 0 to aParentItem.Count - 1 do
      begin
      if Assigned(Result) then
      Break;
      Result := Find(aParentItem.Items[i], aItem);
      end; }
  end;

begin
  Result := nil;
  // m := FMenu as TMenuBar;
  m := (FMenu as TListBox);
  for i := 0 to m.Count - 1 do
  begin
    if m.Items[i] = aItem then
    begin

      Exit();
    end;
    // Result := Find(m.Items[i], aItem);
    // if Assigned(Result) then
    // Exit
  end;
end;

procedure TMenuBuilderA.SetEnable;

var
  i: Integer;
  m: TListBox;
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
  // m := (FMenu as TMenuBar);
  m := (FMenu as TListBox);
  for i := 0 to m.Count - 1 do
  begin
    // m.Items[i].Enabled := (m.Items[i].ItemsCount > 0) or
    // Assigned(m.Items[i].OnClick);
    // Find(m.Items[i]);
  end;
end;

procedure TMenuBuilderA.BuildSubItem(aParentItem: TFmxObject; aItem: string;
  aHandler: TNotifyEvent);
var
  Item: TListBoxItem;
begin
  // Item := TMenuItem.Create(FMenu);
  Item := TListBoxItem.Create(FMenu);
  Item.Text := aItem;
  FMenu.AddObject(Item);
  // aParentItem.AddObject(Item);
end;

end.
