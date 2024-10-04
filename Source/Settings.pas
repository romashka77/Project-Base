unit Settings;

interface

uses Singleton, System.IniFiles;

type
  TSettingsSingleton = class(TSingleton)
  private
    FSettings: TMemIniFile;
  protected
    constructor Create; override;
    destructor Destroy; override;
  public
    class function Instance: TSettingsSingleton; reintroduce;
    property Settings: TMemIniFile read FSettings;
  end;

implementation

uses System.SysUtils;

resourcestring
  StrSettings = 'Settings.ini';

  // uses FMX.Forms;
  { TSettingsSingleton }

constructor TSettingsSingleton.Create;
begin
  inherited;
  Register(TSettingsSingleton.ClassName, Self);
  // Application.Name
  FSettings := TMemIniFile.Create(StrSettings, TEncoding.UTF8);
  Settings.AutoSave := True;
end;

destructor TSettingsSingleton.Destroy;
begin
  Settings.Free;
  inherited;
end;

class function TSettingsSingleton.Instance: TSettingsSingleton;
begin
  Result := inherited Instance as TSettingsSingleton;
end;

end.
