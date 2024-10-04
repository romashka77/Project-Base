unit Form.Base;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes,
  System.Variants, System.IniFiles,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Objects,
  FMX.Layouts, System.Skia, FMX.Skia,
  Mediator, ControlMediator, System.Actions, FMX.ActnList;

type
  TfmBase = class(TForm, IColleague) // TInterfacedObject, IProductABC
    // published
    rctContent: TRectangle;
    sbContent: TScrollBox;
    ActionList1: TActionList;
  strict private
  private
    FFreeOnClose: Boolean;
    FControlMediator: TControlMediator;
  protected
    // запись настроек в ini
    procedure SaveSettings(IniFile: TCustomIniFile; Section: string); virtual;
    // чтение настроек из ini
    procedure LoadSettings(IniFile: TCustomIniFile; Section: string); virtual;
    procedure DoClose(var CloseAction: TCloseAction); override;
  public
    // получить настройки
    procedure GetSettings; virtual;

    property CM: TControlMediator read FControlMediator write FControlMediator;
  published
    // признак автоматического уничтожение окна при закрытии
    property FreeOnClose: Boolean read FFreeOnClose write FFreeOnClose
      default True;
  end;

implementation

{$R *.fmx}

uses System.Threading,
  Settings;

resourcestring
  StrLeft = 'Left';
  StrTop = 'Top';
  StrHeight = 'Height';
  StrWidth = 'Width';
  StrWindowState = 'WindowState';

procedure TfmBase.DoClose(var CloseAction: TCloseAction);
begin
  SaveSettings(TSettingsSingleton.Instance.Settings, Name);
  if FreeOnClose then
    CloseAction := TCloseAction.caFree;
  inherited DoClose(CloseAction);
end;

procedure TfmBase.LoadSettings(IniFile: TCustomIniFile; Section: string);
begin
  BeginUpdate;
  try
    with IniFile do
    begin
      WindowState := TWindowState(ReadInteger(Section, StrWindowState, 0));
      if WindowState = TWindowState.wsNormal then
      begin
        Left := ReadInteger(Section, StrLeft, 0);
        Top := ReadInteger(Section, StrTop, 0);
        Height := ReadInteger(Section, StrHeight, 480);
        Width := ReadInteger(Section, StrWidth, 640);
      end;
    end;
  finally
    EndUpdate;
  end;
end;

procedure TfmBase.GetSettings;
begin
  LoadSettings(TSettingsSingleton.Instance.Settings, Name);
end;

procedure TfmBase.SaveSettings(IniFile: TCustomIniFile; Section: string);
begin
  with IniFile do
  begin
    WriteInteger(Section, StrWindowState, Ord(WindowState));
    if WindowState = TWindowState.wsNormal then
    begin
      WriteInteger(Section, StrLeft, Left);
      WriteInteger(Section, StrTop, Top);
      WriteInteger(Section, StrHeight, Height);
      WriteInteger(Section, StrWidth, Width);
    end;
    TTask.Run(
      procedure
      begin
        UpdateFile;
      end);
  end;
end;

end.
