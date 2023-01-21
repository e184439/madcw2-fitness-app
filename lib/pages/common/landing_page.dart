import 'package:flutter/material.dart';
import 'package:madcw2_fitness/pages/instructor/instructor_dashboard_page.dart';
import 'package:madcw2_fitness/pages/member/member_dashboard_page.dart';
import 'package:madcw2_fitness/pages/staff/staff_dashboard_page.dart';
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
      redirectToPageByLoggedInType(context);
    }
  }

  void redirectToPageByLoggedInType(context) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    if (!prefs.containsKey('loggedInType')) {
      var isStaff = prefs.get('isStaff');
      var isInstructor = prefs.get('isInstructor');

      String userType = 'Member';

      // check if instructor
      if (isInstructor.toString() == 'true') {
        userType = 'Instructor';
      } else if (isStaff.toString() == 'true') {
        userType = 'Staff';
      }

      prefs.setString('loggedInType', userType);
    }

    var userType = prefs.get('loggedInType');

    late Widget page;

    if (userType == 'Staff') {
      page = const StaffDashboardPage(
        key: Key('staff-dashboard-page'),
      );
    } else if (userType == 'Instructor') {
      page = const InstructorDashboardPage(
        key: Key('instructor-dashboard-page'),
      );
    } else {
      page = const MemberDashboardPage(
        key: Key('member-dashboard-page'),
      );
    }

    // redirect to page
    Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(
      builder: (context) {
        return page;
      },
    ), (route) => false);
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
