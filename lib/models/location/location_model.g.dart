// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'location_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LocationModel _$LocationModelFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'LocationModel',
      json,
      ($checkedConvert) {
        final val = LocationModel(
          name: $checkedConvert('name', (v) => v as String),
          latitude: $checkedConvert('latitude', (v) => (v as num).toDouble()),
          longitude: $checkedConvert('longitude', (v) => (v as num).toDouble()),
          country: $checkedConvert('country', (v) => v as String?),
          state: $checkedConvert('state', (v) => v as String?),
        );
        return val;
      },
    );

Map<String, dynamic> _$LocationModelToJson(LocationModel instance) =>
    <String, dynamic>{
      'name': instance.name,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      'country': instance.country,
      'state': instance.state,
    };
