import 'package:json_annotation/json_annotation.dart';

part 'location_dto.g.dart';

@JsonSerializable()
class LocationDto {
  final String? name;
  //LocalNames? localNames;
  @JsonKey(name: 'lat')
  final double? latitude;
  @JsonKey(name: 'lon')
  final double? logitude;
  final String? country;
  final String? state;

  const LocationDto(
      {required this.name,
      //this.localNames,
      required this.latitude,
      required this.logitude,
      required this.country,
      required this.state});

  factory LocationDto.fromJson(Map<String, dynamic> json) =>
      _$LocationDtoFromJson(json);
}
