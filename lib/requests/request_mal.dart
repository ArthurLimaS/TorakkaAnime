import 'dart:convert';

import 'package:http/http.dart' as http;

import 'package:torakka_anime/utils/constants.dart';

class MalRequest {
  //final String query;
  final String url = malUrl;
  final Map<String, String> header = malKey;

  //constructor
  //MalRequest(this.query);

  Future getAnimeRequest(String query) async {
    Uri fullUrl = Uri.parse(url + query);
    http.Response response = await http.get(fullUrl, headers: header);

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      return print(response.statusCode);
    }
  }
}
