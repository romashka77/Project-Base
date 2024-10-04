unit FormMainSingleton;

interface

uses Singleton, Form.Base;

type
  TFormMainSingleton = class(TSingleton)
  private
    FForm: TfmBase;
  protected
    constructor Create; override;
  public
    destructor Destroy; override;
    class function Instance: TFormMainSingleton; reintroduce;
    property Form: TfmBase read FForm;
  end;

implementation

uses Form.Director, Form.ProductClass, Form.Builder;

{ TFormMainSingleton }

constructor TFormMainSingleton.Create;
begin
  inherited;
  Register(TFormMainSingleton.ClassName, Self);
  TFormDirectorSingleton.Instance.Director.Construct(fpcMain);
  FForm := TFormBuilderSingleton.Instance.Builder.Form;
end;

destructor TFormMainSingleton.Destroy;
begin
  if not Assigned(Form) then
    Form.Free;
  inherited;
end;

class function TFormMainSingleton.Instance: TFormMainSingleton;
begin
  Result := inherited Instance as TFormMainSingleton;
end;

end.
