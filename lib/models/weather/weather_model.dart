import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../enums/weather_condition.dart';

part 'weather_model.g.dart';

@JsonSerializable()
class WeatherModel extends Equatable {
  const WeatherModel({
    required this.locationName,
    required this.temperature,
    required this.condition,
    required this.icon,
  });

  factory WeatherModel.fromJson(Map<String, dynamic> json) =>
      _$WeatherModelFromJson(json);

  Map<String, dynamic> toJson() => _$WeatherModelToJson(this);

  final String locationName;
  final double temperature;
  final WeatherCondition condition;
  final String icon;

  @override
  List<Object> get props => [locationName, temperature, condition, icon];
}
