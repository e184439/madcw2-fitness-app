import 'dart:math';
import 'package:intl/intl.dart';

String generateRandomString(int len) {
  var r = Random();
  const chars =
      'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';
  String randomString =
      List.generate(len, (index) => chars[r.nextInt(chars.length)]).join();
  var ts = DateFormat('dMy').format(DateTime.now());
  return (ts + randomString).toUpperCase();
}
