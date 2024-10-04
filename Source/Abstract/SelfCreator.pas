unit SelfCreator;

// Фабричный метод создание самого себя
interface

uses
  TemplateMethod, Product;

type
  TSelfCreator = class(TInterfacedObject, ICreator, IProduct)
  protected
    constructor Create; virtual; abstract;
  public
    // Result:=TSelfCreator.Create;
    class function Get: IProduct; virtual; abstract;
  end;

implementation

end.
