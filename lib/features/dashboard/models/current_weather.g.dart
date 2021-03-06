// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'current_weather.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CurrentWeather _$CurrentWeatherFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'CurrentWeather',
      json,
      ($checkedConvert) {
        final val = CurrentWeather(
          condition: $checkedConvert(
              'condition', (v) => $enumDecode(_$WeatherConditionEnumMap, v)),
          lastUpdated: $checkedConvert(
              'last_updated', (v) => DateTime.parse(v as String)),
          location: $checkedConvert('location', (v) => v as String),
          temperature: $checkedConvert('temperature',
              (v) => Temperature.fromJson(v as Map<String, dynamic>)),
        );
        return val;
      },
      fieldKeyMap: const {'lastUpdated': 'last_updated'},
    );

Map<String, dynamic> _$CurrentWeatherToJson(CurrentWeather instance) =>
    <String, dynamic>{
      'condition': _$WeatherConditionEnumMap[instance.condition],
      'last_updated': instance.lastUpdated.toIso8601String(),
      'location': instance.location,
      'temperature': instance.temperature.toJson(),
    };

const _$WeatherConditionEnumMap = {
  WeatherCondition.clouds: 'clouds',
  WeatherCondition.clear: 'clear',
  WeatherCondition.snow: 'snow',
  WeatherCondition.thunderstorm: 'thunderstorm',
  WeatherCondition.rain: 'rain',
  WeatherCondition.drizzle: 'drizzle',
  WeatherCondition.mist: 'mist',
  WeatherCondition.smoke: 'smoke',
  WeatherCondition.haze: 'haze',
  WeatherCondition.fog: 'fog',
  WeatherCondition.sand: 'sand',
  WeatherCondition.dust: 'dust',
  WeatherCondition.ash: 'ash',
  WeatherCondition.squall: 'squall',
  WeatherCondition.tornado: 'tornado',
  WeatherCondition.unknown: 'unknown',
};
