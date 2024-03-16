// Packages
import 'package:http/http.dart' as http;
import 'dart:convert';

class API {
  final String url;
  API(this.url);

  Future GET() async {
    http.Response response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      var decodedData = jsonDecode(response.body);
      return decodedData;
    } else {
      print(response.request);
      print(response.statusCode);
    }
  }

  Future POST() async {}

  Future PATCH() async {}

  Future PUT() async {}

  Future DELETE() async {}
}
