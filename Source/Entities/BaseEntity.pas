unit BaseEntity;

// Базовый класс для сущности
interface

type
  TBaseEntity = class(TObject)
  private
    FId: LongInt;
    FCreatedOnUtc: TDateTime;
    FUpdatedOnUtc: TDateTime;
  public
    function ToString: string; override;
    // Возвращает идентификатор сущности
    property Id: LongInt read FId;
    // Дата и время создания
    property CreatedOnUtc: TDateTime read FCreatedOnUtc;
    // Дата и время обновления
    property UpdatedOnUtc: TDateTime read FUpdatedOnUtc;
  end;

implementation

{ TBaseEntity }

function TBaseEntity.ToString: string;
begin
  Result := inherited;
  Result := Result +' - базовый класс для сущности';
end;

end.
