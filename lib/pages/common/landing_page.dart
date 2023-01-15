import 'package:flutter/material.dart';
import 'package:madcw2_fitness/widgets/loading_screen.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  void _routeIfLoggedIn() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    //get token
    String? token = preferences.getString('token');

    var status = await Permission.storage.status;
    if (status.isDenied) {
      var request = await Permission.storage.request();
      if (request.isDenied) {}
    }

    if (!mounted) {
      return;
    }

    if (token == null) {
      // route to login
      Navigator.of(context)
          .pushNamedAndRemoveUntil('/login', ModalRoute.withName('/login'));
    } else {
      Navigator.of(context)
          .pushNamedAndRemoveUntil('/home', ModalRoute.withName('/home'));
    }
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: LoadingScreen(),
    );
  }

  @override
  void initState() {
    super.initState();
    _routeIfLoggedIn();
  }
}
