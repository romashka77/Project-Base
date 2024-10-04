unit Handler;

{ Цепочка обязанностей
  Chain of responsibility
  Тип: Поведенческий
  Что это:
  Избегает связывания отправителя
  запроса с его получателем, давая
  возможность обработать запрос более
  чем одному объекту. Связывает объекты-получатели и передаёт запрос по
  цепочке пока объект не обработает его.
}
interface

type
  IHandler = interface
    ['{487C50F3-E520-46CA-9F0A-D2D9F3983F50}']
  end;

  THandler = class(TInterfacedObject, IHandler)
  protected
    FSuccessor: THandler;
    function CanHandle: Boolean; virtual; abstract;
    procedure Handle; virtual; abstract;
  public
    procedure HandleRequest;
  end;

implementation

{ THandler }

procedure THandler.HandleRequest;
begin
  if CanHandle then
    Handle
  else
    FSuccessor.HandleRequest;
end;

end.
