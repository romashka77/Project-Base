unit TemplateMethod;

{ Шаблонный метод
  Template method
  Тип: Поведенческий
  Что это:
  Определяет алгоритм, некоторые этапы
  которого делегируются подклассам. Позволяет подклассам переопределить эти
  этапы, не меняя структуру алгоритма.
}
interface

uses Product;

type
  ITemplateMethod = interface
    ['{2B2D2D6A-5217-43D3-B9C2-6B2E105307D1}']
  end;

  ICreator = interface
    ['{8DBA8927-20B2-43BF-98D5-7CBD3D9F363A}']
  end;

  TCreator = class(TInterfacedObject, ICreator, ITemplateMethod)
  protected
    class function CreateProduct: IProduct; virtual; abstract;
  public
    class function Get: IProduct; virtual; abstract;
  end;

implementation

end.
