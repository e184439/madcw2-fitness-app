import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:madcw2_fitness/pages/member/member_dashboard_page.dart';
import 'package:madcw2_fitness/pages/staff/staff_dashboard_page.dart';
import 'package:madcw2_fitness/widgets/loading_screen.dart';
import 'package:madcw2_fitness/widgets/rounded_button.dart';
import 'package:madcw2_fitness/widgets/rounded_outlined_button.dart';

class LoginAsPage extends StatefulWidget {
  const LoginAsPage({Key? key}) : super(key: key);

  @override
  State<LoginAsPage> createState() => LoginAsPageState();
}

class LoginAsPageState extends State<LoginAsPage> {
  final _formKey = GlobalKey<FormBuilderState>();

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
                        buttonText: 'Staff',
                        onPressed: () {
                          Navigator.of(context).pushAndRemoveUntil(
                              MaterialPageRoute(
                            builder: (context) {
                              return const StaffDashboardPage();
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
                        onPressed: () {
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
