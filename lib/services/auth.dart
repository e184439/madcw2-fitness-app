import 'dart:convert';

import 'package:madcw2_fitness/util/api.dart';
import 'package:madcw2_fitness/util/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<bool> signIn(username, password) async {
  var response = await Api.sendPostRequest(
    loginRoute,
    data: {
      'telephone': username,
      'password': password,
      'device_name': 'mobile-app',
    },
  );
  if (response.statusCode != 200) {
    return false;
  }

  // decode token
  var data = json.decode(response.body) as Map<String, dynamic>;
  var token = data['token'];

  // save token in shared preferences as 'token'
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setString('token', token);

  // load user information into the SharedPreferences
  await loadUserInformation();

  return true;
}

Future<Map<String, dynamic>?> getCurrentUser() async {
  var response = await Api.sendGetRequest(currentUserRoute);
  if (response.statusCode != 200) {
    return null;
  }

  Map<String, dynamic> body =
      json.decode(response.body) as Map<String, dynamic>;

  return body;
}

Future<Map<String, dynamic>?> loadUserInformation() async {
  Map<String, dynamic>? currentUser = await getCurrentUser();
  if (currentUser!.isEmpty) {
    return {};
  }

  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setString('user.id', currentUser['id']);
  prefs.setString('user.name', currentUser['name'] ?? '');
  prefs.setString('user.email', currentUser['email'] ?? '');
  prefs.setString('user.telephone', currentUser['telephone'] ?? '');
  prefs.setString('user.status', currentUser['status']);

  return currentUser;
}
