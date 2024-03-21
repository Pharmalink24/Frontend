// Packages
import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:pharmalink/utilities/constants/strings.dart';

const String Auth = "";

class Api {
  Api();

  Future get(String path, bool auth, int code) async {
    Map<String, String> headers = {
      'Content-Type': 'application/json; charset=UTF-8',
    };

    auth
        ? headers.addAll({
            HttpHeaders.authorizationHeader: Auth,
          })
        : null;

    http.Response response = await http.get(
      Uri.parse('$baseUrl/$path'),
      headers: headers,
    );

    if (response.statusCode == code) {
      var decodedData = jsonDecode(response.body);
      print(decodedData);
      return decodedData;
    } else {
      print(response.request);
      print(response.statusCode);
    }
  }

  Future post(String path, Map body, bool auth, int code) async {
    Map<String, String> headers = {
      'Content-Type': 'application/json; charset=UTF-8',
    };

    auth
        ? headers.addAll({
            HttpHeaders.authorizationHeader: Auth,
          })
        : null;

    http.Response response = await http.post(
      Uri.parse('$baseUrl/$path'),
      body: jsonEncode(body),
      headers: headers,
    );

    if (response.statusCode == code) {
      var decodedData = jsonDecode(response.body);
      return decodedData;
    } else {
      print(response.body);
      print(response.request);
      print(response.statusCode);
      print(response.reasonPhrase);
    }
  }

  Future patch(String url, String auth) async {}

  Future put(String url, String auth) async {}

  Future delete(String url, String auth) async {}
}
