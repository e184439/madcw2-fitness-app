import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart';
import 'package:madcw2_fitness/util/api.dart';
import 'package:madcw2_fitness/util/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<Map<String, dynamic>> signIn(telephone, password) async {
  late Response response;
  try {
    response = await Api.sendPostRequestWithoutAuth(
      loginRoute,
      data: json.encode({'userName': telephone, 'password': password}),
      headers: {'Content-Type': 'application/json'},
    );
    if (response.statusCode != 200) {
      return {};
    }
  } on Exception catch (e) {
    log('found error in login: $e');
    return {};
  }

  // decode token
  var data = json.decode(response.body) as Map<String, dynamic>;
  var token = data['token'];

  // save token in shared preferences as 'token'
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setString('token', token);
  prefs.setString('id', '${data['id']}');
  prefs.setString("firstName", '${data['firstName']}');
  prefs.setString("lastName", '${data['lastName']}');
  prefs.setString("memberNo", '${data['memberNo']}');
  prefs.setString("contactNo", '${data['contactNo']}');
  prefs.setString("nic", '${data['nic']}');
  prefs.setString("gender", '${data['gender']}');
  prefs.setString("email", '${data['email']}');
  prefs.setString("dob", '${data['dob']}');
  prefs.setString("registerDate", '${data['registerDate']}');
  prefs.setString("weight", '${data['weight']}');
  prefs.setString("bmi", '${data['bmi']}');
  prefs.setString("isStaff", '${data['isStaff']}');
  prefs.setString("isInstructor", '${data['isInstructor']}');

  return data;
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
