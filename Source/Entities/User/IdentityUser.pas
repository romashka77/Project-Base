unit IdentityUser;

{ � ASP.NET Core Identity ������������ ����������� ������� IdentityUser ��
  ������������ ���� Microsoft.AspNetCore.Identity.EntityFrameworkCore.���� �����
  ������������� ������� ���������� � ������������ � ������� ��������� ������� }
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
    // ��� ������������
    property UserName: string read FUserName write FUserName;
    // ����������� ����� ������������
    property Email: string read FEmail write FEmail;
    // ��������� �������, ������� �������������� ������������� ��� ����� ����� ��������� ������� (Google, Facebook � �.�.)
    property Logins: TList<string> read FLogins;
    // Claims: ��������� ������� ��� �������������� ��������, ������� ������������ ��� ����������� ������������
    // PasswordHash: ��� ������.� ���� ������ �������� �� �������� ������, � ������ ��� ���.
    // Roles: ����� �����, � ������� ����������� ������������
    // ����� ��������
    property PhoneNumber: string read FPhoneNumber;
    // SecurityStamp: ��������� ����������� ��������, ������� �������� ��� ����� ������������������ ������, ��������, ������
    // ���������� ��������� ������ ������������ � �������
    property AccessFailedCount: Single read FAccessFailedCount;
    // ����������� �� ����� ����������� �����
    property EmailConfirmed: Boolean read FEmailConfirmed;
    // ����������� �� ����� ��������
    property PhoneNumberConfirmed: Boolean read FPhoneNumberConfirmed;
  end;

implementation

{ TIdentityUser }

function TIdentityUser.ToString: string;
begin
  Result := '������� ���������� � ������������'
end;

end.
