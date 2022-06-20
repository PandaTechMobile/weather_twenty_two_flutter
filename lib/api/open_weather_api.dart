import 'package:http/http.dart' as http;

import '../../exceptions/exceptions.dart';
import '../../models/models_dto.dart';
import 'base_api.dart';

/// {@template open_weather_api_client}
/// Dart API Client which wraps the [Open Weather API](https://api.openweathermap.org/).
/// {@endtemplate}
class OpenWeatherApi extends BaseApi {
  static const String _apiKey = 'cc9744ca800087e4526b74ae84e1f065';
  static const String _baseApiAuthority = 'api.openweathermap.org';

  OpenWeatherApi({http.Client? httpClient}) : super(httpClient: httpClient);

  /// Finds a [LocationDto] `geo/1.0/direct?q={city name},{country code}&limit={limit}&appid={API key}`.
  Future<LocationDto> getLocation(
      String locationName, String countryCode) async {
    try {
      var apiEndpoint = 'geo/1.0/direct';
      Map<String, dynamic> parameters = {
        'q': '$locationName,$countryCode',
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
        'lat': latitude.toString(),
        'lon': longitude.toString(),
        'appId': _apiKey
      };

      // Map<String, dynamic> parameters = {
      //   'lat': latitude,
      //   'lon': longitude,
      //   'appId': _apiKey
      // };

      final responseJson =
          await get<dynamic, void>(_baseApiAuthority, apiEndpoint, parameters);

      if (responseJson.isEmpty) {
        throw CurrentWeatherNotFoundFailure();
      }

      // return CurrentWeatherDto.fromJson(
      //     responseJson.first as Map<String, dynamic>);
      return CurrentWeatherDto.fromJson(responseJson as Map<String, dynamic>);
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
        'q': '$location,$countryCode',
        'cnt': dayCount.toString(),
        'appId': _apiKey
      };

      final responseJson =
          await get<dynamic, void>(_baseApiAuthority, apiEndpoint, parameters);

      if (responseJson.isEmpty) {
        // TODO - Fix this error
        throw DailyWeatherForecastsNotFoundFailure();
      }

      return WeatherForecastDTO.fromJson(
          responseJson.first as Map<String, dynamic>);
    } on RequestFailureException {
      // TODO - Fix this exception
      throw DailyWeatherForecastsRequestFailure();
    }
  }
}
