unit AbstractFactory;

{ Абстрактная фабрика }
interface

uses Product;

type

  IAbstractFactory = interface
    ['{D6862948-C302-45EF-87E7-7769C2DA5032}']
  end;

  TProductA = class(TInterfacedObject, IProduct);
  TProductB = class(TInterfacedObject, IProduct);
  TProductC = class(TInterfacedObject, IProduct);

  TFactoryX = class(TInterfacedObject, IAbstractFactory)
    function CreateProductA: TProductA; virtual; abstract;
    function CreateProductB: TProductB; virtual; abstract;
    function CreateProductC: TProductC; virtual; abstract;
  end;

  TFactoryY = class(TInterfacedObject, IAbstractFactory)
    function CreateProductA: TProductA; virtual; abstract;
    function CreateProductB: TProductB; virtual; abstract;
    function CreateProductC: TProductC; virtual; abstract;
  end;

implementation

end.
