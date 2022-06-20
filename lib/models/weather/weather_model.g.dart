// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WeatherModel _$WeatherModelFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'WeatherModel',
      json,
      ($checkedConvert) {
        final val = WeatherModel(
          locationName: $checkedConvert('location_name', (v) => v as String),
          temperature:
              $checkedConvert('temperature', (v) => (v as num).toDouble()),
          condition: $checkedConvert(
              'condition', (v) => $enumDecode(_$WeatherConditionEnumMap, v)),
          icon: $checkedConvert('icon', (v) => v as String),
        );
        return val;
      },
      fieldKeyMap: const {'locationName': 'location_name'},
    );

Map<String, dynamic> _$WeatherModelToJson(WeatherModel instance) =>
    <String, dynamic>{
      'location_name': instance.locationName,
      'temperature': instance.temperature,
      'condition': _$WeatherConditionEnumMap[instance.condition],
      'icon': instance.icon,
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
