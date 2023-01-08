import 'package:http/http.dart' as http;
import 'package:madcw2_fitness/util/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Api {
  static Future<http.Response> sendGetRequest(String route,
      {Map<String, dynamic>? data}) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    var token = sharedPreferences.getString('token');

    var headers = {
      'Authorization': 'Bearer $token',
      'Content-type': 'application/json',
      'Accept': 'application/json'
    };
    Uri uri = Uri.https(domain, route, data);
    return http.get(uri, headers: headers);
  }

  static Future<http.Response> sendPostRequest(String route,
      {Object? data, Map<String, String>? headers}) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    var token = sharedPreferences.getString('token');

    var headersWithToken = {
      'Authorization': 'Bearer $token',
      'Accept': 'application/json',
    };
    headersWithToken.addAll(headers ?? {});

    Uri uri = Uri.https(domain, route);

    var response = http.post(
      uri,
      headers: headersWithToken,
      body: data,
    );
    return response;
  }

  static Future<http.Response> sendGetRequestWithUrl(String url,
      {Map<String, dynamic>? data}) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    var token = sharedPreferences.getString('token');

    var headers = {
      'Authorization': 'Bearer $token',
      'Content-type': 'application/json',
      'Accept': 'application/json'
    };
    Uri uri = Uri.http(url, '', data);
    return http.get(uri, headers: headers);
  }
}
