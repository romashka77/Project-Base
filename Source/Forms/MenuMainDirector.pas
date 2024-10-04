unit MenuMainDirector;

interface

uses Menu.Director, Menu.ProductClass;

type
  TMenuMainDirector = class(TMenuDirector)
  protected
    function CanConstruct(aMenuClass: TMenuProductClass): Boolean; override;
    procedure Constructing; override;
    procedure SetSuccessor; override;
  end;

implementation

{ TMenuMainDirector }

function TMenuMainDirector.CanConstruct(aMenuClass: TMenuProductClass): Boolean;
begin
  Result := aMenuClass = mpcMain;
end;

procedure TMenuMainDirector.Constructing;
begin
  FBuilder.BuildMainMenu;
  FBuilder.BuildItem('Действия');
  FBuilder.BuildSubItem('Действия', 'Подключиться');
  FBuilder.BuildSubItem('Действия', 'Отключиться');
  FBuilder.BuildSubLine('Действия');
  FBuilder.BuildSubItem('Действия', 'Выход');

  FBuilder.BuildItem('Журналы');
  FBuilder.BuildSubItem('Журналы', 'Все события');
  FBuilder.BuildSubLine('Журналы');
  FBuilder.BuildSubItem('Журналы', 'Журнал событий 1');
  FBuilder.BuildSubItem('Журналы', 'Журнал событий 2');
  FBuilder.BuildSubItem('Журналы', 'Журнал событий 3');

  FBuilder.BuildItem('Отчеты');
  FBuilder.BuildSubItem('Отчеты', 'Отчет 1');
  FBuilder.BuildSubItem('Отчеты', 'Отчет 2');
  FBuilder.BuildSubItem('Отчеты', 'Отчет 3');

  FBuilder.BuildItem('Настройки');
  FBuilder.BuildSubItem('Настройки', 'Шаблоны событий');
  FBuilder.BuildSubItem('Настройки', 'Объекты учета');
  FBuilder.BuildSubItem('Настройки', 'Свойства объектов учета');
  FBuilder.BuildSubLine('Настройки');
  FBuilder.BuildSubItem('Настройки', 'Пользователи');
  FBuilder.BuildSubItem('Пользователи', 'Администратор');

  FBuilder.BuildItem('Помощь');
  FBuilder.BuildSubItem('Помощь', 'Инструкция пользователя');
  FBuilder.BuildSubLine('Помощь');
  FBuilder.BuildSubItem('Помощь', 'О программе');

  FBuilder.BuildItem('Окна');
  FBuilder.BuildSubItem('Окна', 'Логин');
  FBuilder.BuildSubItem('Окна', 'Элемент');
  FBuilder.BuildSubItem('Окна', 'Список');
  FBuilder.BuildSubItem('Окна', 'Сообщение');

  FBuilder.SetEnable;
end;

procedure TMenuMainDirector.SetSuccessor;
begin
  FSuccessor := nil;
end;

end.
