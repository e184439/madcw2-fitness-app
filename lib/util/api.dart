import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:madcw2_fitness/util/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Api {
  static Future<http.Response> sendGetRequest(String route,
      {Map<String, dynamic>? data, Map<String, dynamic>? headers}) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    var token = sharedPreferences.getString('token');

    var headers = {
      'Authorization': 'Bearer $token',
      'Content-type': 'application/json',
      'Accept': 'application/json'
    };
    if (headers != null && headers.length > 0) {
      headers.addAll(headers);
    }

    Uri uri = Uri.http(domain, route, data);
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

    Uri uri = Uri.http(domain, route);

    var response = http.post(
      uri,
      headers: headersWithToken,
      body: json.encode(data),
    );

    return response;
  }

  static Future<http.Response> sendPostRequestWithoutAuth(String route,
      {Object? data, Map<String, String>? headers}) async {
    Map<String, String>? requestHeaders = {};
    requestHeaders.addAll(headers ?? {});

    Uri uri = Uri.http(domain, route);

    var response = http.post(
      uri,
      headers: requestHeaders,
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
