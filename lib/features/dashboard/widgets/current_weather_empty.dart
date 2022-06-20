import 'package:flutter/material.dart';

import 'weather_background.dart';

class CurrentWeatherEmpty extends StatelessWidget {
  const CurrentWeatherEmpty({Key? key}) : super(key: key);

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
            const Text('🏙️', style: TextStyle(fontSize: 64)),
            Text(
              'Please Select a City!',
              style: theme.textTheme.headline5,
            ),
          ],
        ),
      ),
    ]);
  }
}
