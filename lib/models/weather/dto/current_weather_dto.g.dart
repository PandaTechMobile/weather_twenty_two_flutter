// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'current_weather_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CurrentWeatherDto _$CurrentWeatherDtoFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'CurrentWeatherDto',
      json,
      ($checkedConvert) {
        final val = CurrentWeatherDto(
          coordinates: $checkedConvert(
              'coord',
              (v) => v == null
                  ? null
                  : Coordinates.fromJson(v as Map<String, dynamic>)),
          weather: $checkedConvert(
              'weather',
              (v) => (v as List<dynamic>?)
                  ?.map((e) => Weather.fromJson(e as Map<String, dynamic>))
                  .toList()),
          base: $checkedConvert('base', (v) => v as String?),
          mainWeatherInfo: $checkedConvert(
              'main',
              (v) => v == null
                  ? null
                  : WeatherInfo.fromJson(v as Map<String, dynamic>)),
          visibility: $checkedConvert('visibility', (v) => v as int?),
          wind: $checkedConvert(
              'wind',
              (v) =>
                  v == null ? null : Wind.fromJson(v as Map<String, dynamic>)),
          clouds: $checkedConvert(
              'clouds',
              (v) => v == null
                  ? null
                  : Clouds.fromJson(v as Map<String, dynamic>)),
          dt: $checkedConvert('dt', (v) => v as int?),
          twilight: $checkedConvert(
              'sys',
              (v) => v == null
                  ? null
                  : Twilight.fromJson(v as Map<String, dynamic>)),
          timezone: $checkedConvert('timezone', (v) => v as int?),
          id: $checkedConvert('id', (v) => v as int?),
          name: $checkedConvert('name', (v) => v as String?),
          cod: $checkedConvert('cod', (v) => v as int?),
        );
        return val;
      },
      fieldKeyMap: const {
        'coordinates': 'coord',
        'mainWeatherInfo': 'main',
        'twilight': 'sys'
      },
    );

Map<String, dynamic> _$CurrentWeatherDtoToJson(CurrentWeatherDto instance) =>
    <String, dynamic>{
      'coord': instance.coordinates?.toJson(),
      'weather': instance.weather?.map((e) => e.toJson()).toList(),
      'base': instance.base,
      'main': instance.mainWeatherInfo?.toJson(),
      'visibility': instance.visibility,
      'wind': instance.wind?.toJson(),
      'clouds': instance.clouds?.toJson(),
      'dt': instance.dt,
      'sys': instance.twilight?.toJson(),
      'timezone': instance.timezone,
      'id': instance.id,
      'name': instance.name,
      'cod': instance.cod,
    };

Clouds _$CloudsFromJson(Map<String, dynamic> json) => $checkedCreate(
      'Clouds',
      json,
      ($checkedConvert) {
        final val = Clouds(
          all: $checkedConvert('all', (v) => v as int?),
        );
        return val;
      },
    );

Map<String, dynamic> _$CloudsToJson(Clouds instance) => <String, dynamic>{
      'all': instance.all,
    };

Coordinates _$CoordinatesFromJson(Map<String, dynamic> json) => $checkedCreate(
      'Coordinates',
      json,
      ($checkedConvert) {
        final val = Coordinates(
          latitude: $checkedConvert('lat', (v) => (v as num?)?.toDouble()),
          logitude: $checkedConvert('lon', (v) => (v as num?)?.toDouble()),
        );
        return val;
      },
      fieldKeyMap: const {'latitude': 'lat', 'logitude': 'lon'},
    );

Map<String, dynamic> _$CoordinatesToJson(Coordinates instance) =>
    <String, dynamic>{
      'lat': instance.latitude,
      'lon': instance.logitude,
    };

Twilight _$TwilightFromJson(Map<String, dynamic> json) => $checkedCreate(
      'Twilight',
      json,
      ($checkedConvert) {
        final val = Twilight(
          type: $checkedConvert('type', (v) => v as int?),
          id: $checkedConvert('id', (v) => v as int?),
          country: $checkedConvert('country', (v) => v as String?),
          sunrise: $checkedConvert('sunrise', (v) => v as int?),
          sunset: $checkedConvert('sunset', (v) => v as int?),
        );
        return val;
      },
    );

Map<String, dynamic> _$TwilightToJson(Twilight instance) => <String, dynamic>{
      'type': instance.type,
      'id': instance.id,
      'country': instance.country,
      'sunrise': instance.sunrise,
      'sunset': instance.sunset,
    };

WeatherInfo _$WeatherInfoFromJson(Map<String, dynamic> json) => $checkedCreate(
      'WeatherInfo',
      json,
      ($checkedConvert) {
        final val = WeatherInfo(
          temp: $checkedConvert('temp', (v) => (v as num?)?.toDouble()),
          feelsLike:
              $checkedConvert('feels_like', (v) => (v as num?)?.toDouble()),
          tempMin: $checkedConvert('temp_min', (v) => (v as num?)?.toDouble()),
          tempMax: $checkedConvert('temp_max', (v) => (v as num?)?.toDouble()),
          pressure: $checkedConvert('pressure', (v) => v as int?),
          humidity: $checkedConvert('humidity', (v) => v as int?),
        );
        return val;
      },
      fieldKeyMap: const {
        'feelsLike': 'feels_like',
        'tempMin': 'temp_min',
        'tempMax': 'temp_max'
      },
    );

Map<String, dynamic> _$WeatherInfoToJson(WeatherInfo instance) =>
    <String, dynamic>{
      'temp': instance.temp,
      'feels_like': instance.feelsLike,
      'temp_min': instance.tempMin,
      'temp_max': instance.tempMax,
      'pressure': instance.pressure,
      'humidity': instance.humidity,
    };

Wind _$WindFromJson(Map<String, dynamic> json) => $checkedCreate(
      'Wind',
      json,
      ($checkedConvert) {
        final val = Wind(
          speed: $checkedConvert('speed', (v) => (v as num?)?.toDouble()),
          deg: $checkedConvert('deg', (v) => v as int?),
          gust: $checkedConvert('gust', (v) => (v as num?)?.toDouble()),
        );
        return val;
      },
    );

Map<String, dynamic> _$WindToJson(Wind instance) => <String, dynamic>{
      'speed': instance.speed,
      'deg': instance.deg,
      'gust': instance.gust,
    };
