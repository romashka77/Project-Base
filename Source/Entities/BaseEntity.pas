unit BaseEntity;

// ������� ����� ��� ��������
interface

type
  TBaseEntity = class(TObject)
  private
    FId: LongInt;
    FCreatedOnUtc: TDateTime;
    FUpdatedOnUtc: TDateTime;
  public
    function ToString: string; override;
    // ���������� ������������� ��������
    property Id: LongInt read FId;
    // ���� � ����� ��������
    property CreatedOnUtc: TDateTime read FCreatedOnUtc;
    // ���� � ����� ����������
    property UpdatedOnUtc: TDateTime read FUpdatedOnUtc;
  end;

implementation

{ TBaseEntity }

function TBaseEntity.ToString: string;
begin
  Result := inherited;
  Result := Result +' - ������� ����� ��� ��������';
end;

end.
