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
begin
  FBuilder.BuildModalForm;
  FBuilder.SetFormName('ItemForm');
  FBuilder.BuildControlMediator;
  FBuilder.BuildButtonPanel;
end;

procedure TFormItemDirector.SetSuccessor;
begin
  FSuccessor := TFormListDirector.Create(FBuilder);
end;

end.
