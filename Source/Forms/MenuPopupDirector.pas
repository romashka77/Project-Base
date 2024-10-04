unit MenuPopupDirector;

interface

uses Menu.Director, Menu.ProductClass;

type
  TMenuPopupDirector = class(TMenuDirector)
  protected
    function CanConstruct(aMenuClass: TMenuProductClass): Boolean; override;
    procedure Constructing; override;
    procedure SetSuccessor; override;
  end;

implementation

uses MenuMainDirector;

{ TMenuPopupDirector }

function TMenuPopupDirector.CanConstruct(aMenuClass: TMenuProductClass)
  : Boolean;
begin
  Result := aMenuClass = mpcPopup;
end;

procedure TMenuPopupDirector.Constructing;
begin
  // FBuilder.BuildMainForm;
end;

procedure TMenuPopupDirector.SetSuccessor;
begin
  FSuccessor := TMenuMainDirector.Create(FBuilder);
end;

end.
