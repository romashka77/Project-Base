unit IdentityUser;

{ В ASP.NET Core Identity пользователь представлен классом IdentityUser из
  пространства имен Microsoft.AspNetCore.Identity.EntityFrameworkCore.Этот класс
  предоставляет базовую информацию о пользователе с помощью следующих свойств }
interface

uses Generics.Collections, BaseEntity;

type
  TIdentityUser = class(TBaseEntity)
  private
    FUserName: string;
    FEmail: string;
    FLogins: TList<string>;
    FPhoneNumber: string;
    FAccessFailedCount: Single;
    FEmailConfirmed: Boolean;
    FPhoneNumberConfirmed: Boolean;
  public
    function ToString: string; override;
    // ник пользователя
    property UserName: string read FUserName write FUserName;
    // электронный адрес пользователя
    property Email: string read FEmail write FEmail;
    // коллекция логинов, которые использовались пользователем для входа через сторонние сервисы (Google, Facebook и т.д.)
    property Logins: TList<string> read FLogins;
    // Claims: коллекция клеймов или дополнительных объектов, которые используются для авторизации пользователя
    // PasswordHash: хеш пароля.В базе данных напрямую не хранится пароль, а только его хеш.
    // Roles: набор ролей, к которым принадлежит пользователь
    // номер телефона
    property PhoneNumber: string read FPhoneNumber;
    // SecurityStamp: некоторое специальное значение, которое меняется при смене аутентификационных данных, например, пароля
    // количество неудачных входов пользователя в систему
    property AccessFailedCount: Single read FAccessFailedCount;
    // подтвержден ли адрес электронной почты
    property EmailConfirmed: Boolean read FEmailConfirmed;
    // подтвержден ли номер телефона
    property PhoneNumberConfirmed: Boolean read FPhoneNumberConfirmed;
  end;

implementation

{ TIdentityUser }

function TIdentityUser.ToString: string;
begin
  Result := 'базовая информация о пользователе'
end;

end.
