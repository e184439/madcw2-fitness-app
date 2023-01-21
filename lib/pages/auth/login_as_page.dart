import 'package:flutter/material.dart';
import 'package:madcw2_fitness/pages/instructor/instructor_dashboard_page.dart';
import 'package:madcw2_fitness/pages/member/member_dashboard_page.dart';
import 'package:madcw2_fitness/pages/staff/staff_dashboard_page.dart';
import 'package:madcw2_fitness/widgets/loading_screen.dart';
import 'package:madcw2_fitness/widgets/rounded_button.dart';
import 'package:madcw2_fitness/widgets/rounded_outlined_button.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginAsPage extends StatefulWidget {
  const LoginAsPage({Key? key}) : super(key: key);

  @override
  State<LoginAsPage> createState() => LoginAsPageState();
}

class LoginAsPageState extends State<LoginAsPage> {
  String userType = '';

  void setUserType() async {
    // get isStaff and isInstructor from the SharedPreferences
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var isStaff = prefs.get('isStaff');
    var isInstructor = prefs.get('isInstructor');
    // check if instructor
    if (isInstructor.toString() == 'true') {
      setState(() {
        userType = 'Instructor';
      });
    } else if (isStaff.toString() == 'true') {
      setState(() {
        userType = 'Staff';
      });
    }

    prefs.setString('loggedInType', userType);
  }

  @override
  void initState() {
    super.initState();
    setUserType();
  }

  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: isLoading
          ? const LoadingScreen()
          : SafeArea(
              minimum: const EdgeInsets.all(16.0),
              child: SingleChildScrollView(
                padding: const EdgeInsets.only(top: 54.0, bottom: 16.0),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        'assets/images/logo-lg.png',
                        height: 208.0,
                        width: 208.0,
                        fit: BoxFit.contain,
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width,
                        child: const Text(
                          'Would you like to sign in as',
                          style: TextStyle(
                            fontSize: 16.0,
                          ),
                          textAlign: TextAlign.start,
                        ),
                      ),
                      const SizedBox(
                        height: 20.0,
                      ),
                      RoundedButton(
                        buttonText: userType,
                        onPressed: () async {
                          SharedPreferences prefs =
                              await SharedPreferences.getInstance();
                          // set logged in type to whatever user has chosen
                          prefs.setString('loggedInType', userType);

                          if (!mounted) return;

                          Navigator.of(context).pushAndRemoveUntil(
                              MaterialPageRoute(
                            builder: (context) {
                              return userType == 'Staff'
                                  ? const StaffDashboardPage()
                                  : const InstructorDashboardPage();
                            },
                          ), (route) => false);
                        },
                        isDisabled: false,
                      ),
                      const SizedBox(
                        height: 20.0,
                      ),
                      const Text(
                        'Or',
                        style: TextStyle(
                          fontSize: 16.0,
                        ),
                      ),
                      const SizedBox(
                        height: 20.0,
                      ),
                      RoundedOutlinedButton(
                        buttonText: 'Member',
                        onPressed: () async {
                          SharedPreferences prefs =
                              await SharedPreferences.getInstance();
                          // set logged in type to Member
                          prefs.setString('loggedInType', 'Member');

                          if (!mounted) return;

                          Navigator.of(context).pushAndRemoveUntil(
                              MaterialPageRoute(
                            builder: (context) {
                              return const MemberDashboardPage();
                            },
                          ), (route) => false);
                        },
                        isDisabled: false,
                      ),
                    ],
                  ),
                ),
              ),
            ),
    );
  }
}
