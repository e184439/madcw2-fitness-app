import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:intl/intl.dart';
import 'package:madcw2_fitness/models/user.dart';
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

class MyProfilePage extends StatefulWidget {
  const MyProfilePage({super.key});

  @override
  State<MyProfilePage> createState() => _MyProfilePageState();
}

class _MyProfilePageState extends State<MyProfilePage> {
  final _formKey = GlobalKey<FormBuilderState>();

  late int id = 0;
  late String? firstName;
  late String? lastName;
  late String? memberNo;
  late String? contactNo;
  late String? nic;
  late String gender = 'male';
  late String? email;
  late String? dob;
  late String? registerDate;
  late int weight = 0;
  late int height = 0;
  late double bmi = 0.0;
  late bool isStaff = false;
  late bool isInstructor = false;

  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    init();
  }

  void init() async {
    setState(() {
      isLoading = true;
    });
    await loadDetails();
    setState(() {
      isLoading = false;
    });
  }

  Future<void> loadDetails() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    print(prefs.getString("dob"));
    setState(() {
      firstName = prefs.getString("firstName")!;
      lastName = prefs.getString("lastName")!;
      memberNo = prefs.getString("memberNo")!;
      contactNo = prefs.getString("contactNo")!;
      nic = prefs.getString("nic") == 'null' ? '' : prefs.getString("nic");
      gender = prefs.getString("gender") == 'null'
          ? 'male'
          : prefs.getString("gender")!;
      email = prefs.getString("email")!;
      dob = prefs.getString("dob") == null ? '' : prefs.getString("dob")!;
      registerDate = prefs.getString("registerDate") == "null"
          ? ''
          : prefs.getString("registerDate")!;
      weight = prefs.getString("weight") == 'null'
          ? 0
          : int.parse(prefs.getString("weight")!);
      height = prefs.getString("height") == 'null'
          ? 0
          : int.parse(prefs.getString("height")!);
      bmi = prefs.getString("bmi") == 'null'
          ? 0
          : double.parse(prefs.getString("bmi") ?? '0.0');
      isStaff = prefs.getString("isStaff") == 'true' ? true : false;
      isInstructor = prefs.getString("isInstructor") == 'true' ? true : false;
    });
  }

  void updateDetails() async {
    _formKey.currentState?.save();
    var valueMap = _formKey.currentState!.value;

    SharedPreferences prefs = await SharedPreferences.getInstance();
    var data = {
      'id': prefs.getString('id'),
      'firstName': valueMap['firstName'],
      'lastName': valueMap['lastName'],
      'dob': valueMap['dateofbirth'] == null
          ? ""
          : valueMap['dateofbirth'].toIso8601String(),
      'nic': valueMap['nic_no'],
      'gender': valueMap['gender'] == 'male' ? 1 : 2,
      'contactNo': valueMap['mobile_number'],
      'email': valueMap['email'],
    };

    var headers = {'Content-Type': 'application/json'};

    var response = await Api.sendPostRequest(
      updateProfileRoute,
      data: data,
      headers: headers,
    );

    if (!mounted) return;

    if (response.statusCode == 200) {
      showMessageDialog(
        context,
        'Success',
        'Details updated successfully.',
        'OK',
        () {
          Navigator.of(context).pop();
        },
      );
    } else {
      showMessageDialog(
        context,
        'Failed',
        'Failed to update',
        'OK',
        () {
          Navigator.of(context).pop();
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'MY PROFILE',
          style: TextStyle(
            fontWeight: FontWeight.w800,
            fontSize: 24.0,
          ),
        ),
      ),
      body: isLoading
          ? const LoadingScreen()
          : SingleChildScrollView(
              child: getPersonalInfoFragment(context),
            ),
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
                  text: 'First Name',
                ),
                const SizedBox(
                  height: 8.0,
                ),
                RoundedCornerTextField(
                  errorText: 'Please enter',
                  name: 'firstName',
                  textInputType: TextInputType.text,
                  isObscure: false,
                  hintText: 'Please enter',
                  value: firstName,
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
                RoundedCornerTextField(
                  errorText: 'Please enter',
                  name: 'lastName',
                  textInputType: TextInputType.text,
                  isObscure: false,
                  hintText: 'Please enter',
                  value: lastName,
                ),
                const SizedBox(
                  height: 8.0,
                ),
                const FormLabel(
                  text: 'Date of Birth',
                ),
                const SizedBox(
                  height: 8.0,
                ),
                RoundedCornerDatepicker(
                  name: 'dateofbirth',
                  errorText: 'Please select date of birth',
                  date: dob,
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
                RoundedCornerTextField(
                  errorText: 'Please enter',
                  name: 'nic_no',
                  textInputType: TextInputType.text,
                  isObscure: false,
                  hintText: 'Please enter',
                  value: nic,
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
                  initialValue: gender,
                ),
                const SizedBox(
                  height: 8.0,
                ),
                const FormLabel(
                  text: 'Mobile Number',
                ),
                const SizedBox(
                  height: 8.0,
                ),
                RoundedCornerTextField(
                  errorText: 'Please enter',
                  name: 'mobile_number',
                  textInputType: TextInputType.phone,
                  isObscure: false,
                  hintText: 'Please enter',
                  value: contactNo,
                ),
                const SizedBox(
                  height: 8.0,
                ),
                const FormLabel(
                  text: 'Email',
                ),
                const SizedBox(
                  height: 8.0,
                ),
                RoundedCornerTextField(
                  errorText: 'Please enter',
                  name: 'email',
                  textInputType: TextInputType.emailAddress,
                  isObscure: false,
                  hintText: 'Please enter',
                  value: email,
                ),
                const SizedBox(
                  height: 8.0,
                ),
                SizedBox(
                  width: const Size.fromHeight(40.0).width,
                  // height: 48.0,
                  child: RoundedButton(
                    buttonText: 'Update Details',
                    onPressed: () async {
                      setState(() {
                        isLoading = true;
                      });
                      updateDetails();
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
