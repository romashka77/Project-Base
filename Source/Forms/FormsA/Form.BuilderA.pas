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
    procedure BuildMainMenu(Menu: TFmxObject); override;
  public
    procedure BuildTitle(t: string); override;
    function BuildButtonPanel: TFmxObject; override;
    procedure BuildCloseButton(Owner: TFmxObject); override;
    procedure BuildOkButton(Owner: TFmxObject); override;
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
  FMX.StdCtrls, FMX.Layouts, System.UITypes, FMX.Edit,
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

function TFormBuilderA.BuildButtonPanel: TFmxObject;
begin
  // Result := BuildPanel(TPanel.Create(FForm.sbContent), 0, 0, 0, 26, TAlignLayout.Bottom);
  Result := BuildPanel(TLayout.Create(FForm.sbContent), 0, 0, 0, 26,
    TAlignLayout.Bottom);
end;

procedure TFormBuilderA.BuildChildForm;
begin
  inherited;
  CreateForm;

  // Form.GetSettings;
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

  // Form.GetSettings;
end;

procedure TFormBuilderA.BuildMainMenu(Menu: TFmxObject);
begin
  inherited;
  Menu.Parent := Form;
  // Menu.Align := TAlignLayout.;
  // FForm.rctContent.Parent := Menu;
end;

procedure TFormBuilderA.BuildModalForm;
begin
  inherited;
  CreateForm;

  // BuildMainMenu(TfrMainMenu.Create(Form));
  // Form.GetSettings;
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

end.
