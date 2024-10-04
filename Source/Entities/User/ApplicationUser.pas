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
    // �������
    property LastName: string20 read FLastName write FLastName;
    // ���
    property FirstName: string20 read FFirstName write FFirstName;
    // ��������
    property MiddleName: string20 read FMiddleName write FMiddleName;
    // ���� ��������
    property DateOfBirth: TDate read FDateofBirth write FDateofBirth;
  end;

implementation

end.
