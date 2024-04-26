// Packages
// ignore_for_file: non_constant_identifier_names

import 'package:http/http.dart' as http;
import 'package:logger/logger.dart';
import 'package:pharmalink/core/di/dependency_injection.dart';
import 'package:pharmalink/core/shared_preferences/auth_prefs.dart';
import 'dart:convert';
import 'dart:io';
import 'api_constants.dart';

class API {
  API();
  Map<String, String> headers = {
    'Content-Type': 'application/json; charset=UTF-8',
  };

  Future GET(String path, int code, {bool auth=false}) async {
    auth
        ? headers.addAll({
            HttpHeaders.authorizationHeader:
               'PatientCustomToken eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoiYWNjZXNzIiwiZXhwIjoxNzE0MTY5NTY4LCJpYXQiOjE3MTQxNjIzNjgsImp0aSI6ImRhMThhOGI5MWE2OTRlMDRhYmNmM2Q2ZGRlNGZlYmI2IiwidXNlcl9pZCI6MTZ9.hQ_tkBeHk9-MWTwQa50K1nc96vxa9oSYuMuUsfotVyU'          })
        : null;

    http.Response response = await http.get(
      Uri.parse('${ApiConstants.baseUrl}$path'),
      headers: headers,
    );

    if (response.statusCode == code) {
      var decodedData = jsonDecode(response.body);
      getIt<Logger>().i(decodedData);
      return decodedData;
    } else {
      getIt<Logger>().e(response.request);
      getIt<Logger>().e(response.statusCode);
    }
  }

  Future POST(String path, Map body, int code,
      {bool auth=false}) async {
    auth
        ? headers.addAll({
            HttpHeaders.authorizationHeader: AuthSharedPrefs.getAccessToken() ?? '',
          })
        : AuthSharedPrefs.getAccessToken();

    http.Response response = await http.post(
      Uri.parse('${ApiConstants.baseUrl}$path'),
      body: jsonEncode(body),
      headers: headers,
    );

    if (response.statusCode == code) {
      var decodedData = jsonDecode(response.body);
      return decodedData;
    } else {
      getIt<Logger>().e(response.body);
      getIt<Logger>().e(response.request);
      getIt<Logger>().e(response.statusCode);
      getIt<Logger>().e(response.reasonPhrase);
    }
  }

  Future PATCH(String path, Map body, int code, {bool auth=false}) async {
    auth
        ? headers.addAll({
            HttpHeaders.authorizationHeader: AuthSharedPrefs.getAccessToken() ?? '',
          })
        : AuthSharedPrefs.getAccessToken();

    http.Response response = await http.patch(
      Uri.parse('${ApiConstants.baseUrl}$path'),
      body: jsonEncode(body),
      headers: headers,
    );

    if (response.statusCode == code) {
      var decodedData = jsonDecode(response.body);
      getIt<Logger>().i(decodedData);
      return decodedData;
    } else {
      getIt<Logger>().e(response.request);
      getIt<Logger>().e(response.statusCode);
    }
  }

  Future PUT(String path, Map body, int code, {bool auth=false}) async {
    auth
        ? headers.addAll({
            HttpHeaders.authorizationHeader: AuthSharedPrefs.getAccessToken() ?? '',
          })
        : AuthSharedPrefs.getAccessToken();

    http.Response response = await http.put(
      Uri.parse('${ApiConstants.baseUrl}$path'),
      body: jsonEncode(body),
      headers: headers,
    );

    if (response.statusCode == code) {
      var decodedData = jsonDecode(response.body);
      getIt<Logger>().i(decodedData);
      return decodedData;
    } else {
      getIt<Logger>().e(response.request);
      getIt<Logger>().e(response.statusCode);
    }
  }

  Future DELETE(String path, Map body, int code, {bool auth=false}) async {
    auth
        ? headers.addAll({
            HttpHeaders.authorizationHeader: AuthSharedPrefs.getAccessToken() ?? '',
          })
        : AuthSharedPrefs.getAccessToken();

    http.Response response = await http.delete(
      Uri.parse('${ApiConstants.baseUrl}$path'),
      body: jsonEncode(body),
      headers: headers,
    );

    if (response.statusCode == code) {
      var decodedData = jsonDecode(response.body);
      return decodedData;
    } else {
      getIt<Logger>().e(response.request);
      getIt<Logger>().e(response.statusCode);
    }
  }
}
