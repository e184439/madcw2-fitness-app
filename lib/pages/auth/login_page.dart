import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:madcw2_fitness/pages/auth/login_as_page.dart';
import 'package:madcw2_fitness/services/auth.dart';
import 'package:madcw2_fitness/util/app_theme.dart';
import 'package:madcw2_fitness/util/dialogs.dart';
import 'package:madcw2_fitness/widgets/form/form_label.dart';
import 'package:madcw2_fitness/widgets/loading_screen.dart';
import 'package:madcw2_fitness/widgets/form/rounded_corner_text_field.dart';

import '../../widgets/rounded_button.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => LoginPageState();
}

class LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormBuilderState>();

  bool isLoading = false;

  String userRole = 'receptionist';

  /// Handle login form submission
  void _handleFormSubmission() async {
    _formKey.currentState!.save();
    if (_formKey.currentState!.validate()) {
      var data = _formKey.currentState!.value;

      setState(() {
        isLoading = true;
      });

      // send to login
      var isSignedIn = await signIn(data['username'], data['password']);
      setState(() {
        isLoading = false;
      });

      // load user information
      await loadUserInformation();

      if (!mounted) return;

      if (!isSignedIn) {
        showMessageDialog(
            context,
            "Login Failed",
            "Cannot log in with the provided credentials. Please check your username and password, and try again.",
            "Ok", () {
          Navigator.pop(context);
        });
        return;
      }

      // redirect to home page

      if (userRole == 'member') {
        Navigator.pushNamedAndRemoveUntil(
            context, '/home', ModalRoute.withName('/home'));
      } else {
        Navigator.push(context, MaterialPageRoute(
          builder: (context) {
            return const LoginAsPage();
          },
        ));
      }
    }
  }

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
                      FormBuilder(
                        key: _formKey,
                        autovalidateMode: AutovalidateMode.disabled,
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const FormLabel(
                                text: 'Phone Number',
                              ),
                              const SizedBox(
                                height: 8.0,
                              ),
                              const RoundedCornerTextField(
                                errorText: 'Please enter your name',
                                name: 'username',
                                textInputType: TextInputType.phone,
                                isObscure: false,
                                hintText: 'Please enter',
                              ),
                              const SizedBox(
                                height: 16.0,
                              ),
                              const FormLabel(
                                text: 'Password',
                              ),
                              const SizedBox(
                                height: 8.0,
                              ),
                              const RoundedCornerTextField(
                                errorText: 'Please enter your password',
                                name: 'password',
                                textInputType: TextInputType.visiblePassword,
                                isObscure: true,
                                hintText: 'Please enter',
                              ),
                              const SizedBox(
                                height: 8.0,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                // height: 48.0,
                                children: [
                                  InkWell(
                                    onTap: () {},
                                    child: const Text(
                                      'Forgot Password',
                                      textAlign: TextAlign.end,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 93.0,
                              ),
                              SizedBox(
                                width: const Size.fromHeight(40.0).width,
                                // height: 48.0,
                                child: RoundedButton(
                                  buttonText: 'Log in',
                                  onPressed: _handleFormSubmission,
                                  isDisabled: false,
                                ),
                              ),
                              const SizedBox(
                                height: 16.0,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
    );
  }
}
