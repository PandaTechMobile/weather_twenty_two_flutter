// ignore_for_file: prefer_const_constructors
import 'package:bloc_test/bloc_test.dart';
//import 'package:mocktail/mocktail.dart';
import 'package:test/test.dart';
import 'package:weather_twenty_two_flutter/features/dashboard/cubit/current_weather_cubit.dart';
import 'package:weather_twenty_two_flutter/features/dashboard/models/models.dart';
import 'package:weather_twenty_two_flutter/global/helpers/double_extensions.dart';
//import 'package:weather_repository/weather_repository.dart' as weather_repository;

import '../../helpers/hydrated_bloc.dart';

const currentWeatherLocation = 'Newcastle';
const currentWeatherCondition = 'Fine';
const currentWeatherTemperature = 9.8;

// class MockWeatherRepository extends Mock
//     implements weather_repository.WeatherRepository {}

//class MockWeather extends Mock implements weather_repository.Weather {}

void main() {
  group('CurrentWeatherCubit', () {
    //late weather_repository.Weather weather;
    //late weather_repository.WeatherRepository weatherRepository;
    late CurrentWeatherCubit currentWeatherCubit;

    setUp(() async {
      // weather = MockWeather();
      // weatherRepository = MockWeatherRepository();
      // when(() => weather.condition).thenReturn(weatherCondition);
      // when(() => weather.location).thenReturn(weatherLocation);
      // when(() => weather.temperature).thenReturn(weatherTemperature);
      // when(
      //       () => weatherRepository.getWeather(any()),
      // ).thenAnswer((_) async => weather);
      // weatherCubit = await mockHydratedStorage(
      //       () => WeatherCubit(weatherRepository),
      // );

      // Carl Mock addition
      currentWeatherCubit = await mockHydratedStorage(
        () => CurrentWeatherCubit(),
      );
    });

    test('initial state is correct', () {
      mockHydratedStorage(() {
        //final weatherCubit = WeatherCubit(weatherRepository);
        final currentWeatherCubit = CurrentWeatherCubit();
        expect(currentWeatherCubit.state, CurrentWeatherState());
      });
    });

    group('toJson/fromJson', () {
      test('work properly', () {
        mockHydratedStorage(() {
          //final weatherCubit = WeatherCubit(weatherRepository);
          final currentWeatherCubit = CurrentWeatherCubit();
          expect(
            currentWeatherCubit.fromJson(
                currentWeatherCubit.toJson(currentWeatherCubit.state)),
            currentWeatherCubit.state,
          );
        });
      });
    });

    group('fetchCurrentWeather', () {
      blocTest<CurrentWeatherCubit, CurrentWeatherState>(
        'emits nothing when latitude and longitude is null',
        build: () => currentWeatherCubit,
        act: (cubit) => cubit.fetchCurrentWeather(null, null),
        expect: () => <CurrentWeatherState>[],
      );

      blocTest<CurrentWeatherCubit, CurrentWeatherState>(
        'emits nothing when latitude is null',
        build: () => currentWeatherCubit,
        act: (cubit) => cubit.fetchCurrentWeather(null, 0),
        expect: () => <CurrentWeatherState>[],
      );

      blocTest<CurrentWeatherCubit, CurrentWeatherState>(
        'emits nothing when longitude is null',
        build: () => currentWeatherCubit,
        act: (cubit) => cubit.fetchCurrentWeather(0, null),
        expect: () => <CurrentWeatherState>[],
      );

      // blocTest<WeatherCubit, WeatherState>(
      //   'calls getWeather with correct city',
      //   build: () => weatherCubit,
      //   act: (cubit) => cubit.fetchWeather(weatherLocation),
      //   verify: (_) {
      //     verify(() => weatherRepository.getWeather(weatherLocation)).called(1);
      //   },
      // );

      // blocTest<CurrentWeatherCubit, CurrentWeatherState>(
      //   'emits [loading, failure] when getCurrentWeather throws',
      //   setUp: () {
      //     // when(
      //     //   () => weatherRepository.getWeather(any()),
      //     // ).thenThrow(Exception('oops'));
      //   },
      //   build: () => weatherCubit,
      //   act: (cubit) => cubit.fetchWeather(weatherLocation),
      //   expect: () => <WeatherState>[
      //     WeatherState(status: WeatherStatus.loading),
      //     WeatherState(status: WeatherStatus.failure),
      //   ],
      // );

      blocTest<CurrentWeatherCubit, CurrentWeatherState>(
        'emits [loading, success] when getWeather returns (celsius)',
        build: () => currentWeatherCubit,
        act: (cubit) => cubit.fetchCurrentWeather(-32.9192953, 151.7795348),
        expect: () => <dynamic>[
          CurrentWeatherState(status: CurrentWeatherStatus.loading),
          isA<CurrentWeatherState>()
              .having((w) => w.status, 'status', CurrentWeatherStatus.success)
              .having(
                (w) => w.currentWeather,
                'weather',
                isA<CurrentWeather>()
                    .having((w) => w.lastUpdated, 'lastUpdated', isNotNull)
                    .having((w) => w.condition, 'condition',
                        currentWeatherCondition)
                    .having(
                      (w) => w.temperature,
                      'temperature',
                      Temperature(value: currentWeatherTemperature),
                    )
                    .having(
                        (w) => w.location, 'location', currentWeatherLocation),
              ),
        ],
      );

      blocTest<CurrentWeatherCubit, CurrentWeatherState>(
        'emits [loading, success] when getWeather returns (fahrenheit)',
        build: () => currentWeatherCubit,
        seed: () =>
            CurrentWeatherState(temperatureUnits: TemperatureUnits.fahrenheit),
        act: (cubit) => cubit.fetchCurrentWeather(-32.9192953, 151.7795348),
        expect: () => <dynamic>[
          CurrentWeatherState(
            status: CurrentWeatherStatus.loading,
            temperatureUnits: TemperatureUnits.fahrenheit,
          ),
          isA<CurrentWeatherState>()
              .having((w) => w.status, 'status', CurrentWeatherStatus.success)
              .having(
                (w) => w.currentWeather,
                'weather',
                isA<CurrentWeather>()
                    .having((w) => w.lastUpdated, 'lastUpdated', isNotNull)
                    .having((w) => w.condition, 'condition',
                        currentWeatherCondition)
                    .having(
                      (w) => w.temperature,
                      'temperature',
                      Temperature(
                          value: currentWeatherTemperature.toFahrenheit()),
                    )
                    .having(
                        (w) => w.location, 'location', currentWeatherLocation),
              ),
        ],
      );
    });

    group('refreshCurrentWeather', () {
      blocTest<CurrentWeatherCubit, CurrentWeatherState>(
        'emits nothing when status is not success',
        build: () => currentWeatherCubit,
        act: (cubit) => cubit.refreshCurrentWeather(),
        expect: () => <CurrentWeatherState>[],
        verify: (_) {
          //verifyNever(() => weatherRepository.getWeather(any()));
        },
      );

      // blocTest<CurrentWeatherCubit, CurrentWeatherState>(
      //   'emits nothing when location is null',
      //   build: () => currentWeatherCubit,
      //   seed: () => CurrentWeatherState(status: CurrentWeatherStatus.success),
      //   act: (cubit) => cubit.refreshCurrentWeather(),
      //   expect: () => <CurrentWeatherState>[],
      //   verify: (_) {
      //     //verifyNever(() => weatherRepository.getWeather(any()));
      //   },
      // );

      // blocTest<WeatherCubit, WeatherState>(
      //   'invokes getWeather with correct location',
      //   build: () => weatherCubit,
      //   seed: () => WeatherState(
      //     status: WeatherStatus.success,
      //     weather: Weather(
      //       location: weatherLocation,
      //       temperature: Temperature(value: weatherTemperature),
      //       lastUpdated: DateTime(2020),
      //       condition: weatherCondition,
      //     ),
      //   ),
      //   act: (cubit) => cubit.refreshWeather(),
      //   verify: (_) {
      //     verify(() => weatherRepository.getWeather(weatherLocation)).called(1);
      //   },
      // );

      // blocTest<WeatherCubit, WeatherState>(
      //   'emits nothing when exception is thrown',
      //   setUp: () {
      //     when(
      //           () => weatherRepository.getWeather(any()),
      //     ).thenThrow(Exception('oops'));
      //   },
      //   build: () => weatherCubit,
      //   seed: () => WeatherState(
      //     status: WeatherStatus.success,
      //     weather: Weather(
      //       location: weatherLocation,
      //       temperature: Temperature(value: weatherTemperature),
      //       lastUpdated: DateTime(2020),
      //       condition: weatherCondition,
      //     ),
      //   ),
      //   act: (cubit) => cubit.refreshWeather(),
      //   expect: () => <WeatherState>[],
      // );

      blocTest<CurrentWeatherCubit, CurrentWeatherState>(
        'emits updated weather (celsius)',
        build: () => currentWeatherCubit,
        seed: () => CurrentWeatherState(
          status: CurrentWeatherStatus.success,
          currentWeather: CurrentWeather(
            location: currentWeatherLocation,
            temperature: Temperature(value: 0.0),
            lastUpdated: DateTime(2020),
            condition: currentWeatherCondition,
          ),
        ),
        act: (cubit) => cubit.refreshCurrentWeather(),
        expect: () => <Matcher>[
          isA<CurrentWeatherState>()
              .having((w) => w.status, 'status', CurrentWeatherStatus.success)
              .having(
                (w) => w.currentWeather,
                'currentWeather',
                isA<CurrentWeather>()
                    .having((w) => w.lastUpdated, 'lastUpdated', isNotNull)
                    .having((w) => w.condition, 'condition',
                        currentWeatherCondition)
                    .having(
                      (w) => w.temperature,
                      'temperature',
                      Temperature(value: currentWeatherTemperature),
                    )
                    .having(
                        (w) => w.location, 'location', currentWeatherLocation),
              ),
        ],
      );

      blocTest<CurrentWeatherCubit, CurrentWeatherState>(
        'emits updated weather (fahrenheit)',
        build: () => currentWeatherCubit,
        seed: () => CurrentWeatherState(
          temperatureUnits: TemperatureUnits.fahrenheit,
          status: CurrentWeatherStatus.success,
          currentWeather: CurrentWeather(
            location: currentWeatherLocation,
            temperature: Temperature(value: 0.0),
            lastUpdated: DateTime(2020),
            condition: currentWeatherCondition,
          ),
        ),
        act: (cubit) => cubit.refreshCurrentWeather(),
        expect: () => <Matcher>[
          isA<CurrentWeatherState>()
              .having((w) => w.status, 'status', CurrentWeatherStatus.success)
              .having(
                (w) => w.currentWeather,
                'currentWeather',
                isA<CurrentWeather>()
                    .having((w) => w.lastUpdated, 'lastUpdated', isNotNull)
                    .having((w) => w.condition, 'condition',
                        currentWeatherCondition)
                    .having(
                      (w) => w.temperature,
                      'temperature',
                      Temperature(
                          value: currentWeatherTemperature.toFahrenheit()),
                    )
                    .having(
                        (w) => w.location, 'location', currentWeatherLocation),
              ),
        ],
      );
    });

    group('toggleUnits', () {
      blocTest<CurrentWeatherCubit, CurrentWeatherState>(
        'emits updated units when status is not success',
        build: () => currentWeatherCubit,
        act: (cubit) => cubit.toggleUnits(),
        expect: () => <CurrentWeatherState>[
          CurrentWeatherState(temperatureUnits: TemperatureUnits.fahrenheit),
        ],
      );

      blocTest<CurrentWeatherCubit, CurrentWeatherState>(
        'emits updated units and temperature '
        'when status is success (celsius)',
        build: () => currentWeatherCubit,
        seed: () => CurrentWeatherState(
          status: CurrentWeatherStatus.success,
          temperatureUnits: TemperatureUnits.fahrenheit,
          currentWeather: CurrentWeather(
            location: currentWeatherLocation,
            temperature: Temperature(value: currentWeatherTemperature),
            lastUpdated: DateTime(2020),
            condition: 'Rainy',
          ),
        ),
        act: (cubit) => cubit.toggleUnits(),
        expect: () => <CurrentWeatherState>[
          CurrentWeatherState(
            status: CurrentWeatherStatus.success,
            temperatureUnits: TemperatureUnits.celsius,
            currentWeather: CurrentWeather(
              location: currentWeatherLocation,
              temperature:
                  Temperature(value: currentWeatherTemperature.toCelsius()),
              lastUpdated: DateTime(2020),
              condition: 'Rainy',
            ),
          ),
        ],
      );

      blocTest<CurrentWeatherCubit, CurrentWeatherState>(
        'emits updated units and temperature '
        'when status is success (fahrenheit)',
        build: () => currentWeatherCubit,
        seed: () => CurrentWeatherState(
          status: CurrentWeatherStatus.success,
          temperatureUnits: TemperatureUnits.celsius,
          currentWeather: CurrentWeather(
            location: currentWeatherLocation,
            temperature: Temperature(value: currentWeatherTemperature),
            lastUpdated: DateTime(2020),
            condition: 'Rainy',
          ),
        ),
        act: (cubit) => cubit.toggleUnits(),
        expect: () => <CurrentWeatherState>[
          CurrentWeatherState(
            status: CurrentWeatherStatus.success,
            temperatureUnits: TemperatureUnits.fahrenheit,
            currentWeather: CurrentWeather(
              location: currentWeatherLocation,
              temperature:
                  Temperature(value: currentWeatherTemperature.toFahrenheit()),
              lastUpdated: DateTime(2020),
              condition: 'Rainy',
            ),
          ),
        ],
      );
    });
  });
}
