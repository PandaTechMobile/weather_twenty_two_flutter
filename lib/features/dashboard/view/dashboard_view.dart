import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../settings/view/settings_page.dart';
import '../cubit/current_weather_cubit.dart';
import '../widgets/widgets.dart';

class DashboardView extends StatelessWidget {
  const DashboardView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Weather'),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {
              Navigator.of(context).push<void>(SettingsPage.route(
                context.read<CurrentWeatherCubit>(),
              ));
            },
          ),
        ],
      ),
      body: Center(
        child: BlocConsumer<CurrentWeatherCubit, CurrentWeatherState>(
          listener: (context, state) {
            if (state.status.isSuccess) {
              //context.read<ThemeCubit>().updateTheme(state.weather);
            }
          },
          builder: (context, state) {
            switch (state.status) {
              case CurrentWeatherStatus.initial:
                return const CurrentWeatherEmpty();
              case CurrentWeatherStatus.loading:
                return const CurrentWeatherLoading();
              case CurrentWeatherStatus.success:
                return CurrentWeatherPopulated(
                  currentWeather: state.currentWeather,
                  temperatureUnits: state.temperatureUnits,
                  onRefresh: () {
                    return context
                        .read<CurrentWeatherCubit>()
                        .refreshCurrentWeather();
                  },
                );
              case CurrentWeatherStatus.failure:
              default:
                return const CurrentWeatherError();
            }
          },
        ),
      ),
      // floatingActionButton: FloatingActionButton(
      //   child: const Icon(Icons.search),
      //   onPressed: () async {
      //     //final city = await Navigator.of(context).push(SearchPage.route());
      //     await context.read<CurrentWeatherCubit>().fetchCurrentWeather(0, 0);
      //   },
      // ),
    );
  }
}
