program Project1;

uses
  System.StartUpCopy,
  FMX.Forms,
  FMX.Skia,
  DataBase in 'Source\DB\DataBase.pas',
  DataFacade in 'Source\DB\DataFacade.pas',
  DBCreator in 'Source\DB\DBCreator.pas',
  DBDB2 in 'Source\DB\DBDB2.pas',
  DBFirebird in 'Source\DB\DBFirebird.pas',
  Product in 'Source\Abstract\Product.pas',
  Prototype in 'Source\Abstract\Prototype.pas',
  Singleton in 'Source\Abstract\Singleton.pas',
  TemplateMethod in 'Source\Abstract\TemplateMethod.pas',
  Form.Base in 'Source\Forms\Base\Form.Base.pas' {fmBase},
  AbstractFactory in 'Source\Abstract\AbstractFactory.pas',
  FormMainSingleton in 'Source\Forms\FormMainSingleton.pas',
  BaseEntity in 'Source\Entities\BaseEntity.pas',
  Settings in 'Source\Settings.pas',
  Builder in 'Source\Abstract\Builder.pas',
  Form.Builder in 'Source\Forms\Base\Form.Builder.pas',
  Form.Director in 'Source\Forms\Base\Form.Director.pas',
  Form.BuilderA in 'Source\Forms\FormsA\Form.BuilderA.pas',
  Form.BuilderB in 'Source\Forms\FormsB\Form.BuilderB.pas',
  Form.ProductClass in 'Source\Forms\Base\Form.ProductClass.pas',
  Handler in 'Source\Abstract\Handler.pas',
  FormMessageDirector in 'Source\Forms\FormMessageDirector.pas',
  FormMainDirector in 'Source\Forms\FormMainDirector.pas',
  FormLoginDirector in 'Source\Forms\FormLoginDirector.pas',
  FormListDirector in 'Source\Forms\FormListDirector.pas',
  FormItemDirector in 'Source\Forms\FormItemDirector.pas',
  Frame.Base in 'Source\Forms\Base\Frame.Base.pas' {frBase: TFrame},
  IdentityUser in 'Source\Entities\User\IdentityUser.pas',
  ApplicationUser in 'Source\Entities\User\ApplicationUser.pas',
  Mediator in 'Source\Abstract\Mediator.pas',
  ControlMediator in 'Source\Forms\Base\ControlMediator.pas',
  SelfCreator in 'Source\Abstract\SelfCreator.pas',
  Menu.ProductClass in 'Source\Forms\Base\Menu.ProductClass.pas',
  Menu.Director in 'Source\Forms\Base\Menu.Director.pas',
  Menu.Builder in 'Source\Forms\Base\Menu.Builder.pas',
  MenuMainDirector in 'Source\Forms\MenuMainDirector.pas',
  MenuPopupDirector in 'Source\Forms\MenuPopupDirector.pas',
  Menu.BuilderA in 'Source\Forms\FormsA\Menu.BuilderA.pas';

{$R *.res}

begin
  GlobalUseSkia := True;
  Application.Initialize;
  TFormMainSingleton.Instance.Form.Show;
  // Application.MainForm.Show;
  Application.Run;

end.
