import 'package:json_annotation/json_annotation.dart';

part 'location_model.g.dart';

@JsonSerializable()
class LocationModel {
  final String name;
  final double latitude;
  final double longitude;
  final String? country;
  final String? state;

  const LocationModel(
      {required this.name,
      required this.latitude,
      required this.longitude,
      required this.country,
      required this.state});

  factory LocationModel.fromJson(Map<String, dynamic> json) =>
      _$LocationModelFromJson(json);

  Map<String, dynamic> toJson() => _$LocationModelToJson(this);
}
