import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:sharqia_household_survey/Helper/api_routing.dart';

class APIHelper {

  static getData({
    required String url,
    dynamic body,
    bool isGuest = false,
  }) async {
    var response = await http.get(Uri.parse("${APIRouting.baseURL}$url"), headers: body);
    return response;
  }

  static postData({
    required String url,
    dynamic header = const <String, String>{},
    dynamic body,
  }) async {
    Map<String, String> _header = Map.of(header);
    _header['Content-Type'] = "application/json";
    var response = await http.post(
      Uri.parse("${APIRouting.baseURL}$url"),
      body: body,
      headers: _header,
    );
    return response;
  }

  static putData({
    required String url,
    required Map<String, dynamic> body,
    required String token,
  }) async {
    var response = await http.put(
      Uri.parse("${APIRouting.baseURL}$url"),
      body: body,
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'bearer $token',
      },
    );
    if (response.statusCode == 200 || response.statusCode == 201) {
      var data = json.decode(response.body);
      return data;
    } else {
      // MyToast.showToast(response.body.split(" ").first, Colors.red);
    }
  }
}
