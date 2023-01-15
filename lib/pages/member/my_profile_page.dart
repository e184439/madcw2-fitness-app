import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:madcw2_fitness/widgets/form/form_label.dart';
import 'package:madcw2_fitness/widgets/form/rounded_corner_datepicker.dart';
import 'package:madcw2_fitness/widgets/form/rounded_corner_dropdown.dart';
import 'package:madcw2_fitness/widgets/form/rounded_corner_text_field.dart';
import 'package:madcw2_fitness/widgets/rounded_button.dart';

class MyProfilePage extends StatefulWidget {
  const MyProfilePage({super.key});

  @override
  State<MyProfilePage> createState() => _MyProfilePageState();
}

class _MyProfilePageState extends State<MyProfilePage> {
  final _formKey = GlobalKey<FormBuilderState>();

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
      body: SingleChildScrollView(
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
                  text: 'Firstname',
                ),
                const SizedBox(
                  height: 8.0,
                ),
                const RoundedCornerTextField(
                  errorText: 'Please enter',
                  name: 'firstname',
                  textInputType: TextInputType.text,
                  isObscure: false,
                  hintText: 'Please enter',
                ),
                const SizedBox(
                  height: 8.0,
                ),
                const FormLabel(
                  text: 'Surname',
                ),
                const SizedBox(
                  height: 8.0,
                ),
                const RoundedCornerTextField(
                  errorText: 'Please enter',
                  name: 'surname',
                  textInputType: TextInputType.text,
                  isObscure: false,
                  hintText: 'Please enter',
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
                const RoundedCornerDatepicker(
                  name: 'dateofbirth',
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
                const RoundedCornerDropdown(
                  name: 'gender',
                  errorText: 'Please select gender',
                  items: [
                    DropdownMenuItem(
                      value: 'test',
                      child: Text('Test'),
                    ),
                    DropdownMenuItem(
                      value: 'test2',
                      child: Text('Test2'),
                    ),
                    DropdownMenuItem(
                      value: 'test3',
                      child: Text('Test3'),
                    ),
                  ],
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
                const RoundedCornerTextField(
                  errorText: 'Please enter',
                  name: 'mobile_number',
                  textInputType: TextInputType.phone,
                  isObscure: false,
                  hintText: 'Please enter',
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
                const RoundedCornerTextField(
                  errorText: 'Please enter',
                  name: 'email',
                  textInputType: TextInputType.emailAddress,
                  isObscure: false,
                  hintText: 'Please enter',
                ),
                const SizedBox(
                  height: 8.0,
                ),
                const FormLabel(
                  text: 'Reason for joining the gym',
                ),
                const SizedBox(
                  height: 8.0,
                ),
                const RoundedCornerDropdown(
                  name: 'reason',
                  errorText: 'Please select',
                  items: [
                    DropdownMenuItem(value: 'test', child: Text('Reason 1')),
                    DropdownMenuItem(value: 'test2', child: Text('Reason 2')),
                    DropdownMenuItem(value: 'test3', child: Text('Reason 3')),
                  ],
                ),
                const SizedBox(
                  height: 8.0,
                ),
                const SizedBox(
                  height: 16.0,
                ),
                SizedBox(
                  width: const Size.fromHeight(40.0).width,
                  // height: 48.0,
                  child: RoundedButton(
                    buttonText: 'Update',
                    onPressed: () {},
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
