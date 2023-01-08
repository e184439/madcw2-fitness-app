import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:madcw2_fitness/services/auth.dart';
import 'package:madcw2_fitness/util/dialogs.dart';
import 'package:madcw2_fitness/widgets/loading_screen.dart';

import '../../widgets/rounded_button.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => LoginPageState();
}

class LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormBuilderState>();

  bool isLoading = false;

  /// Handle login form submission
  void _handleFormSubmission() async {
    _formKey.currentState!.save();
    if (_formKey.currentState!.validate()) {
      var data = _formKey.currentState!.value;

      setState(() {
        isLoading = true;
      });

      // send to login
      // var isSignedIn = await signIn(data['username'], data['password']);
      setState(() {
        isLoading = false;
      });

      // load user information
      // await loadUserInformation();

      // if (!mounted) return;
      //
      // if (!isSignedIn) {
      //   showMessageDialog(
      //       context,
      //       "Login Failed",
      //       "Cannot log in with the provided credentials. Please check your username and password, and try again.",
      //       "Ok", () {
      //     Navigator.pop(context);
      //   });
      //   return;
      // }

      // redirect to home page
      Navigator.pushNamedAndRemoveUntil(
          context, '/home', ModalRoute.withName('/home'));
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
                padding: const EdgeInsets.only(top: 128.0, bottom: 16.0),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Fitness App',
                        style: TextStyle(fontSize: 24.0),
                      ),
                      FormBuilder(
                        key: _formKey,
                        autovalidateMode: AutovalidateMode.disabled,
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            children: [
                              FormBuilderTextField(
                                name: 'username',
                                decoration: const InputDecoration(
                                  labelText: 'Mobile Number',
                                  labelStyle: TextStyle(
                                    fontSize: 16.0,
                                  ),
                                ),
                                validator: FormBuilderValidators.compose([
                                  FormBuilderValidators.required(
                                      errorText: 'Please enter your mobile number'),
                                ]),
                                keyboardType: TextInputType.phone,
                              ),
                              const SizedBox(
                                height: 16.0,
                              ),
                              FormBuilderTextField(
                                  name: 'password',
                                  obscureText: true,
                                  decoration: const InputDecoration(
                                    labelText: 'Your Password',
                                    labelStyle: TextStyle(
                                      fontSize: 16.0,
                                    ),
                                  ),
                                  keyboardType: TextInputType.visiblePassword,
                                  validator: FormBuilderValidators.compose([
                                    FormBuilderValidators.required(
                                        errorText:
                                            'Please enter your password'),
                                  ])),
                              const SizedBox(
                                height: 16.0,
                              ),
                              SizedBox(
                                width: const Size.fromHeight(200.0).width,
                                // height: 48.0,
                                child: RoundedButton(
                                  buttonText: 'Log in',
                                  onPressed: _handleFormSubmission, isDisabled: false,
                                  icon: const Icon(Icons.login, color: Colors.white,),
                                ),
                              ),
                              const SizedBox(
                                height: 16.0,
                              ),
                              const Text(
                                '(c) 2023 - Fitness App',
                                textAlign: TextAlign.center,
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
