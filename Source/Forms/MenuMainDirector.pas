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
  FBuilder.BuildItem('��������');
  FBuilder.BuildSubItem('��������', '������������');
  FBuilder.BuildSubItem('��������', '�����������');
  FBuilder.BuildSubLine('��������');
  FBuilder.BuildSubItem('��������', '�����');

  FBuilder.BuildItem('�������');
  FBuilder.BuildSubItem('�������', '��� �������');
  FBuilder.BuildSubLine('�������');
  FBuilder.BuildSubItem('�������', '������ ������� 1');
  FBuilder.BuildSubItem('�������', '������ ������� 2');
  FBuilder.BuildSubItem('�������', '������ ������� 3');

  FBuilder.BuildItem('������');
  FBuilder.BuildSubItem('������', '����� 1');
  FBuilder.BuildSubItem('������', '����� 2');
  FBuilder.BuildSubItem('������', '����� 3');

  FBuilder.BuildItem('���������');
  FBuilder.BuildSubItem('���������', '������� �������');
  FBuilder.BuildSubItem('���������', '������� �����');
  FBuilder.BuildSubItem('���������', '�������� �������� �����');
  FBuilder.BuildSubLine('���������');
  FBuilder.BuildSubItem('���������', '������������');
  FBuilder.BuildSubItem('������������', '�������������');

  FBuilder.BuildItem('������');
  FBuilder.BuildSubItem('������', '���������� ������������');
  FBuilder.BuildSubLine('������');
  FBuilder.BuildSubItem('������', '� ���������');

  FBuilder.BuildItem('����');
  FBuilder.BuildSubItem('����', '�����');
  FBuilder.BuildSubItem('����', '�������');
  FBuilder.BuildSubItem('����', '������');
  FBuilder.BuildSubItem('����', '���������');

  FBuilder.SetEnable;
end;

procedure TMenuMainDirector.SetSuccessor;
begin
  FSuccessor := nil;
end;

end.
