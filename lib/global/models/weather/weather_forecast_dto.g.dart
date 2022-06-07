// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather_forecast_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WeatherForecastDTO _$WeatherForecastDTOFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'WeatherForecastDTO',
      json,
      ($checkedConvert) {
        final val = WeatherForecastDTO(
          city: $checkedConvert(
              'city',
              (v) =>
                  v == null ? null : City.fromJson(v as Map<String, dynamic>)),
          cod: $checkedConvert('cod', (v) => v as String?),
          message: $checkedConvert('message', (v) => (v as num?)?.toDouble()),
          cnt: $checkedConvert('cnt', (v) => v as int?),
          weatherForecasts: $checkedConvert(
              'list',
              (v) => (v as List<dynamic>?)
                  ?.map((e) =>
                      WeatherForecast.fromJson(e as Map<String, dynamic>))
                  .toList()),
        );
        return val;
      },
      fieldKeyMap: const {'weatherForecasts': 'list'},
    );

Map<String, dynamic> _$WeatherForecastDTOToJson(WeatherForecastDTO instance) =>
    <String, dynamic>{
      'city': instance.city?.toJson(),
      'cod': instance.cod,
      'message': instance.message,
      'cnt': instance.cnt,
      'list': instance.weatherForecasts?.map((e) => e.toJson()).toList(),
    };

City _$CityFromJson(Map<String, dynamic> json) => $checkedCreate(
      'City',
      json,
      ($checkedConvert) {
        final val = City(
          id: $checkedConvert('id', (v) => v as int?),
          name: $checkedConvert('name', (v) => v as String?),
          coord: $checkedConvert(
              'coord',
              (v) =>
                  v == null ? null : Coord.fromJson(v as Map<String, dynamic>)),
          country: $checkedConvert('country', (v) => v as String?),
          population: $checkedConvert('population', (v) => v as int?),
          timezone: $checkedConvert('timezone', (v) => v as int?),
        );
        return val;
      },
    );

Map<String, dynamic> _$CityToJson(City instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'coord': instance.coord?.toJson(),
      'country': instance.country,
      'population': instance.population,
      'timezone': instance.timezone,
    };

Coord _$CoordFromJson(Map<String, dynamic> json) => $checkedCreate(
      'Coord',
      json,
      ($checkedConvert) {
        final val = Coord(
          lon: $checkedConvert('lon', (v) => (v as num?)?.toDouble()),
          lat: $checkedConvert('lat', (v) => (v as num?)?.toDouble()),
        );
        return val;
      },
    );

Map<String, dynamic> _$CoordToJson(Coord instance) => <String, dynamic>{
      'lon': instance.lon,
      'lat': instance.lat,
    };

WeatherForecast _$WeatherForecastFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'WeatherForecast',
      json,
      ($checkedConvert) {
        final val = WeatherForecast(
          dt: $checkedConvert('dt', (v) => v as int?),
          sunrise: $checkedConvert('sunrise', (v) => v as int?),
          sunset: $checkedConvert('sunset', (v) => v as int?),
          temp: $checkedConvert(
              'temp',
              (v) =>
                  v == null ? null : Temp.fromJson(v as Map<String, dynamic>)),
          feelsLike: $checkedConvert(
              'feels_like',
              (v) => v == null
                  ? null
                  : FeelsLike.fromJson(v as Map<String, dynamic>)),
          pressure: $checkedConvert('pressure', (v) => (v as num?)?.toDouble()),
          humidity: $checkedConvert('humidity', (v) => (v as num?)?.toDouble()),
          weather: $checkedConvert(
              'weather',
              (v) => (v as List<dynamic>?)
                  ?.map((e) => Weather.fromJson(e as Map<String, dynamic>))
                  .toList()),
          speed: $checkedConvert('speed', (v) => (v as num?)?.toDouble()),
          deg: $checkedConvert('deg', (v) => (v as num?)?.toDouble()),
          gust: $checkedConvert('gust', (v) => (v as num?)?.toDouble()),
          clouds: $checkedConvert('clouds', (v) => (v as num?)?.toDouble()),
          pop: $checkedConvert('pop', (v) => (v as num?)?.toDouble()),
          rain: $checkedConvert('rain', (v) => (v as num?)?.toDouble()),
        );
        return val;
      },
      fieldKeyMap: const {'feelsLike': 'feels_like'},
    );

Map<String, dynamic> _$WeatherForecastToJson(WeatherForecast instance) =>
    <String, dynamic>{
      'dt': instance.dt,
      'sunrise': instance.sunrise,
      'sunset': instance.sunset,
      'temp': instance.temp?.toJson(),
      'feels_like': instance.feelsLike?.toJson(),
      'pressure': instance.pressure,
      'humidity': instance.humidity,
      'weather': instance.weather?.map((e) => e.toJson()).toList(),
      'speed': instance.speed,
      'deg': instance.deg,
      'gust': instance.gust,
      'clouds': instance.clouds,
      'pop': instance.pop,
      'rain': instance.rain,
    };

Temp _$TempFromJson(Map<String, dynamic> json) => $checkedCreate(
      'Temp',
      json,
      ($checkedConvert) {
        final val = Temp(
          day: $checkedConvert('day', (v) => (v as num?)?.toDouble()),
          min: $checkedConvert('min', (v) => (v as num?)?.toDouble()),
          max: $checkedConvert('max', (v) => (v as num?)?.toDouble()),
          night: $checkedConvert('night', (v) => (v as num?)?.toDouble()),
          eve: $checkedConvert('eve', (v) => (v as num?)?.toDouble()),
          morn: $checkedConvert('morn', (v) => (v as num?)?.toDouble()),
        );
        return val;
      },
    );

Map<String, dynamic> _$TempToJson(Temp instance) => <String, dynamic>{
      'day': instance.day,
      'min': instance.min,
      'max': instance.max,
      'night': instance.night,
      'eve': instance.eve,
      'morn': instance.morn,
    };

FeelsLike _$FeelsLikeFromJson(Map<String, dynamic> json) => $checkedCreate(
      'FeelsLike',
      json,
      ($checkedConvert) {
        final val = FeelsLike(
          day: $checkedConvert('day', (v) => (v as num?)?.toDouble()),
          night: $checkedConvert('night', (v) => (v as num?)?.toDouble()),
          eve: $checkedConvert('eve', (v) => (v as num?)?.toDouble()),
          morn: $checkedConvert('morn', (v) => (v as num?)?.toDouble()),
        );
        return val;
      },
    );

Map<String, dynamic> _$FeelsLikeToJson(FeelsLike instance) => <String, dynamic>{
      'day': instance.day,
      'night': instance.night,
      'eve': instance.eve,
      'morn': instance.morn,
    };
