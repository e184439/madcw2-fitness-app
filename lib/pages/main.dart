//import 'package:activefitness/login.dart';
//import 'package:activefitness/screens/welcome_screen.dart';
//import 'package:activefitness/screens/home.dart';
import 'package:activefitness/screens/myprofile.dart';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

 // get WelcomeScreen => null;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme:ThemeData(
        scaffoldBackgroundColor: Colors.white,
      ),
      home: const myprofile(),
    );
  }
}





