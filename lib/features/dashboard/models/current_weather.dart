import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import 'temperature.dart';

part 'current_weather.g.dart';

@JsonSerializable()
class CurrentWeather extends Equatable {
  const CurrentWeather({
    required this.condition,
    required this.lastUpdated,
    required this.location,
    required this.temperature,
  });

  factory CurrentWeather.fromJson(Map<String, dynamic> json) =>
      _$CurrentWeatherFromJson(json);

  // factory Weather.fromRepository(weather_repository.Weather weather) {
  //   return Weather(
  //     condition: weather.condition,
  //     lastUpdated: DateTime.now(),
  //     location: weather.location,
  //     temperature: Temperature(value: weather.temperature),
  //   );
  // }

  static final empty = CurrentWeather(
    //condition: WeatherCondition.unknown,
    condition: '??',
    lastUpdated: DateTime(0),
    temperature: const Temperature(value: 0),
    location: '--',
  );

  //final WeatherCondition condition;
  final String condition;
  final DateTime lastUpdated;
  final String location;
  final Temperature temperature;

  @override
  List<Object> get props => [condition, lastUpdated, location, temperature];

  Map<String, dynamic> toJson() => _$CurrentWeatherToJson(this);

  CurrentWeather copyWith({
    //WeatherCondition? condition,
    String? condition,
    DateTime? lastUpdated,
    String? location,
    Temperature? temperature,
  }) {
    return CurrentWeather(
      condition: condition ?? this.condition,
      lastUpdated: lastUpdated ?? this.lastUpdated,
      location: location ?? this.location,
      temperature: temperature ?? this.temperature,
    );
  }
}
