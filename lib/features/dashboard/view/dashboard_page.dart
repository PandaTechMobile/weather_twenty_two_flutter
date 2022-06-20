import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_twenty_two_flutter/features/dashboard/services/weather_service.dart';

import '../cubit/current_weather_cubit.dart';
import 'dashboard_view.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({Key? key}) : super(key: key);

  static Route route() {
    return MaterialPageRoute<void>(builder: (_) => const DashboardPage());
  }

  @override
  Widget build(BuildContext context) {
    // return BlocProvider(
    //   create: (context) => WeatherCubit(context.read<WeatherRepository>()),
    //   child: WeatherView(),
    // );

    // TODO - refactor into the widget
    return BlocProvider(
      create: (context) => CurrentWeatherCubit(context.read<WeatherService>()),
      child: const DashboardView(),
    );
  }
}
