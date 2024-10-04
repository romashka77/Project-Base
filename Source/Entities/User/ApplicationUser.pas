unit ApplicationUser;

interface

uses IdentityUser;

type
  string20 = string[20];

  TApplicationUser = class(TIdentityUser)
  private
    FLastName: string20;
    FFirstName: string20;
    FMiddleName: string20;
    FDateofBirth: TDate;
  public
    // Фамилия
    property LastName: string20 read FLastName write FLastName;
    // Имя
    property FirstName: string20 read FFirstName write FFirstName;
    // Отчество
    property MiddleName: string20 read FMiddleName write FMiddleName;
    // Дата рождения
    property DateOfBirth: TDate read FDateofBirth write FDateofBirth;
  end;

implementation

end.
