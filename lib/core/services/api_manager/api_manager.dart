import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:islamii/core/models/RadioResponse.dart';

class ApiManager {
  static Future<RadioResponse> getRadio() async {
    http.Response response =
        await http.get(Uri.parse('https://mp3quran.net/api/v3/radios'));
    var json = jsonDecode(response.body);
    return RadioResponse.fromJson(json);
  }
}
