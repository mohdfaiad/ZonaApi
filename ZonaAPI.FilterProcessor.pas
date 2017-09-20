unit ZonaAPI.FilterProcessor;

interface

uses
  System.Classes;

Type
  TznFilterProcessor = class
  private
    FGenres: TStringList;
    FYears: TStringList;
    FCountrys: TStringList;
    FRatings: TStringList;
    FSorts: TStringList;
    FGenre: string;
    FYear: string;
    FCountry: string;
    FSort: string;
    FCategoria: string;
    FRating: string;
  protected
    procedure RegisterGenres;
    procedure RegisterAll;
  public
    constructor Create;
    destructor Destroy; override;
    function ToString: string; override;
    property Genre: string read FGenre write FGenre;
    property Genres: TStringList read FGenres write FGenres;
    property Year: string read FYear write FYear;
    property Country: string read FCountry write FCountry;
    property Rating: string read FRating write FRating;
    property Sort: string read FSort write FSort;
    property Categoria: string read FCategoria write FCategoria;
  end;

implementation

uses
  System.Net.URLClient;
{ TFilterProcessor }

constructor TznFilterProcessor.Create;
begin
  FGenres := TStringList.Create;
  FYears := TStringList.Create;
  FCountrys := TStringList.Create;
  FRatings := TStringList.Create;
  FSorts := TStringList.Create;
  RegisterAll;
end;

destructor TznFilterProcessor.Destroy;
begin
  FGenres.Free;
  FYears.Free;
  FCountrys.Free;
  FRatings.Free;
  FSorts.Free;
  inherited;
end;

procedure TznFilterProcessor.RegisterAll;
begin
  RegisterGenres;
end;

procedure TznFilterProcessor.RegisterGenres;
begin
  FGenres //
    .AddPair('�����', 'genre-drama') //
    .AddPair('�������', 'genre-komediia') //
    .AddPair('�������', 'genre-triller') //
    .AddPair('���������', 'genre-melodrama') //
    .AddPair('������', 'genre-boevik') //
    .AddPair('��������', 'genre-kriminal') //
    .AddPair('�����', 'genre-uzhasy') //
    .AddPair('�����������', 'genre-prikliucheniia') //
    .AddPair('����������', 'genre-fantastika') //
    .AddPair('��������', 'genre-detektiv') //
    .AddPair('�������', 'genre-fentezi') //
    .AddPair('��������', 'genre-semeinyi') //
    .AddPair('�������', 'genre-voennyi') //
    .AddPair('����������', 'genre-multfilm') //
    .AddPair('�������', 'genre-istoriia') //
    .AddPair('���������', 'genre-biografiia') //
    .AddPair('������', 'genre-miuzikl') //
    .AddPair('�������', 'genre-vestern') //
    .AddPair('������', 'genre-muzyka') //
    .AddPair('�����', 'genre-sport') //
    .AddPair('��������������', 'genre-dokumentalnyi') //
    .AddPair('�����', 'genre-anime') //
    .AddPair('���������������', 'genre-korotkometrazhka') //
    .AddPair('�����-����', 'genre-film-nuar') //
    .AddPair('�������', 'genre-detskii') //
    .AddPair('�������� ��', 'genre-realnoe-tv') //
    .AddPair('�������', 'genre-novosti') //
    .AddPair('�������', 'genre-kontcert') //
    .AddPair('���-���', 'genre-tok-shou') //
  // .AddPair('', '') //
  // .AddPair('', '') //
  // .AddPair('', '') //
  // .AddPair('', '') //
  // .AddPair('', '') //
  // .AddPair('', '') //
  // .AddPair('', '') //
end;

function TznFilterProcessor.ToString: string;
var
  LUri: TUri;
begin
  LUri := TUri.Create('https://zona.mobi');
  LUri.Path := LUri.Path + Categoria + '/';
  if FGenres.IndexOfName(Genre) > -1 then
    LUri.Path := LUri.Path + FGenres.Values[Genre] + '/';
end;

end.
