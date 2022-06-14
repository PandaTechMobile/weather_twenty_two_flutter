import '../api/open_weather_api.dart';
import '../models/models.dart';

class LocationService {
  LocationService({OpenWeatherApi? openWeatherApi})
      : _openWeatherApi = openWeatherApi ?? OpenWeatherApi();

  final OpenWeatherApi _openWeatherApi;

  Future<LocationDto> getLocation(
      String locationName, String countryCode) async {
    return _openWeatherApi.getLocation(locationName, countryCode);
  }
}
