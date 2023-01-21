import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:madcw2_fitness/util/api.dart';
import 'package:madcw2_fitness/util/constants.dart';
import 'package:madcw2_fitness/util/dialogs.dart';
import 'package:madcw2_fitness/widgets/form/form_label.dart';
import 'package:madcw2_fitness/widgets/form/rounded_corner_datepicker.dart';
import 'package:madcw2_fitness/widgets/form/rounded_corner_dropdown.dart';
import 'package:madcw2_fitness/widgets/form/rounded_corner_text_field.dart';
import 'package:madcw2_fitness/widgets/loading_screen.dart';
import 'package:madcw2_fitness/widgets/rounded_button.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AddMembersPage extends StatefulWidget {
  const AddMembersPage({super.key});

  @override
  State<AddMembersPage> createState() => _AddMembersPageState();
}

class _AddMembersPageState extends State<AddMembersPage> {
  final _formKey = GlobalKey<FormBuilderState>();

  bool isLoading = false;

  late int weight = 0;
  late int height = 0;
  late double bmi = 0.0;

  String step = 'personal';

  bool isEnrolledInGymBefore = false;
  bool isHasInjuredBefore = false;

  void calculateBMI() {
    if (height == 0 || weight == 0) {
      setState(() {
        bmi = 0.0;
      });
    }

    try {
      double cal = ((weight / height / height) * 10000).ceilToDouble();
      setState(() {
        bmi = cal;
      });
    } catch (e) {
      setState(() {
        bmi = 0.0;
      });
    }
  }

