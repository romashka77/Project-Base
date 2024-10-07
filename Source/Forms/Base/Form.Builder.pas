unit Form.Builder;

interface

uses FMX.Controls, FMX.Types, System.Classes,
  Singleton, Builder, Form.Base, ControlMediator;

type
  TBuildButton = procedure(Owner: TFmxObject) of object;

  TFormBuilder = class(TInterfacedObject, IBuilder)
  private
    FControlMediator: TControlMediator;
  protected
    FForm: TfmBase;
    procedure CreateForm; virtual;
    procedure CreateMainForm; virtual;
  public
    procedure BuildControlMediator; virtual;
    procedure BuildMainForm; virtual; abstract;
    procedure BuildModalForm; virtual; abstract;
    procedure BuildChildForm; virtual; abstract;
    procedure BuildMainMenu(Menu: TControl); virtual; abstract;
    procedure BuildFooter; virtual; abstract;
    procedure BuildHeader; virtual; abstract;

  public
    procedure SetFormName(aName: string); virtual;
    procedure LoadFormState; virtual;
    procedure BuildTitle(t: string); virtual; abstract;
    procedure BuildButtonPanel; virtual; abstract;
    procedure BuildCloseButton(Owner: TFmxObject); virtual; abstract;
    procedure BuildOkButton(Owner: TFmxObject); virtual; abstract;
    procedure BuildYesButton(Owner: TFmxObject); virtual; abstract;
    procedure BeginUpdate; virtual;
    procedure EndUpdate; virtual;
  public
    function BuildPanel(Default: TControl; x, y, w, h: Single;
      Align: TAlignLayout): TControl; virtual; abstract;
    function BuildLabel(Default: TControl; x, y, w, h: Single;
      Align: TAlignLayout; Title: string): TControl; virtual; abstract;
    function BuildEdit(Default: TControl; x, y, w, h: Single;
      Align: TAlignLayout; Text: string): TControl; virtual; abstract;
    function BuildButton(Default: TControl; x, y, w, h: Single;
      Align: TAlignLayout; NotifyEvent: TNotifyEvent; Title: string): TControl;
      virtual; abstract;
    procedure BuildButtons(Owner: TFmxObject;
      aBuildButton: array of TBuildButton); virtual;
  public
    property CM: TControlMediator read FControlMediator;
    function Get: TfmBase;
    // property Form: TfmBase read FForm;
  end;

  TFormBuilderSingleton = class(TSingleton)
  private
    FBuilder: TFormBuilder;
  protected
    constructor Create; override;
  public
    destructor Destroy; override;
    class function Instance: TFormBuilderSingleton; reintroduce;
    property Builder: TFormBuilder read FBuilder;
  end;

implementation

uses FMX.Forms,
  Form.BuilderA
  // , Form.BuilderB
    ;

{ TFormBuilderSingleton }

constructor TFormBuilderSingleton.Create;
begin
  inherited;
  Register(TFormBuilderSingleton.ClassName, Self);
  FBuilder := TFormBuilderA.Create;
  // FBuilder := TFormBuilderB.Create;
end;

destructor TFormBuilderSingleton.Destroy;
begin
  if Assigned(Builder) then
    Builder.Free;
  inherited;
end;

class function TFormBuilderSingleton.Instance: TFormBuilderSingleton;
begin
  Result := inherited Instance as TFormBuilderSingleton;
end;

{ TFormBuilder }

procedure TFormBuilder.BeginUpdate;
begin
  FForm.BeginUpdate;
end;

procedure TFormBuilder.BuildButtons(Owner: TFmxObject;
  aBuildButton: array of TBuildButton);
var
  p: TBuildButton;
begin
  for p in aBuildButton do
    p(Owner);
end;

procedure TFormBuilder.BuildControlMediator;
begin
  FControlMediator := TControlMediator.Get(FForm);
end;

procedure TFormBuilder.CreateForm;
begin
  FForm := TfmBase.Create(Application);
end;

procedure TFormBuilder.CreateMainForm;
begin
  CreateForm;
  Application.MainForm := FForm;
end;

procedure TFormBuilder.EndUpdate;
begin
  FForm.EndUpdate;
end;

function TFormBuilder.Get: TfmBase;
begin
  Result := FForm;
end;

procedure TFormBuilder.LoadFormState;
begin
  FForm.LoadFormState;
end;

procedure TFormBuilder.SetFormName(aName: string);
begin
  FForm.Name := aName;
end;

end.
