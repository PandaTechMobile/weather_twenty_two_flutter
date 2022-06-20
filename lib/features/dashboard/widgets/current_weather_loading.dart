import 'package:flutter/material.dart';

import 'weather_background.dart';

class CurrentWeatherLoading extends StatelessWidget {
  const CurrentWeatherLoading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Stack(children: [
      WeatherBackground(),
      Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text('⛅', style: TextStyle(fontSize: 64)),
            Text(
              'Loading Weather',
              style: theme.textTheme.headline5,
            ),
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: CircularProgressIndicator(),
            ),
          ],
        ),
      ),
    ]);
  }
}
