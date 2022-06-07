part of 'current_weather_cubit.dart';

import 'package:equatable/equatable.dart';

enum CurrentWeatherStatus { initial, loading, success, failure }

extension CurrentWeatherStatusX on CurrentWeatherStatus {
  bool get isInitial => this == CurrentWeatherStatus.initial;
  bool get isLoading => this == CurrentWeatherStatus.loading;
  bool get isSuccess => this == CurrentWeatherStatus.success;
  bool get isFailure => this == CurrentWeatherStatus.failure;
}

@JsonSerializable()
class CurrentWeatherState extends Equatable {
  CurrentWeatherState({
    this.status = CurrentWeatherStatus.initial,
    this.temperatureUnits = TemperatureUnits.celsius,
    Weather? weather,
  }) : weather = weather ?? Weather.empty;
