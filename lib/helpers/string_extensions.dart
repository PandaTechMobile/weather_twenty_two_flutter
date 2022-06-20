import '../enums/weather_condition.dart';

extension WeatherConditionExention on String {
  WeatherCondition get toWeatherCondition {
    switch (this) {
      case 'Clouds':
        return WeatherCondition.clouds;
      case 'Clear':
        return WeatherCondition.clear;
      case 'Snow':
        return WeatherCondition.snow;
      case 'Thunderstorm':
        return WeatherCondition.thunderstorm;
      case 'Rain':
        return WeatherCondition.rain;
      case 'Drizzle':
        return WeatherCondition.drizzle;
      case 'Mist':
        return WeatherCondition.mist;
      case 'Smoke':
        return WeatherCondition.smoke;
      case 'Haze':
        return WeatherCondition.haze;
      case 'Fog':
        return WeatherCondition.fog;
      case 'Sand':
        return WeatherCondition.sand;
      case 'Dust':
        return WeatherCondition.dust;
      case 'Ash':
        return WeatherCondition.ash;
      case 'Squall':
        return WeatherCondition.squall;
      case 'Tornado':
        return WeatherCondition.tornado;
      default:
        return WeatherCondition.unknown;
    }
  }
}
