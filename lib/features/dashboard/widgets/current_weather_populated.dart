import 'package:flutter/material.dart';
import 'package:weather_twenty_two_flutter/enums/weather_condition.dart';

import '../models/models.dart';
import 'weather_background.dart';

class CurrentWeatherPopulated extends StatelessWidget {
  const CurrentWeatherPopulated({
    Key? key,
    required this.currentWeather,
    required this.temperatureUnits,
    required this.onRefresh,
  }) : super(key: key);

  final CurrentWeather currentWeather;
  final TemperatureUnits temperatureUnits;
  final ValueGetter<Future<void>> onRefresh;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Stack(
      children: [
        WeatherBackground(),
        RefreshIndicator(
          onRefresh: onRefresh,
          child: SingleChildScrollView(
            physics: const AlwaysScrollableScrollPhysics(),
            clipBehavior: Clip.none,
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(height: 48),
                  _WeatherIcon(condition: currentWeather.condition),
                  Text(
                    currentWeather.location,
                    style: theme.textTheme.headline2?.copyWith(
                      fontWeight: FontWeight.w200,
                    ),
                  ),
                  Text(
                    currentWeather.formattedTemperature(temperatureUnits),
                    style: theme.textTheme.headline3?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    '''Last Updated at ${TimeOfDay.fromDateTime(currentWeather.lastUpdated).format(context)}''',
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class _WeatherIcon extends StatelessWidget {
  const _WeatherIcon({Key? key, required this.condition}) : super(key: key);

  static const _iconSize = 100.0;

  //final WeatherCondition condition;
  final WeatherCondition condition;

  String _weatherConditionToEmoji(WeatherCondition weatherCondition) {
    switch (weatherCondition) {
      case WeatherCondition.clear:
        return '☀️';
      case WeatherCondition.rain:
      case WeatherCondition.drizzle:
        return '🌧️';
      case WeatherCondition.clouds:
        return '☁️';
      case WeatherCondition.snow:
        return '🌨️';
      default:
        return '❓';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      //condition.toEmoji,
      _weatherConditionToEmoji(condition),
      style: const TextStyle(fontSize: _iconSize),
    );
  }
}

extension on CurrentWeather {
  String formattedTemperature(TemperatureUnits units) {
    return '''${temperature.value.toStringAsPrecision(2)}°${units.isCelsius ? 'C' : 'F'}''';
  }
}
//   String _weatherConditionToEmoji(String weatherCondition) {
//     switch (weatherCondition) {
//       case 'Clear':
//       case 'Fine':
//         return '☀️';
//       case 'Rain':
//         return '🌧️';
//       case 'Clouds':
//         return '☁️';
//       case 'Snow':
//         return '🌨️';
//       default:
//         return '❓';
//     }
//   }
// }

// extension on WeatherCondition {
//   String get toEmoji {
//     switch (this) {
//       case WeatherCondition.clear:
//         return '☀️';
//       case WeatherCondition.rainy:
//         return '🌧️';
//       case WeatherCondition.cloudy:
//         return '☁️';
//       case WeatherCondition.snowy:
//         return '🌨️';
//       case WeatherCondition.unknown:
//       default:
//         return '❓';
//     }
//   }
// }
