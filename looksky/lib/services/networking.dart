import 'package:http/http.dart' as http;
import 'dart:convert';

//api id from OpenWeatherMap
const apikey = 'aacd6a6cfc11b6c319910e5e2aa14ed6';

class Networkhelper {
  Networkhelper(this.url);
  final String url;

  Future getData() async {
    http.Response response = await http.get(url);
    if (response.statusCode == 200) {
      String data = response.body;
      return jsonDecode(data);
    }
  }
}
