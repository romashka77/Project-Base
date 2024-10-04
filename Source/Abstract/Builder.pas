unit Builder;
//строитель
//Тип: Порождающий
//Что это:
//Разделяет создание сложного
//объекта и инициализацию его
//состояния так, что одинаковый
//процесс построения может
//создать объекты с разным состо-
//янием.
{Строитель — это порождающий паттерн проектирования,
который позволяет создавать сложные объекты пошагово.
Строитель даёт возможность использовать один и тот же код строительства
для получения разных представлений объектов.}

interface

type
  IProductABC = interface
    ['{6EF332A3-B1A0-4D50-A1B5-A87CBA908850}']
  end;

  IBuilder = interface
    ['{1F39FE7A-4B0A-4956-AAAE-00DC6E4AD0A8}']
  end;

  IDirector = interface
    ['{2FF3AE87-306B-4A13-9327-6BCF3BD5B610}']
  end;

  TProductABC = class(TInterfacedObject, IProductABC);

  TBuilder = class(TInterfacedObject, IBuilder)
  private
    FResult: TProductABC;
  public
    procedure BuildPartA; virtual; abstract;
    procedure BuildPartB; virtual; abstract;
    procedure BuildPartC; virtual; abstract;
    function GetResult: TProductABC;
  end;

  TDirector = class(TInterfacedObject, IDirector)
  private
    FBuilder: TBuilder;
  public
    procedure Construct;
    constructor Create(aBuilder: TBuilder);
  end;

implementation

{ TDirector }

procedure TDirector.Construct;
begin
  FBuilder.BuildPartA;
  FBuilder.BuildPartB;
  FBuilder.BuildPartC;
end;

constructor TDirector.Create(aBuilder: TBuilder);
begin
  inherited Create;
  FBuilder := aBuilder;
end;

{ TBuilder }

function TBuilder.GetResult: TProductABC;
begin
  Result := FResult;
end;

end.