  Future<void> createMemberProfile() async {
    _formKey.currentState!.save();
    var valueMap = _formKey.currentState!.value;
    print(valueMap);
    var data = {
      "id": 0,
      'membership_type': valueMap['membership_type'],
      'firstName': valueMap['firstName'],
      'lastName': valueMap['lastName'],
      'dob': valueMap['dob'].toIso8601String(),
      'nic_no': valueMap['nic_no'],
      'gender': valueMap['gender'] == 'male' ? 1 : 2,
      'remarks': valueMap['remarks'],
      'weight': valueMap['weight'],
      'height': valueMap['height'],
      "bmi": bmi,
      "contactNo": valueMap['contactNo'],
      "email": valueMap['email'],
      "password": valueMap['password'],
      "isStaff": false,
      "isInstructor": false,
    };

    // send to the API to create profile here
    Map<String, String>? headers = {'Content-Type': 'application/json'};
    var response = await Api.sendPostRequestWithoutAuth(saveMemberRoute,
        data: jsonEncode(data), headers: headers);

    print(response.body);
    print(response.statusCode);

    if (!mounted) return;

    if (response.statusCode == 200) {
      showMessageDialog(
        context,
        'Success',
        'Member profile created successfully.',
        'OK',
        () {
          Navigator.of(context).pop();
        },
      );
    } else {
      showMessageDialog(
        context,
        'Failed',
        'Failed to create',
        'OK',
        () {
          Navigator.of(context).pop();
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return isLoading
        ? const LoadingScreen()
        : SingleChildScrollView(
            child: getPersonalInfoFragment(context),
          );
  }

  /// get personal info fragment
  Column getPersonalInfoFragment(BuildContext context) {
    return Column(
      children: [
        FormBuilder(
          key: _formKey,
          autovalidateMode: AutovalidateMode.disabled,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const FormLabel(
                  text: 'Membership Type',
                ),
                const SizedBox(
                  height: 8.0,
                ),
                RoundedCornerDropdown(
                  name: 'membership_type',
                  errorText: 'Please select a membership type',
                  items: ['Gold Package', 'Silver Package', 'Bronze Package']
                      .map((e) =>
                          DropdownMenuItem<String>(value: e, child: Text(e)))
                      .toList(),
                  initialValue: 'Gold Package',
                ),
                const SizedBox(
                  height: 8.0,
                ),
                const FormLabel(
                  text: 'First Name',
                ),
                const SizedBox(
                  height: 8.0,
                ),
                const RoundedCornerTextField(
                  errorText: 'Please enter',
                  name: 'firstName',
                  textInputType: TextInputType.text,
                  isObscure: false,
                  hintText: 'Please enter',
                ),
                const SizedBox(
                  height: 8.0,
                ),
                const FormLabel(
                  text: 'Last Name',
                ),
                const SizedBox(
                  height: 8.0,
                ),
                const RoundedCornerTextField(
                    errorText: 'Please enter',
                    name: 'lastName',
                    textInputType: TextInputType.text,
                    isObscure: false,
                    hintText: 'Please enter'),
                const SizedBox(
                  height: 8.0,
                ),
                const FormLabel(
                  text: 'Date of Birth',
                ),
                const SizedBox(
                  height: 8.0,
                ),
                const RoundedCornerDatepicker(
                  name: 'dob',
                  errorText: 'Please select date of birth',
                ),
                const SizedBox(
                  height: 8.0,
                ),
                const FormLabel(
                  text: 'N.I.C. No.',
                ),
                const SizedBox(
                  height: 8.0,
                ),
                const RoundedCornerTextField(
                  errorText: 'Please enter',
                  name: 'nic_no',
                  textInputType: TextInputType.text,
                  isObscure: false,
                  hintText: 'Please enter',
                ),
                const SizedBox(
                  height: 8.0,
                ),
                const FormLabel(
                  text: 'Gender',
                ),
                const SizedBox(
                  height: 8.0,
                ),
                RoundedCornerDropdown(
                  name: 'gender',
                  errorText: 'Please select gender',
                  items: ['male', 'female']
                      .map(
                        (e) => DropdownMenuItem<String>(
                          value: e,
                          child: Text(e),
                        ),
                      )
                      .toList(),
                  initialValue: 'male',
                ),
                const SizedBox(
                  height: 16.0,
                ),

                // add the general info page items here
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      child: const FormLabel(
                        text: 'Has enrolled in the gym before?',
                      ),
                      onTap: () {
                        setState(() {
                          isEnrolledInGymBefore = !isEnrolledInGymBefore;
                        });
                      },
                    ),
                    Switch(
                      value: isEnrolledInGymBefore,
                      onChanged: (value) {
                        setState(() {
                          isEnrolledInGymBefore = value;
                        });
                      },
                    ),
                  ],
                ),
                const SizedBox(
                  height: 16.0,
                ),
                const FormLabel(
                  text: 'How long have you been in gym?',
                ),
                const SizedBox(
                  height: 8.0,
                ),
                const RoundedCornerTextField(
                  errorText: 'Please enter',
                  name: 'enrolledGymBeforeDuration',
                  textInputType: TextInputType.numberWithOptions(
                    signed: true,
                    decimal: false,
                  ),
                  isObscure: false,
                  hintText: 'Please enter',
                ),
                const SizedBox(
                  height: 16.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      child: const FormLabel(
                        text: 'Have you been injured before?',
                      ),
                      onTap: () {
                        setState(() {
                          isHasInjuredBefore = !isHasInjuredBefore;
                        });
                      },
                    ),
                    Switch(
                      value: isHasInjuredBefore,
                      onChanged: (value) {
                        setState(() {
                          isHasInjuredBefore = value;
                        });
                      },
                    ),
                  ],
                ),
                const SizedBox(
                  height: 16.0,
                ),

                const FormLabel(
                  text: 'Remarks',
                ),
                const SizedBox(
                  height: 8.0,
                ),
                const RoundedCornerTextField(
                  errorText: 'Please enter',
                  name: 'remarks',
                  textInputType: TextInputType.text,
                  isObscure: false,
                  hintText: 'Please enter',
                ),
                const SizedBox(
                  height: 16.0,
                ),

                // weight kg start
                const FormLabel(
                  text: 'Weight (kilo Grams)',
                ),
                const SizedBox(
                  height: 8.0,
                ),
                RoundedCornerTextField(
                  errorText: 'Please enter',
                  name: 'weight',
                  textInputType: const TextInputType.numberWithOptions(
                    signed: true,
                    decimal: false,
                  ),
                  isObscure: false,
                  hintText: 'Please enter',
                  value: '$weight',
                  onChanged: (value) {
                    setState(() {
                      weight = value.isEmpty ? 0 : int.parse(value);
                    });
                    calculateBMI();
                  },
                ),
                // weight kg end

                const SizedBox(
                  height: 16.0,
                ),

                // height kg start
                const FormLabel(
                  text: 'Height (Centimeters)',
                ),
                const SizedBox(
                  height: 8.0,
                ),
                RoundedCornerTextField(
                  errorText: 'Please enter',
                  name: 'height',
                  textInputType: const TextInputType.numberWithOptions(
                    signed: true,
                    decimal: false,
                  ),
                  isObscure: false,
                  hintText: 'Please enter',
                  value: '$height',
                  onChanged: (value) {
                    setState(() {
                      height = value.isEmpty ? 0 : int.parse(value);
                    });
                    calculateBMI();
                  },
                ),
                // height kg end

                const SizedBox(
                  height: 16.0,
                ),

                const FormLabel(
                  text: 'BMI',
                ),
                const SizedBox(
                  height: 8.0,
                ),
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(width: 1, color: Colors.grey),
                    borderRadius: BorderRadius.circular(16.0),
                    color: Colors.grey.shade300,
                  ),
                  width: const Size.fromHeight(40.0).width,
                  padding: const EdgeInsets.symmetric(
                    vertical: 12.0,
                    horizontal: 16.0,
                  ),
                  child: Text(
                    bmi.toStringAsFixed(1),
                    style: const TextStyle(fontSize: 16.0),
                  ),
                ),
                const SizedBox(
                  height: 16.0,
                ),

                const FormLabel(
                  text: 'Phone Number',
                ),
                const SizedBox(
                  height: 8.0,
                ),
                const RoundedCornerTextField(
                  errorText: 'Please enter your name',
                  name: 'contactNo',
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
                  errorText: 'Enter new password',
                  name: 'password',
                  textInputType: TextInputType.visiblePassword,
                  isObscure: true,
                  hintText: 'Please enter',
                ),
                const SizedBox(
                  height: 8.0,
                ),
                const FormLabel(
                  text: 'Email Address',
                ),
                const SizedBox(
                  height: 8.0,
                ),
                const RoundedCornerTextField(
                  errorText: 'Please enter',
                  name: 'email',
                  textInputType: TextInputType.emailAddress,
                  isObscure: false,
                  hintText: 'Please enter',
                ),
                const SizedBox(
                  height: 16.0,
                ),
                const SizedBox(
                  height: 16.0,
                ),
                SizedBox(
                  width: const Size.fromHeight(40.0).width,
                  // height: 48.0,
                  child: RoundedButton(
                    buttonText: 'Create Member Profile',
                    onPressed: () async {
                      setState(() {
                        isLoading = true;
                      });

                      await createMemberProfile();

                      setState(() {
                        isLoading = false;
                      });
                    },
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
    );
  }
}
