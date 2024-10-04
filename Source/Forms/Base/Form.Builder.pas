unit Form.Builder;

interface

uses FMX.Controls, FMX.Types, System.Classes,
  Singleton, Builder, Form.Base, ControlMediator;

type
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
    procedure BuildMainMenu(Menu: TFmxObject); virtual; abstract;
  public
    procedure BuildTitle(t: string); virtual; abstract;
    function BuildButtonPanel: TFMXObject; virtual; abstract;
    procedure BuildCloseButton(Owner: TFMXObject); virtual; abstract;
    procedure BuildOkButton(Owner: TFMXObject); virtual; abstract;
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
  public
    property CM: TControlMediator read FControlMediator;
    property Form: TfmBase read FForm;
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

procedure TFormBuilder.BuildControlMediator;
begin
  FControlMediator := TControlMediator.Get(Form);
end;

procedure TFormBuilder.CreateForm;
begin
  FForm := TfmBase.Create(Application);
end;

procedure TFormBuilder.CreateMainForm;
begin
  CreateForm;
  Application.MainForm := Form;
end;

end.
