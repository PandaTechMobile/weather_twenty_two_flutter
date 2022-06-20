import 'package:weather_twenty_two_flutter/models/models.dart';

import '../api/open_weather_api.dart';

class LocationRepository {
  LocationRepository({OpenWeatherApi? openWeatherApi})
      : _openWeatherApi = openWeatherApi ?? OpenWeatherApi();

  final OpenWeatherApi _openWeatherApi;

  Future<LocationModel> getLocation(
      String locationName, String countryCode) async {
    final location =
        await _openWeatherApi.getLocation(locationName, countryCode);

    return LocationModel(
        name: location.name!,
        latitude: location.latitude!,
        longitude: location.logitude!,
        country: location.country,
        state: location.state);
  }
}
