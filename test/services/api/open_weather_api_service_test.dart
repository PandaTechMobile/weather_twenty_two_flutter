import 'package:http/http.dart' as http;
import 'package:mocktail/mocktail.dart';
import 'package:test/test.dart';
import 'package:weather_twenty_two_flutter/global/models/exceptions/weather_api_exceptions.dart';
import 'package:weather_twenty_two_flutter/global/models/weather/location_dto.dart';
import 'package:weather_twenty_two_flutter/global/services/api/open_weather_api_service.dart';

class MockHttpClient extends Mock implements http.Client {}

class MockResponse extends Mock implements http.Response {}

class FakeUri extends Fake implements Uri {}

void main() {
  group('OpenWeatherApiService', () {
    late http.Client httpClient;
    late OpenWeatherApiService openWeatherApiService;

    setUpAll(() {
      registerFallbackValue(FakeUri());
    });

    setUp(() {
      httpClient = MockHttpClient();
      openWeatherApiService = OpenWeatherApiService(httpClient: httpClient);
    });

    group('constructor', () {
      test('does not require an httpClient', () {
        expect(OpenWeatherApiService(), isNotNull);
      });
    });

    group('locationSearch', () {
      const query = 'mock-query';
      const headers = <String, String>{
        'Content-Type': 'application/json',
        'Charset': 'utf-8',
      };
      const locationName = 'Newcastle';
      const locationCountryCode = 'AU';

      test('makes correct http request', () async {
        // Arrange
        final response = MockResponse();
        when(() => response.statusCode).thenReturn(200);
        when(() => response.body).thenReturn('[]');
        when(() => httpClient.get(any(), headers: headers))
            .thenAnswer((_) async => response);
        final Map<String, dynamic> parameters = {
          'q': '$locationName,$locationCountryCode',
          'limit': '1',
          'appId': 'todo',
        };

        // Act
        try {
          await openWeatherApiService.locationSearch(
              locationName, locationCountryCode);
        } catch (_) {}

        // Assert
        verify(
          () => httpClient.get(
            Uri.https(
              'api.openweathermap.org',
              '/geo/1.0/direct',
              parameters,
            ),
            headers: headers,
          ),
        ).called(1);
      });

      test('throws LocationRequestFailure on non-200 response', () async {
        final response = MockResponse();
        when(() => response.statusCode).thenReturn(400);
        when(() => httpClient.get(any(), headers: headers))
            .thenAnswer((_) async => response);
        expect(
          () async => await openWeatherApiService.locationSearch(
              locationName, locationCountryCode),
          throwsA(isA<LocationRequestFailure>()),
        );
      });

      test('throws LocationNotFoundFailure on empty response', () async {
        final response = MockResponse();
        when(() => response.statusCode).thenReturn(200);
        when(() => response.body).thenReturn('[]');
        when(() => httpClient.get(any(), headers: headers))
            .thenAnswer((_) async => response);
        expect(
          () async => await openWeatherApiService.locationSearch(
              locationName, locationCountryCode),
          throwsA(isA<LocationNotFoundFailure>()),
        );
      });

      test('returns Location on valid response', () async {
        final response = MockResponse();
        when(() => response.statusCode).thenReturn(200);
        when(() => response.body).thenReturn(
          '''[{
            "name": "Newcastle",
            "local_names": {
              "en": "Newcastle",
              "ja": "ニューカッスル"
            },
            "lat": -32.9192953,
            "lon": 151.7795348,
            "country": "AU",
            "state": "New South Wales"
          }]''',
        );
        when(() => httpClient.get(any(), headers: headers))
            .thenAnswer((_) async => response);
        final actual = await openWeatherApiService.locationSearch(
            locationName, locationCountryCode);
        expect(
            actual,
            isA<LocationDto>()
                .having((l) => l.name, 'name', 'Newcastle')
                .having((l) => l.latitude, 'lat', -32.9192953)
                .having((l) => l.logitude, 'lon', 151.7795348));
      });
    });
  });
}
