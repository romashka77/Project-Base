unit ControlMediator;

interface

uses FMX.StdCtrls, FMX.Controls, FMX.Types,
  SelfCreator, Mediator;

type
  TControlMediator = class(TSelfCreator, IMediator)
  private
    FOwner: TFMXObject;
    function GetCloseButtonName: string;
    function GetCloseButton: TButton;
    function GetControl(aName: string): TFMXObject;
  protected
    constructor Create(aOwner: TFMXObject); reintroduce;
  public
    property CloseButtonName: string read GetCloseButtonName;
  public
    property CloseButton: TButton read GetCloseButton;
  public
    class function Get(aOwner: TFMXObject): TControlMediator; reintroduce;
  end;

implementation

uses Form.Base;
{ TControlMediator }

constructor TControlMediator.Create(aOwner: TFMXObject);
begin
  FOwner := aOwner;
end;

class function TControlMediator.Get(aOwner: TFMXObject): TControlMediator;
begin
  Result:=TControlMediator.Create(aOwner);
end;

function TControlMediator.GetCloseButton: TButton;
begin
  Result := GetControl(GetCloseButtonName) as TButton;
end;

function TControlMediator.GetCloseButtonName: string;
begin
  Result := 'CloseButton';
end;

function TControlMediator.GetControl(aName: string): TFMXObject;
  function Find(aControl: TFMXObject; aName: string): TFMXObject;
  var
    control: TFMXObject;
  begin
    Result := nil;
    if aControl.Name = aName then
      Exit(aControl);
    for control in aControl.Children do
    begin
      if Assigned(Result) then
        Break;
      if not(control is TControl) then
        Continue;
      Result := Find(control, aName);
    end;
  end;

begin
  Result := Find(FOwner as TfmBase, aName);
end;

end.
