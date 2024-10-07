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
end;

procedure TFormBuilderB.BuildMainForm;
begin
  inherited;
  CreateMainForm;
end;

procedure TFormBuilderB.BuildModalForm;
begin
  inherited;
  CreateForm;
end;

end.
