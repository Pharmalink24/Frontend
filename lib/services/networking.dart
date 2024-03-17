// Packages
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:io';

const String PharmaLinkUrl = "http://10.0.2.2:8000";
const String Auth = "";

class API {
  API();

  Future GET(String url, String auth) async {
    http.Response response = await http.get(
      Uri.parse(url),
      headers: {
        HttpHeaders.authorizationHeader: auth,
      },
    );

    if (response.statusCode == 200) {
      var decodedData = jsonDecode(response.body);
      print(decodedData);
      return decodedData;
    } else {
      print(response.request);
      print(response.statusCode);
    }
  }

  Future POST(String path, Map body, bool auth) async {
    Map<String, String> headers = {
      'Content-Type': 'application/json; charset=UTF-8',
    };

    auth
        ? headers.addAll({
            HttpHeaders.authorizationHeader: Auth,
          })
        : null;

    http.Response response = await http.post(
      Uri.parse('$PharmaLinkUrl/$path'),
      body: jsonEncode(body),
      headers: headers,
    );

    if (response.statusCode == 201 || response.statusCode == 200) {
      var decodedData = jsonDecode(response.body);
      return decodedData;
    } else {
      print(response.request);
      print(response.statusCode);
      print(response.reasonPhrase);
    }
  }

  Future PATCH(String url, String auth) async {}

  Future PUT(String url, String auth) async {}

  Future DELETE(String url, String auth) async {}
}
