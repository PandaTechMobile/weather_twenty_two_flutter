import 'package:equatable/equatable.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:json_annotation/json_annotation.dart';

import '../models/models.dart';
import '../../../global/helpers/double_extensions.dart';

part 'current_weather_cubit.g.dart';
part 'current_weather_state.dart';

extension TemperatureExtension on double {}

class CurrentWeatherCubit extends HydratedCubit<CurrentWeatherState> {
  //CurrentWeatherCubit(this._weatherRepository) : super(CurrentWeatherState());
  CurrentWeatherCubit() : super(CurrentWeatherState());

  //final WeatherRepository _weatherRepository;

  // Future<void> fetchCurrentWeather(String? city) async {
  //   if (city == null || city.isEmpty) return;

  // Future<void> fetchCurrentWeather() async {
  //   emit(state.copyWith(status: CurrentWeatherStatus.loading));

  Future<void> fetchCurrentWeather(double? latitude, double? longitude) async {
    if (latitude == null || longitude == null) return;

    emit(state.copyWith(status: CurrentWeatherStatus.loading));

    try {
      // final weather = Weather.fromRepository(
      //   await _weatherRepository.getWeather(city),
      // );
      final currentWeather = CurrentWeather(
        condition: 'Fine',
        lastUpdated: DateTime.now(),
        temperature: const Temperature(value: 9.8),
        location: 'Newcastle',
      );
      final units = state.temperatureUnits;
      final value = units.isFahrenheit
          ? currentWeather.temperature.value.toFahrenheit()
          : currentWeather.temperature.value;

      emit(
        state.copyWith(
          status: CurrentWeatherStatus.success,
          temperatureUnits: units,
          currentWeather:
              currentWeather.copyWith(temperature: Temperature(value: value)),
        ),
      );
    } on Exception {
      emit(state.copyWith(status: CurrentWeatherStatus.failure));
    }
  }

  Future<void> refreshCurrentWeather() async {
    if (!state.status.isSuccess) return;
    if (state.currentWeather == CurrentWeather.empty) return;
    try {
      // final weather = Weather.fromRepository(
      //   await _weatherRepository.getWeather(state.weather.location),
      // );
      final currentWeather = CurrentWeather(
        condition: 'Fine',
        lastUpdated: DateTime.now(),
        temperature: const Temperature(value: 9.8),
        location: 'Newcastle',
      );
      final units = state.temperatureUnits;
      final value = units.isFahrenheit
          ? currentWeather.temperature.value.toFahrenheit()
          : currentWeather.temperature.value;

      emit(
        state.copyWith(
          status: CurrentWeatherStatus.success,
          temperatureUnits: units,
          currentWeather:
              currentWeather.copyWith(temperature: Temperature(value: value)),
        ),
      );
    } on Exception {
      emit(state);
    }
  }

  void toggleUnits() {
    final units = state.temperatureUnits.isFahrenheit
        ? TemperatureUnits.celsius
        : TemperatureUnits.fahrenheit;

    if (!state.status.isSuccess) {
      emit(state.copyWith(temperatureUnits: units));
      return;
    }

    final currentWeather = state.currentWeather;
    if (currentWeather != CurrentWeather.empty) {
      final temperature = currentWeather.temperature;
      final value = units.isCelsius
          ? temperature.value.toCelsius()
          : temperature.value.toFahrenheit();
      emit(
        state.copyWith(
          temperatureUnits: units,
          currentWeather:
              currentWeather.copyWith(temperature: Temperature(value: value)),
        ),
      );
    }
  }

  @override
  CurrentWeatherState fromJson(Map<String, dynamic> json) =>
      CurrentWeatherState.fromJson(json);

  @override
  Map<String, dynamic> toJson(CurrentWeatherState state) => state.toJson();
}
