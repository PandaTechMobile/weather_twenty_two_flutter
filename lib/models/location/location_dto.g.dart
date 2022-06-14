// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'location_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LocationDto _$LocationDtoFromJson(Map<String, dynamic> json) => $checkedCreate(
      'LocationDto',
      json,
      ($checkedConvert) {
        final val = LocationDto(
          name: $checkedConvert('name', (v) => v as String?),
          latitude: $checkedConvert('lat', (v) => (v as num?)?.toDouble()),
          logitude: $checkedConvert('lon', (v) => (v as num?)?.toDouble()),
          country: $checkedConvert('country', (v) => v as String?),
          state: $checkedConvert('state', (v) => v as String?),
        );
        return val;
      },
      fieldKeyMap: const {'latitude': 'lat', 'logitude': 'lon'},
    );

Map<String, dynamic> _$LocationDtoToJson(LocationDto instance) =>
    <String, dynamic>{
      'name': instance.name,
      'lat': instance.latitude,
      'lon': instance.logitude,
      'country': instance.country,
      'state': instance.state,
    };
