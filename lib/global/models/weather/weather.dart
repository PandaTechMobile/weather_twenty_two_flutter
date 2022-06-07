import 'package:json_annotation/json_annotation.dart';

part 'weather.g.dart';

@JsonSerializable()
class Weather {
  int? id;
  @JsonKey(name: 'main')
  String? descriptionSimple;
  @JsonKey(name: 'description')
  String? description;
  String? icon;

  Weather({this.id, this.descriptionSimple, this.description, this.icon});

  factory Weather.fromJson(Map<String, dynamic> json) =>
      _$WeatherFromJson(json);

  Map<String, dynamic> toJson() => _$WeatherToJson(this);
}
