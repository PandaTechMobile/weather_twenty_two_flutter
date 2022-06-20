import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';

import '/features/dashboard/view/dashboard_page.dart';
import 'features/dashboard/services/weather_service.dart';
import 'weather_twenty_two_bloc_observer.dart';

void main() async {
  // HydratedBlocOverrides.runZoned(
  //       () => runApp(WeatherTwentyTwoApp()),
  //   blocObserver: WeatherTwentyTwoBlocObserver(),
  //   createStorage: () async {
  //     WidgetsFlutterBinding.ensureInitialized();
  //     return HydratedStorage.build(
  //       storageDirectory: kIsWeb
  //           ? HydratedStorage.webStorageDirectory
  //           : await getTemporaryDirectory(),
  //     );
  //   },
  // );
  WidgetsFlutterBinding.ensureInitialized();
  final storage = await HydratedStorage.build(
    storageDirectory: kIsWeb
        ? HydratedStorage.webStorageDirectory
        : await getTemporaryDirectory(),
  );
  HydratedBlocOverrides.runZoned(
    () => runApp(WeatherTwentyTwoApp(weatherService: WeatherService())),
    blocObserver: WeatherTwentyTwoBlocObserver(),
    storage: storage,
  );
}

class WeatherTwentyTwoApp extends StatelessWidget {
  const WeatherTwentyTwoApp({Key? key, required WeatherService weatherService})
      : _weatherService = weatherService,
        super(key: key);

  final WeatherService _weatherService;

  // @override
  // Widget build(BuildContext context) {
  //   return MaterialApp(
  //     theme: ThemeData(
  //       primarySwatch: Colors.blueGrey,
  //     ),
  //     title: 'Weather Twenty Two',
  //     debugShowCheckedModeBanner: false,
  //     home: const DashboardPage(),
  //     //home: LoginPage(),
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider.value(
      value: _weatherService,
      child: const WeatherTwentyTwoAppView(),
      // child: BlocProvider(
      //   create: (_) => ThemeCubit(),
      //   child: WeatherTwentyTwoAppView(),
      // ),
    );
  }
}

class WeatherTwentyTwoAppView extends StatelessWidget {
  const WeatherTwentyTwoAppView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return MaterialApp(
      title: 'Weather Twenty Two',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
        textTheme: GoogleFonts.rajdhaniTextTheme(),
        appBarTheme: AppBarTheme(
          titleTextStyle: GoogleFonts.rajdhaniTextTheme(textTheme)
              .apply(bodyColor: Colors.white)
              .headline6,
        ),
      ),
      debugShowCheckedModeBanner: false,
      home: DashboardPage(),
    );
  }
}
