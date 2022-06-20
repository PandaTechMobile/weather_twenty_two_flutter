import 'package:weather_twenty_two_flutter/models/weather/weather_model.dart';

import '../../../repository/repository.dart';

class WeatherService {
  WeatherService({WeatherRepository? weatherRepository})
      : _weatherRepository = weatherRepository ?? WeatherRepository();

  final WeatherRepository _weatherRepository;

  // Future<CurrentWeather> getCurrentWeather(
  //     double latitude, double longitude) async {
  //   var currentWeather =
  //       await _weatherRepository.getCurrentWeather(latitude, longitude);
  //
  //   return CurrentWeather.fromRepository(currentWeather);
  // }

  Future<WeatherModel> getCurrentWeather(
      double latitude, double longitude) async {
    var currentWeather =
        await _weatherRepository.getCurrentWeather(latitude, longitude);

    return currentWeather;
  }
}
