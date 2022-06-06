import '../../models/models.dart';
import 'api_service_base.dart';

/// {@template open_weather_api_client}
/// Dart API Client which wraps the [Open Weather API](https://api.openweathermap.org/).
/// {@endtemplate}
class OpenWeatherApi extends ApiServiceBase {
  static const String _apiKey = 'todo';
  static const String _baseApiAuthority = 'api.openweathermap.org';

  /// Finds a [LocationDto] `geo/1.0/direct?q={city name},{country code}&limit={limit}&appid={API key}`.
  Future<LocationDto> locationSearch(
      String location, String countryCode) async {
    try {
      var apiEndpoint = 'geo/1.0/direct';
      Map<String, dynamic> parameters = {
        'q': location + ',' + countryCode,
        'limit': '1',
        'appId': _apiKey,
      };

      final responseJson =
          await get<dynamic, void>(_baseApiAuthority, apiEndpoint, parameters);

      if (responseJson.isEmpty) {
        throw LocationNotFoundFailure();
      }

      return LocationDto.fromJson(responseJson.first as Map<String, dynamic>);
    } on RequestFailureException {
      throw LocationRequestFailure();
    }
  }

  /// Fetches [CurrentWeatherDot] data/2.5/weather?lat={lat}&lon={lon}&appid={API key}
  Future<CurrentWeatherDto> getWeather(
      double latitude, double longitude) async {
    try {
      var apiEndpoint = 'data/2.5/weather';
      Map<String, dynamic> parameters = {
        'lat': latitude,
        'lon': longitude,
        'appId': _apiKey
      };

      final responseJson =
          await get<dynamic, void>(_baseApiAuthority, apiEndpoint, parameters);

      if (responseJson.isEmpty) {
        throw CurrentWeatherNotFoundFailure();
      }

      return CurrentWeatherDto.fromJson(
          responseJson.first as Map<String, dynamic>);
    } on RequestFailureException {
      throw CurrentWeatherRequestFailure();
    }
  }

  /// Finds a [WeatherForecastDTO] 'data/2.5/forecast/daily'
  Future<WeatherForecastDTO> getDailyWeatherForecasts(
      String location, String countryCode, int dayCount) async {
    var apiEndpoint = 'data/2.5/forecast/daily';
    try {
      Map<String, dynamic> parameters = {
        'q': location + ',' + countryCode,
        'cnt': dayCount.toString(),
        'appId': _apiKey
      };

      final responseJson =
          await get<dynamic, void>(_baseApiAuthority, apiEndpoint, parameters);

      if (responseJson.isEmpty) {
        // TODO - Fix this error
        throw CurrentWeatherNotFoundFailure();
      }

      return WeatherForecastDTO.fromJson(
          responseJson.first as Map<String, dynamic>);
    } on RequestFailureException {
      // TODO - Fix this exception
      throw CurrentWeatherRequestFailure();
    }
  }
}
