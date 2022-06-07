// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'current_weather_cubit.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CurrentWeatherState _$CurrentWeatherStateFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'CurrentWeatherState',
      json,
      ($checkedConvert) {
        final val = CurrentWeatherState(
          status: $checkedConvert(
              'status',
              (v) =>
                  $enumDecodeNullable(_$CurrentWeatherStatusEnumMap, v) ??
                  CurrentWeatherStatus.initial),
          temperatureUnits: $checkedConvert(
              'temperature_units',
              (v) =>
                  $enumDecodeNullable(_$TemperatureUnitsEnumMap, v) ??
                  TemperatureUnits.celsius),
          currentWeather: $checkedConvert(
              'current_weather',
              (v) => v == null
                  ? null
                  : CurrentWeather.fromJson(v as Map<String, dynamic>)),
        );
        return val;
      },
      fieldKeyMap: const {
        'temperatureUnits': 'temperature_units',
        'currentWeather': 'current_weather'
      },
    );

Map<String, dynamic> _$CurrentWeatherStateToJson(
        CurrentWeatherState instance) =>
    <String, dynamic>{
      'status': _$CurrentWeatherStatusEnumMap[instance.status],
      'current_weather': instance.currentWeather.toJson(),
      'temperature_units': _$TemperatureUnitsEnumMap[instance.temperatureUnits],
    };

const _$CurrentWeatherStatusEnumMap = {
  CurrentWeatherStatus.initial: 'initial',
  CurrentWeatherStatus.loading: 'loading',
  CurrentWeatherStatus.success: 'success',
  CurrentWeatherStatus.failure: 'failure',
};

const _$TemperatureUnitsEnumMap = {
  TemperatureUnits.fahrenheit: 'fahrenheit',
  TemperatureUnits.celsius: 'celsius',
};
