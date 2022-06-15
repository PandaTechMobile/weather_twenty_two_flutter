// ignore_for_file: prefer_const_constructors

import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:weather_twenty_two_flutter/features/dashboard/cubit/current_weather_cubit.dart';
import 'package:weather_twenty_two_flutter/features/dashboard/models/models.dart';
import 'package:weather_twenty_two_flutter/features/dashboard/view/dashboard_page.dart';
import 'package:weather_twenty_two_flutter/features/dashboard/view/dashboard_view.dart';
import 'package:weather_twenty_two_flutter/features/dashboard/widgets/widgets.dart';
import 'package:weather_twenty_two_flutter/features/search/view/location_search_page.dart';
import 'package:weather_twenty_two_flutter/features/settings/view/settings_page.dart';

import '../../helpers/hydrated_bloc.dart';

//class MockWeatherRepository extends Mock implements WeatherRepository {}

//class MockThemeCubit extends MockCubit<Color> implements ThemeCubit {}

class MockCurrentWeatherCubit extends MockCubit<CurrentWeatherState>
    implements CurrentWeatherCubit {}

void main() {
  group('DashboardPage', () {
    //late WeatherRepository weatherRepository;

    setUp(() {
      //weatherRepository = MockWeatherRepository();
    });

    testWidgets('renders DashboardView', (tester) async {
      await mockHydratedStorage(() async {
        // await tester.pumpWidget(RepositoryProvider.value(
        //   value: weatherRepository,
        //   child: MaterialApp(home: DashboardPage()),
        // ));
        await tester.pumpWidget(MaterialApp(home: DashboardPage()));
      });

      expect(find.byType(DashboardView), findsOneWidget);
    });
  });

  group('DashboardView', () {
    final weather = CurrentWeather(
      temperature: Temperature(value: 4.2),
      condition: 'Fine',
      lastUpdated: DateTime(2020),
      location: 'London',
    );
    //late ThemeCubit themeCubit;
    late CurrentWeatherCubit currentWeatherCubit;

    setUp(() {
      //themeCubit = MockThemeCubit();
      currentWeatherCubit = MockCurrentWeatherCubit();
    });

    testWidgets('renders CurrentWeatherEmpty for CurrentWeatherStatus.initial',
        (tester) async {
      when(() => currentWeatherCubit.state).thenReturn(CurrentWeatherState());
      await tester.pumpWidget(BlocProvider.value(
        value: currentWeatherCubit,
        child: MaterialApp(home: DashboardView()),
      ));
      expect(find.byType(CurrentWeatherEmpty), findsOneWidget);
    });

    testWidgets(
        'renders CurrentWeatherLoading for CurrentWeatherStatus.loading',
        (tester) async {
      when(() => currentWeatherCubit.state).thenReturn(CurrentWeatherState(
        status: CurrentWeatherStatus.loading,
      ));
      await tester.pumpWidget(BlocProvider.value(
        value: currentWeatherCubit,
        child: MaterialApp(home: DashboardView()),
      ));
      expect(find.byType(CurrentWeatherLoading), findsOneWidget);
    });

    testWidgets(
        'renders CurrentWeatherPopulated for CurrentWeatherStatus.success',
        (tester) async {
      when(() => currentWeatherCubit.state).thenReturn(CurrentWeatherState(
        status: CurrentWeatherStatus.success,
        currentWeather: weather,
      ));
      await tester.pumpWidget(BlocProvider.value(
        value: currentWeatherCubit,
        child: MaterialApp(home: DashboardView()),
      ));
      expect(find.byType(CurrentWeatherPopulated), findsOneWidget);
    });

    testWidgets('renders CurrentWeatherError for CurrentWeatherStatus.failure',
        (tester) async {
      when(() => currentWeatherCubit.state).thenReturn(CurrentWeatherState(
        status: CurrentWeatherStatus.failure,
      ));
      await tester.pumpWidget(BlocProvider.value(
        value: currentWeatherCubit,
        child: MaterialApp(home: DashboardView()),
      ));
      expect(find.byType(CurrentWeatherError), findsOneWidget);
    });

    testWidgets('state is cached', (tester) async {
      final storage = MockStorage();
      when<dynamic>(() => storage.read('CurrentWeatherCubit')).thenReturn(
        CurrentWeatherState(
          status: CurrentWeatherStatus.success,
          currentWeather: weather,
          temperatureUnits: TemperatureUnits.fahrenheit,
        ).toJson(),
      );
      await mockHydratedStorage(() async {
        await tester.pumpWidget(BlocProvider.value(
          //value: CurrentWeatherCubit(MockCurrentWeatherRepository()),
          value: CurrentWeatherCubit(),
          child: MaterialApp(home: DashboardView()),
        ));
      }, storage: storage);
      expect(find.byType(CurrentWeatherPopulated), findsOneWidget);
    });

    testWidgets('navigates to SettingsPage when settings icon is tapped',
        (tester) async {
      when(() => currentWeatherCubit.state).thenReturn(CurrentWeatherState());
      await tester.pumpWidget(BlocProvider.value(
        value: currentWeatherCubit,
        child: MaterialApp(home: DashboardView()),
      ));
      // find Widget
      //var buttonFind = find.byIcon(Icons.settings);
      //expect(buttonFind, findsOneWidget);

      //await tester.tap(find.byType(IconButton));

      await tester.tap(find.byIcon(Icons.settings));
      await tester.pumpAndSettle();
      expect(find.byType(SettingsPage), findsOneWidget);
    });

    testWidgets('navigates to SearchPage when search icon is tapped',
        (tester) async {
      when(() => currentWeatherCubit.state).thenReturn(CurrentWeatherState());
      await tester.pumpWidget(BlocProvider.value(
        value: currentWeatherCubit,
        child: MaterialApp(home: DashboardView()),
      ));
      //await tester.tap(find.byType(FloatingActionButton));
      await tester.tap(find.byIcon(Icons.search));
      await tester.pumpAndSettle();
      expect(find.byType(LocationSearchPage), findsOneWidget);
    });

    // testWidgets('calls updateTheme when whether changes', (tester) async {
    //   whenListen(
    //     weatherCubit,
    //     Stream<WeatherState>.fromIterable([
    //       WeatherState(),
    //       WeatherState(status: WeatherStatus.success, weather: weather),
    //     ]),
    //   );
    //   when(() => weatherCubit.state).thenReturn(WeatherState(
    //     status: WeatherStatus.success,
    //     weather: weather,
    //   ));
    //   await tester.pumpWidget(MultiBlocProvider(
    //     providers: [
    //       BlocProvider.value(value: themeCubit),
    //       BlocProvider.value(value: weatherCubit),
    //     ],
    //     child: MaterialApp(home: WeatherView()),
    //   ));
    //   verify(() => themeCubit.updateTheme(weather)).called(1);
    // });

    testWidgets('triggers refreshCurrentWeather on pull to refresh',
        (tester) async {
      when(() => currentWeatherCubit.state).thenReturn(CurrentWeatherState(
        status: CurrentWeatherStatus.success,
        currentWeather: weather,
      ));
      when(() => currentWeatherCubit.refreshCurrentWeather())
          .thenAnswer((_) async {});
      await tester.pumpWidget(BlocProvider.value(
        value: currentWeatherCubit,
        child: MaterialApp(home: DashboardView()),
      ));
      await tester.fling(
        find.text('London'),
        const Offset(0.0, 500.0),
        1000.0,
      );
      await tester.pumpAndSettle();
      verify(() => currentWeatherCubit.refreshCurrentWeather()).called(1);
    });

    // TODO - This needs to be fixed
    testWidgets('triggers fetch on search pop', (tester) async {
      when(() => currentWeatherCubit.state).thenReturn(CurrentWeatherState());
      when(() => currentWeatherCubit.fetchCurrentWeather(any(), any()))
          .thenAnswer((_) async {});
      await tester.pumpWidget(BlocProvider.value(
        value: currentWeatherCubit,
        child: MaterialApp(home: DashboardView()),
      ));
      //await tester.tap(find.byType(FloatingActionButton));
      await tester.tap(find.byIcon(Icons.search));
      await tester.pumpAndSettle();
      await tester.enterText(find.byType(TextField), 'Chicago');
      await tester.tap(find.byKey(const Key('searchPage_search_iconButton')));
      await tester.pumpAndSettle();
      verify(() =>
              currentWeatherCubit.fetchCurrentWeather(-32.9192953, 151.7795348))
          .called(1);
    });
  });
}
