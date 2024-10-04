unit FormMessageDirector;

interface

uses
  Form.Director, Form.ProductClass;

type
  TFormMessageDirector = class(TFormDirector)
  protected
    function CanConstruct(aFormClass: TFormProductClass): Boolean; override;
    procedure Constructing; override;
    procedure SetSuccessor; override;
  end;

implementation

uses FMX.Types,
  FormItemDirector;

{ TFormMessageDirector }

function TFormMessageDirector.CanConstruct(aFormClass
  : TFormProductClass): Boolean;
begin
  Result := aFormClass = fpcMessage;
end;

procedure TFormMessageDirector.Constructing;
var
  p: TFMXObject;
begin
  FBuilder.BuildModalForm;
  FBuilder.BuildControlMediator;
  FBuilder.BuildTitle('Title');
  p := FBuilder.BuildButtonPanel;
  FBuilder.BuildCloseButton(p);
end;

procedure TFormMessageDirector.SetSuccessor;
begin
  FSuccessor := TFormItemDirector.Create(FBuilder);
end;

end.
