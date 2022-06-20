import 'package:weather_twenty_two_flutter/enums/weather_condition.dart';
import 'package:weather_twenty_two_flutter/helpers/string_extensions.dart';

import '../api/open_weather_api.dart';
import '../models/weather/weather_model.dart';

class WeatherRepository {
  WeatherRepository({OpenWeatherApi? openWeatherApi})
      : _openWeatherApi = openWeatherApi ?? OpenWeatherApi();

  final OpenWeatherApi _openWeatherApi;

  Future<WeatherModel> getCurrentWeather(
      double latitude, double longitude) async {
    var weather = await _openWeatherApi.getWeather(latitude, longitude);
    return WeatherModel(
      locationName: weather.name!,
      temperature: weather.mainWeatherInfo!.temp!,
      condition: weather.weather?.first.descriptionSimple?.toWeatherCondition ??
          WeatherCondition.unknown,
      icon: weather.weather?.first.icon ?? '',
    );
  }
}
