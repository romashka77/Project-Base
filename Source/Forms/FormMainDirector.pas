unit FormMainDirector;

interface

uses Form.Director, Form.ProductClass;

type
  TFormMainDirector = class(TFormDirector)
  protected
    function CanConstruct(aFormClass: TFormProductClass): Boolean; override;
    procedure Constructing; override;
    procedure SetSuccessor; override;
  end;

implementation

uses FMX.Types,
  Menu.Director, Menu.ProductClass, Menu.Builder;

{ TFormMainDirector }

function TFormMainDirector.CanConstruct(aFormClass: TFormProductClass): Boolean;
begin
  Result := aFormClass = fpcMain;
end;

procedure TFormMainDirector.Constructing;
var
  panel: TFmxObject;
begin
  FBuilder.BuildMainForm;
  FBuilder.BuildControlMediator;

  TMenuDirectorSingleton.Instance.Director.Construct(mpcMain);
  FBuilder.BuildMainMenu(TMenuBuilderSingleton.Instance.Builder.Menu);

  panel := FBuilder.BuildButtonPanel;
  FBuilder.BuildOkButton(panel);
  FBuilder.BuildCloseButton(panel);

end;

procedure TFormMainDirector.SetSuccessor;
begin
  FSuccessor := nil
end;

end.
