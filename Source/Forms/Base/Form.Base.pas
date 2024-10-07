unit Form.Base;

interface

uses
  System.Types, System.UITypes, System.Classes,
  System.Variants, System.IniFiles,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Objects,
  FMX.Layouts, System.Skia, FMX.Skia,
  Mediator, ControlMediator, System.Actions, FMX.ActnList, FMX.ListView.Types,
  FMX.ListView.Appearances, FMX.ListView.Adapters.Base, FMX.ListView,
  FMX.Controls.Presentation, FMX.StdCtrls;

type
  TfmBase = class(TForm, IColleague)
    ActionList1: TActionList;
    Context: TLayout;
    Label1: TLabel;
    procedure FormSaveState(Sender: TObject);
  strict private
  private
    FFreeOnClose: Boolean;
    FControlMediator: TControlMediator;
  protected
    procedure DoClose(var CloseAction: TCloseAction); override;
  public
    procedure LoadFormState; virtual;
    procedure SaveFormState; virtual;
    property CM: TControlMediator read FControlMediator write FControlMediator;
  published
    // признак автоматического уничтожение окна при закрытии
    property FreeOnClose: Boolean read FFreeOnClose write FFreeOnClose
      default True;
  end;

implementation

{$R *.fmx}

uses System.Threading,
  Settings, System.IOUtils;

procedure TfmBase.DoClose(var CloseAction: TCloseAction);
begin
  // SaveSettings(TSettingsSingleton.Instance.Settings, Name);
  if FreeOnClose then
    CloseAction := TCloseAction.caFree;
  inherited DoClose(CloseAction);
end;

procedure TfmBase.LoadFormState;
var
  r: TBinaryReader;
begin
  // SaveState.StoragePath := TPath.GetHomePath;
  SaveState.StoragePath :=
    'd:\projects\RAD\Delphi\Project Base\BIN\Win64\Debug';
  // SaveState.Name := 'tetst.ini';
  if SaveState.Stream.Size > 0 then
  begin
    r := TBinaryReader.Create(SaveState.Stream);
    try
      // WindowState := TWindowState(r.ReadInteger);
      Left := r.ReadInteger;
      Top := r.ReadInteger;
      Height := r.ReadInteger;
      Width := r.ReadInteger;
    finally
      r.Free;
    end;
  end;
end;

procedure TfmBase.SaveFormState;
var
  w: TBinaryWriter;
begin
  SaveState.Stream.Clear;
  w := TBinaryWriter.Create(SaveState.Stream);
  try
    begin
      w.Write(Left);
      w.Write(Top);
      w.Write(Height);
      w.Write(Width);
    end;
  finally
    w.Free;
  end;

end;

procedure TfmBase.FormSaveState(Sender: TObject);
begin
  SaveFormState;
end;

end.
