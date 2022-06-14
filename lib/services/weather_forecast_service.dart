import '../api/open_weather_api.dart';
import '../models/models.dart';

class WeatherForecastService {
  WeatherForecastService({OpenWeatherApi? openWeatherApi})
      : _openWeatherApi = openWeatherApi ?? OpenWeatherApi();

  final OpenWeatherApi _openWeatherApi;

  Future<CurrentWeatherDto> getCurrentWeather(
      double latitude, double longitude) async {
    return _openWeatherApi.getWeather(latitude, longitude);
  }
}
