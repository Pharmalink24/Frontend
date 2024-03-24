// Packages
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:io';

const String kPharmaLinkUrl = "http://10.0.2.2:8000";

class API {
  API({this.auth=false});

  final bool auth;
  Map<String, String> headers = {
    'Content-Type': 'application/json; charset=UTF-8',
  };

  Future GET(String path, int code, {String token = ""}) async {
    auth
        ? headers.addAll({
            HttpHeaders.authorizationHeader: token,
          })
        : null;

    http.Response response = await http.get(
      Uri.parse('$kPharmaLinkUrl/$path'),
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

  Future POST(String path, Map body, int code,
      {bool auth = false, String token = ""}) async {
    auth
        ? headers.addAll({
            HttpHeaders.authorizationHeader: token,
          })
        : null;

    http.Response response = await http.post(
      Uri.parse('$kPharmaLinkUrl/$path'),
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

  Future PATCH(String path, Map body, int code, {String token = ""}) async {
    auth
        ? headers.addAll({
            HttpHeaders.authorizationHeader: token,
          })
        : null;

    http.Response response = await http.patch(
      Uri.parse('$kPharmaLinkUrl/$path'),
      body: jsonEncode(body),
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

  Future PUT(String path, Map body, int code, {String token = ""}) async {
    auth
        ? headers.addAll({
            HttpHeaders.authorizationHeader: token,
          })
        : null;

    http.Response response = await http.put(
      Uri.parse('$kPharmaLinkUrl/$path'),
      body: jsonEncode(body),
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

  Future DELETE(String path, Map body, int code, {String token = ""}) async {
    auth
        ? headers.addAll({
            HttpHeaders.authorizationHeader: token,
          })
        : null;

    http.Response response = await http.delete(
      Uri.parse('$kPharmaLinkUrl/$path'),
      body: jsonEncode(body),
      headers: headers,
    );

    if (response.statusCode == code) {
      var decodedData = jsonDecode(response.body);
      return decodedData;
    } else {
      print(response.request);
      print(response.statusCode);
    }
  }
}
