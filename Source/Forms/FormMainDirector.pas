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
begin
  FBuilder.BuildMainForm;
  FBuilder.BeginUpdate;
  try
    FBuilder.BuildControlMediator;

    FBuilder.SetFormName('MainForm');
    FBuilder.BuildHeader;

    TMenuDirectorSingleton.Instance.Director.Construct(mpcMainMenu);
    FBuilder.BuildMainMenu(TMenuBuilderSingleton.Instance.Builder.Get);

    FBuilder.BuildButtonPanel;

    FBuilder.BuildFooter;

    FBuilder.LoadFormState;
  finally
    FBuilder.EndUpdate;
  end;
end;

procedure TFormMainDirector.SetSuccessor;
begin
  FSuccessor := nil
end;

end.
