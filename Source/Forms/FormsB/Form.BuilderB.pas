unit Form.BuilderB;

interface

uses Form.Builder;

type
  TFormBuilderB = class(TFormBuilder)
  public
    procedure BuildMainForm; override;
    procedure BuildModalForm; override;
    procedure BuildChildForm; override;
  end;

implementation

uses Form.Base, FMX.Forms;
{ TFormBuilderB }

procedure TFormBuilderB.BuildChildForm;
begin
  inherited;
  CreateForm;
  Form.Position := TFormPosition.MainFormCenter;
  Form.Show;
end;

procedure TFormBuilderB.BuildMainForm;
begin
  inherited;
  CreateMainForm;
  Form.Position := TFormPosition.ScreenCenter;
  Form.Show;
end;

procedure TFormBuilderB.BuildModalForm;
begin
  inherited;
  CreateForm;
  Form.Position := TFormPosition.MainFormCenter;
  Form.ShowModal;
end;

end.
