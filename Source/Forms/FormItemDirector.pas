unit FormItemDirector;

interface

uses Form.Director, Form.ProductClass;

type
  TFormItemDirector = class(TFormDirector)
  protected
    function CanConstruct(aFormClass: TFormProductClass): Boolean; override;
    procedure Constructing; override;
    procedure SetSuccessor; override;
  end;

implementation

uses FMX.Types,
  FormListDirector;

{ TFormItemDirector }

function TFormItemDirector.CanConstruct(aFormClass: TFormProductClass): Boolean;
begin
  Result := aFormClass = fpcItem;
end;

procedure TFormItemDirector.Constructing;
var
  p: TFmxObject;
begin
  FBuilder.BuildModalForm;
  FBuilder.BuildControlMediator;
  p := FBuilder.BuildButtonPanel;
  FBuilder.BuildCloseButton(p);
end;

procedure TFormItemDirector.SetSuccessor;
begin
  FSuccessor := TFormListDirector.Create(FBuilder);
end;

end.
