import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';
import '/features/dashboard/view/dashboard_page.dart';
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
    () => runApp(const WeatherTwentyTwoApp()),
    blocObserver: WeatherTwentyTwoBlocObserver(),
    storage: storage,
  );
}

class WeatherTwentyTwoApp extends StatelessWidget {
  const WeatherTwentyTwoApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
      ),
      title: 'Weather Twenty Two',
      debugShowCheckedModeBanner: false,
      home: const DashboardPage(),
      //home: LoginPage(),
    );
  }
}
