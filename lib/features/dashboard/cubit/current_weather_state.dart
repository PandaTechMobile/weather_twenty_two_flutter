part of 'current_weather_cubit.dart';

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
    CurrentWeather? currentWeather,
  }) : currentWeather = currentWeather ?? CurrentWeather.empty;

  factory CurrentWeatherState.fromJson(Map<String, dynamic> json) =>
      _$CurrentWeatherStateFromJson(json);

  final CurrentWeatherStatus status;
  final CurrentWeather currentWeather;
  final TemperatureUnits temperatureUnits;

  CurrentWeatherState copyWith({
    CurrentWeatherStatus? status,
    TemperatureUnits? temperatureUnits,
    CurrentWeather? currentWeather,
  }) {
    return CurrentWeatherState(
      status: status ?? this.status,
      temperatureUnits: temperatureUnits ?? this.temperatureUnits,
      currentWeather: currentWeather ?? this.currentWeather,
    );
  }

  Map<String, dynamic> toJson() => _$CurrentWeatherStateToJson(this);

  @override
  List<Object?> get props => [status, temperatureUnits, currentWeather];
}
