import 'package:json_annotation/json_annotation.dart';

import 'weather.dart';

part ''
    'current_weather_dto.g.dart';

@JsonSerializable()
class CurrentWeatherDto {
  @JsonKey(name: 'coord')
  Coordinates? coordinates;
  List<Weather>? weather;
  String? base;
  @JsonKey(name: 'main')
  WeatherInfo? mainWeatherInfo;
  int? visibility;
  Wind? wind;
  Clouds? clouds;
  int? dt;
  @JsonKey(name: 'sys')
  Twilight? twilight;
  int? timezone;
  int? id;
  String? name;
  int? cod;

  CurrentWeatherDto(
      {this.coordinates,
      this.weather,
      this.base,
      this.mainWeatherInfo,
      this.visibility,
      this.wind,
      this.clouds,
      this.dt,
      this.twilight,
      this.timezone,
      this.id,
      this.name,
      this.cod});

  factory CurrentWeatherDto.fromJson(Map<String, dynamic> json) =>
      _$CurrentWeatherDtoFromJson(json);

  Map<String, dynamic> toJson() => _$CurrentWeatherDtoToJson(this);
}

@JsonSerializable()
class Clouds {
  int? all;

  Clouds({this.all});

  factory Clouds.fromJson(Map<String, dynamic> json) => _$CloudsFromJson(json);

  Map<String, dynamic> toJson() => _$CloudsToJson(this);
}

@JsonSerializable()
class Coordinates {
  @JsonKey(name: 'lat')
  final double? latitude;
  @JsonKey(name: 'lon')
  final double? logitude;

  Coordinates({this.latitude, this.logitude});

  factory Coordinates.fromJson(Map<String, dynamic> json) =>
      _$CoordinatesFromJson(json);

  Map<String, dynamic> toJson() => _$CoordinatesToJson(this);
}

@JsonSerializable()
class Twilight {
  int? type;
  int? id;
  String? country;
  int? sunrise;
  int? sunset;

  Twilight({this.type, this.id, this.country, this.sunrise, this.sunset});

  factory Twilight.fromJson(Map<String, dynamic> json) =>
      _$TwilightFromJson(json);

  Map<String, dynamic> toJson() => _$TwilightToJson(this);
}

@JsonSerializable()
class WeatherInfo {
  double? temp;
  double? feelsLike;
  double? tempMin;
  double? tempMax;
  int? pressure;
  int? humidity;

  WeatherInfo(
      {this.temp,
      this.feelsLike,
      this.tempMin,
      this.tempMax,
      this.pressure,
      this.humidity});

  factory WeatherInfo.fromJson(Map<String, dynamic> json) =>
      _$WeatherInfoFromJson(json);

  Map<String, dynamic> toJson() => _$WeatherInfoToJson(this);
}

@JsonSerializable()
class Wind {
  double? speed;
  int? deg;
  double? gust;

  Wind({this.speed, this.deg, this.gust});

  factory Wind.fromJson(Map<String, dynamic> json) => _$WindFromJson(json);

  Map<String, dynamic> toJson() => _$WindToJson(this);
}
