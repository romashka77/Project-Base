unit Form.BuilderA;

interface

uses FMX.Controls, System.Classes, FMX.Types,
  Form.Builder;

type
  TFormBuilderA = class(TFormBuilder)
  protected
  public
    procedure BuildControlMediator; override;
    procedure BuildMainForm; override;
    procedure BuildModalForm; override;
    procedure BuildChildForm; override;
    procedure BuildMainMenu(Menu: TControl); override;
  public
    procedure BuildTitle(t: string); override;
    procedure BuildButtonPanel; override;
    procedure BuildCloseButton(Owner: TFmxObject); override;
    procedure BuildOkButton(Owner: TFmxObject); override;
    procedure BuildYesButton(Owner: TFmxObject); override;
    procedure BuildFooter; override;
    procedure BuildHeader; override;
  public
    function BuildPanel(Default: TControl; x, y, w, h: Single;
      Align: TAlignLayout): TControl; override;
    function BuildLabel(Default: TControl; x, y, w, h: Single;
      Align: TAlignLayout; Title: string): TControl; override;
    function BuildEdit(Default: TControl; x, y, w, h: Single;
      Align: TAlignLayout; Text: string): TControl; override;
    function BuildButton(Default: TControl; x, y, w, h: Single;
      Align: TAlignLayout; NotifyEvent: TNotifyEvent; Title: string)
      : TControl; override;
  end;

implementation

uses // FMX.Types,
  FMX.StdCtrls, FMX.Layouts, System.UITypes, FMX.Edit, FMX.MultiView, FMX.Forms,
  ControlMediator, Form.Base;
{ TFormBuilderA }

function TFormBuilderA.BuildButton(Default: TControl; x, y, w, h: Single;
  Align: TAlignLayout; NotifyEvent: TNotifyEvent; Title: string): TControl;
begin
  Default.Parent := Default.Owner as TFmxObject;
  Default.SetBounds(x, y, w, h);
  Default.Align := Align;
  Default.Margins.Top := 2;
  Default.Margins.Bottom := Default.Margins.Top;
  Default.Margins.Left := Default.Margins.Top;
  Default.Margins.Right := Default.Margins.Top;
  if Default is TButton then
    (Default as TButton).Text := Title;
  Default.OnClick := NotifyEvent;
  Result := Default;
end;

procedure TFormBuilderA.BuildButtonPanel;
begin
  BuildButtons(BuildPanel(TLayout.Create(FForm.Context), 0, 0, 0, 26,
    TAlignLayout.Bottom), [BuildCloseButton, BuildOkButton, BuildYesButton]);
end;

procedure TFormBuilderA.BuildChildForm;
begin
  inherited;
  CreateForm;
end;

procedure TFormBuilderA.BuildCloseButton(Owner: TFmxObject);
begin
  BuildButton(TButton.Create(Owner), 0, 0, 54, 22, TAlignLayout.MostRight, nil,
    'Закрыть');
  // : TControl;
end;

procedure TFormBuilderA.BuildControlMediator;
begin
  inherited;
  FForm.CM := CM;
end;

function TFormBuilderA.BuildEdit(Default: TControl; x, y, w, h: Single;
  Align: TAlignLayout; Text: string): TControl;
begin
  Default.Parent := Default.Owner as TFmxObject;
  Default.SetBounds(x, y, w, h);
  Default.Align := Align;
  Default.Margins.Top := 2;
  Default.Margins.Bottom := Default.Margins.Top;
  Default.Margins.Left := Default.Margins.Top;
  Default.Margins.Right := Default.Margins.Top;
  if Default is TEdit then
    (Default as TEdit).Text := Text;
  Result := Default;
end;

procedure TFormBuilderA.BuildFooter;
var
  StatusBar: TStatusBar;
begin
  StatusBar := TStatusBar.Create(FForm);
  StatusBar.Parent := FForm;
end;

procedure TFormBuilderA.BuildHeader;
begin
end;

function TFormBuilderA.BuildLabel(Default: TControl; x, y, w, h: Single;
  Align: TAlignLayout; Title: string): TControl;
begin
  Default.Parent := Default.Owner as TFmxObject;
  Default.SetBounds(x, y, w, h);
  Default.Align := Align;
  Default.Margins.Top := 2;
  Default.Margins.Bottom := Default.Margins.Top;
  Default.Margins.Left := Default.Margins.Top;
  Default.Margins.Right := Default.Margins.Top;
  if Default is TLabel then
    (Default as TLabel).Text := Title;
  Result := Default;
end;

procedure TFormBuilderA.BuildMainForm;
begin
  inherited;
  CreateMainForm;
end;

procedure TFormBuilderA.BuildMainMenu(Menu: TControl);
var
  MultiView: TMultiView;
  ToolBar: TToolBar;
  MasterButton: TSpeedbutton;

begin
  MultiView := TMultiView.Create(FForm);
  MultiView.BeginUpdate;
  try
    MultiView.Parent := FForm;
    MultiView.TargetControl := FForm.Context;
    MultiView.NavigationPaneOptions.CollapsedWidth := 50;
    MultiView.Mode := TMultiViewMode.PlatformBehaviour;
    // MultiView.Mode := TMultiViewMode.Panel;
    MultiView.ClipChildren := True;
    MultiView.Align := TAlignLayout.MostLeft;
    ToolBar := TToolBar.Create(MultiView);
//    MultiView.AddObject(ToolBar);
    ToolBar.Parent := MultiView;
    ToolBar.Align := TAlignLayout.Top;
    ToolBar.Height := 44;
    MasterButton := TSpeedbutton.Create(ToolBar);
    MasterButton.Parent := ToolBar;
    MasterButton.Align := TAlignLayout.Left;
    MasterButton.Width := 50;
    MasterButton.StyleLookup := 'detailstoolbutton';
    MultiView.MasterButton := MasterButton;

    Menu.Parent := MultiView;
    Menu.Align := TAlignLayout.Top;
  finally
    MultiView.EndUpdate;
  end;

end;

procedure TFormBuilderA.BuildModalForm;
begin
  inherited;
  CreateForm;
end;

procedure TFormBuilderA.BuildOkButton(Owner: TFmxObject);
var
  button: TButton;
begin
  button := BuildButton(TButton.Create(Owner), 0, 0, 54, 22,
    TAlignLayout.MostRight, nil, 'Ok') as TButton;
  button.ModalResult := mrOk;
end;

function TFormBuilderA.BuildPanel(Default: TControl; x, y, w, h: Single;
  Align: TAlignLayout): TControl;
begin
  Default.Parent := Default.Owner as TFmxObject;
  Default.SetBounds(x, y, w, h);
  Default.Align := Align;
  Result := Default;
end;

procedure TFormBuilderA.BuildTitle(t: string);
begin
  inherited;
  FForm.Caption := t;
end;

procedure TFormBuilderA.BuildYesButton(Owner: TFmxObject);
var
  button: TButton;
begin
  button := BuildButton(TButton.Create(Owner), 0, 0, 54, 22,
    TAlignLayout.MostRight, nil, 'Да') as TButton;
  button.ModalResult := mrYes;
end;

end.
