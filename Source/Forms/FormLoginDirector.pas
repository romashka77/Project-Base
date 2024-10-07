unit FormLoginDirector;

interface

uses Form.Director, Form.ProductClass;

type
  TFormLoginDirector = class(TFormDirector)
  protected
    function CanConstruct(aFormClass: TFormProductClass): Boolean; override;
    procedure Constructing; override;
    procedure SetSuccessor; override;
  end;

implementation

uses FMX.Types, FMX.Layouts, FMX.StdCtrls, System.SysUtils, FMX.Edit,
  FormMainDirector;

{ TFormLoginDirector }

function TFormLoginDirector.CanConstruct(aFormClass: TFormProductClass)
  : Boolean;
begin
  Result := aFormClass = fpcLogin;
end;

procedure TFormLoginDirector.Constructing;
var
  panel, panel0: TFmxObject;
begin
  FBuilder.BuildModalForm;
  FBuilder.SetFormName('LoginForm');
  FBuilder.BuildControlMediator;

  panel0 := FBuilder.BuildPanel(TLayout.Create(FBuilder.Get), 0, 0, 0, 26,
    TAlignLayout.Top);
  panel := FBuilder.BuildPanel(TLayout.Create(panel0), 0, 0, 100, 26,
    TAlignLayout.Left);
  FBuilder.BuildLabel(TLabel.Create(panel), 0, 0, 0, 22, TAlignLayout.Client,
    'Сервер');
  panel := FBuilder.BuildPanel(TLayout.Create(panel0), 0, 0, 100, 26,
    TAlignLayout.Client);
  FBuilder.BuildEdit(TEdit.Create(panel), 0, 0, 0, 22, TAlignLayout.Client,
    EmptyStr);

  panel0 := FBuilder.BuildPanel(TLayout.Create(FBuilder.Get), 0, 0, 0, 26,
    TAlignLayout.Top);
  panel := FBuilder.BuildPanel(TLayout.Create(panel0), 0, 0, 100, 26,
    TAlignLayout.Left);
  FBuilder.BuildLabel(TLabel.Create(panel), 0, 0, 0, 22, TAlignLayout.Client,
    'Пользователь');
  panel := FBuilder.BuildPanel(TLayout.Create(panel0), 0, 0, 100, 26,
    TAlignLayout.Client);
  FBuilder.BuildEdit(TEdit.Create(panel), 0, 0, 0, 22, TAlignLayout.Client,
    EmptyStr);

  panel0 := FBuilder.BuildPanel(TLayout.Create(FBuilder.Get), 0, 0, 0, 26,
    TAlignLayout.Top);
  panel := FBuilder.BuildPanel(TLayout.Create(panel0), 0, 0, 100, 26,
    TAlignLayout.Left);
  FBuilder.BuildLabel(TLabel.Create(panel), 0, 0, 0, 22, TAlignLayout.Client,
    'Пароль');
  panel := FBuilder.BuildPanel(TLayout.Create(panel0), 0, 0, 100, 26,
    TAlignLayout.Client);
  FBuilder.BuildEdit(TEdit.Create(panel), 0, 0, 0, 22, TAlignLayout.Client,
    EmptyStr);

  FBuilder.BuildButtonPanel;
end;

procedure TFormLoginDirector.SetSuccessor;
begin
  FSuccessor := TFormMainDirector.Create(FBuilder);
end;

end.
