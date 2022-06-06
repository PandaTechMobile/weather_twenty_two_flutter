import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;

import '../../models/exceptions/custom_api_exceptions.dart';

class ApiServiceBase {
  //static const String _baseApi = 'api.openweathermap.org';
  final http.Client _httpClient;

  ApiServiceBase({http.Client? httpClient})
      : _httpClient = httpClient ?? http.Client();

  Future<T> get<T, K>(String baseApiAuthority, String apiEndpoint,
      Map<String, dynamic> parameters) async {
    dynamic responseJson;

    final headers = _createHeaders();

    try {
      Uri uri = Uri.https(baseApiAuthority, apiEndpoint, parameters);
      final response = await _httpClient.get(uri, headers: headers);

      responseJson = _handleResponse(response);
    } on SocketException {
      // TODO - Handle
      throw RequestFailureException();
    }

    return responseJson;
    //return JsonHelper.fromJson<T, K>(responseJson);
  }

  Future<T> post<T, K>(
      String baseApiAuthority, String apiEndpoint, dynamic object) async {
    dynamic responseJson;

    final headers = _createHeaders();

    try {
      Uri uri = Uri.https(baseApiAuthority, apiEndpoint);
      final body = json.encode(object);
      final response = await _httpClient.post(
        uri,
        headers: headers,
        body: body,
      );

      responseJson = _handleResponse(response);
    } on SocketException {
      // TODO - Handle
      throw RequestFailureException();
    }

    return responseJson;
    //return JsonHelper.fromJson<T, K>(responseJson);
  }

  Map<String, String>? _createHeaders() {
    return <String, String>{
      'Content-Type': 'application/json',
      'Charset': 'utf-8',
    };
  }
}

dynamic _handleResponse(http.Response response) {
  switch (response.statusCode) {
    case 200:
      final dynamic responseJson = json.decode(response.body);
      return responseJson;
    case 400:
      throw RequestFailureException();
    // Custom Exception
    case 401:
      throw RequestFailureException();
    // Custom Exception
    case 403:
      throw RequestFailureException();
    // Custom Exception
    case 500:
      throw RequestFailureException();
    // Custom Exception
    default:
      throw Exception(
        // ignore: lines_longer_than_80_chars
        'An error occured while communicating with the server with StatusCode : ${response.statusCode}',
      );
  }
}
