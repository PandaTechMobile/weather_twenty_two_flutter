/// Exception thrown when locationSearch fails.
class LocationRequestFailure implements Exception {}

/// Exception thrown when the provided location is not found.
class LocationNotFoundFailure implements Exception {}

/// Exception thrown when getWeather fails.
class CurrentWeatherRequestFailure implements Exception {}

/// Exception thrown when weather for provided location is not found.
class CurrentWeatherNotFoundFailure implements Exception {}

class DailyWeatherForecastsNotFoundFailure implements Exception {}

class DailyWeatherForecastsRequestFailure implements Exception {}
