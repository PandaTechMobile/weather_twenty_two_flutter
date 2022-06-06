// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'location_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LocationDto _$LocationDtoFromJson(Map<String, dynamic> json) => LocationDto(
      name: json['name'] as String?,
      latitude: (json['lat'] as num?)?.toDouble(),
      logitude: (json['lon'] as num?)?.toDouble(),
      country: json['country'] as String?,
      state: json['state'] as String?,
    );

Map<String, dynamic> _$LocationDtoToJson(LocationDto instance) =>
    <String, dynamic>{
      'name': instance.name,
      'lat': instance.latitude,
      'lon': instance.logitude,
      'country': instance.country,
      'state': instance.state,
    };
