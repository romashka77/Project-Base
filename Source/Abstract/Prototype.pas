unit Prototype;
{Прототип
Prototype
Тип: Порождающий
Что это:
Определяет несколько видов
объектов, чтобы при создании
использовать объект-прототип и
создаёт новые объекты, копируя
прототип.}

interface

type
  // прототип
  IPrototype = interface
  ['{C105F1D0-45D1-4F08-971C-C564CFA0B020}']
    function Clone: IPrototype;
  end;

implementation

end.

