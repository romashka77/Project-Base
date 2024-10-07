unit FormListDirector;

interface

uses Form.Director, Form.ProductClass;

type
  TFormListDirector = class(TFormDirector)
  protected
    function CanConstruct(aFormClass: TFormProductClass): Boolean; override;
    procedure Constructing; override;
    procedure SetSuccessor; override;
  end;

implementation

uses FMX.Types,
  FormLoginDirector;

{ TFormListDirector }

function TFormListDirector.CanConstruct(aFormClass: TFormProductClass): Boolean;
begin
  Result := aFormClass = fpcList;
end;

procedure TFormListDirector.Constructing;
begin
  FBuilder.BuildChildForm;
  FBuilder.SetFormName('ListForm');
  FBuilder.BuildControlMediator;

  FBuilder.BuildButtonPanel;
end;

procedure TFormListDirector.SetSuccessor;
begin
  FSuccessor := TFormLoginDirector.Create(FBuilder);
end;

end.
