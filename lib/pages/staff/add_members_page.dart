import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:madcw2_fitness/widgets/form/form_label.dart';
import 'package:madcw2_fitness/widgets/form/rounded_corner_datepicker.dart';
import 'package:madcw2_fitness/widgets/form/rounded_corner_dropdown.dart';
import 'package:madcw2_fitness/widgets/form/rounded_corner_text_field.dart';
import 'package:madcw2_fitness/widgets/rounded_button.dart';

class AddMembersPage extends StatefulWidget {
  const AddMembersPage({super.key});

  @override
  State<AddMembersPage> createState() => _AddMembersPageState();
}

class _AddMembersPageState extends State<AddMembersPage> {
  final _generalDetailsFormKey = GlobalKey<FormBuilderState>();
  final _personalDetailsFormKey = GlobalKey<FormBuilderState>();

  String step = 'personal';

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: getGeneralInfoFragment(context),
    );
  }

  Widget getPageView(BuildContext context) {
    Widget w = (step == 'general')
        ? getGeneralInfoFragment(context)
        : getPersonalInfoFragment(context);

    return w;
  }

  /// get personal info fragment
  Column getPersonalInfoFragment(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: 172,
                height: 40,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: const Color(0xff052351),
                ),
                padding:
                    const EdgeInsets.symmetric(vertical: 6.0, horizontal: 0),
                child: const Text(
                  "Personal Info",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontFamily: "Roboto",
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              Container(
                width: 172,
                height: 40,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  border: Border.all(
                    color: const Color(0xff052351),
                    width: 1,
                  ),
                  color: Colors.white,
                ),
                padding:
                    const EdgeInsets.symmetric(vertical: 6.0, horizontal: 0),
                child: const Text(
                  "General Info",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0xff052351),
                    fontSize: 20,
                    fontFamily: "Roboto",
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
        ),
        FormBuilder(
          key: _personalDetailsFormKey,
          autovalidateMode: AutovalidateMode.disabled,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const FormLabel(
                  text: 'Membership Number',
                ),
                const SizedBox(
                  height: 8.0,
                ),
                const RoundedCornerTextField(
                  errorText: 'Please enter',
                  name: 'membership_number',
                  textInputType: TextInputType.text,
                  isObscure: false,
                  hintText: 'Please enter',
                ),
                const SizedBox(
                  height: 8.0,
                ),
                const FormLabel(
                  text: 'Membership Type',
                ),
                const SizedBox(
                  height: 8.0,
                ),
                const RoundedCornerDropdown(
                  name: 'membership_type',
                  errorText: 'Please select a membership type',
                  items: [
                    DropdownMenuItem(child: Text('Test'), value: 'test'),
                    DropdownMenuItem(child: Text('Test2'), value: 'test2'),
                    DropdownMenuItem(child: Text('Test3'), value: 'test3'),
                  ],
                ),
                const SizedBox(
                  height: 8.0,
                ),
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
                    DropdownMenuItem(child: Text('Test'), value: 'test'),
                    DropdownMenuItem(child: Text('Test2'), value: 'test2'),
                    DropdownMenuItem(child: Text('Test3'), value: 'test3'),
                  ],
                ),
                const SizedBox(
                  height: 16.0,
                ),
                SizedBox(
                  width: const Size.fromHeight(40.0).width,
                  // height: 48.0,
                  child: RoundedButton(
                    buttonText: 'Submit',
                    onPressed: () {
                      setState(() {
                        print('earlier:' + step);
                        step = 'general';
                        print('after:' + step);
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

  /// get general info fragment
  Column getGeneralInfoFragment(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: 172,
                height: 40,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: const Color(0xff052351),
                ),
                padding:
                    const EdgeInsets.symmetric(vertical: 6.0, horizontal: 0),
                child: const Text(
                  "Personal Info",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontFamily: "Roboto",
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              Container(
                width: 172,
                height: 40,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  border: Border.all(
                    color: const Color(0xff052351),
                    width: 1,
                  ),
                  color: Colors.white,
                ),
                padding:
                    const EdgeInsets.symmetric(vertical: 6.0, horizontal: 0),
                child: const Text(
                  "General Info",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0xff052351),
                    fontSize: 20,
                    fontFamily: "Roboto",
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
        ),
        FormBuilder(
          key: _generalDetailsFormKey,
          autovalidateMode: AutovalidateMode.disabled,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const FormLabel(
                  text: 'Membership Number',
                ),
                const SizedBox(
                  height: 8.0,
                ),
                const RoundedCornerTextField(
                  errorText: 'Please enter',
                  name: 'membership_number',
                  textInputType: TextInputType.text,
                  isObscure: false,
                  hintText: 'Please enter',
                ),
                const SizedBox(
                  height: 8.0,
                ),
                const FormLabel(
                  text: 'Membership Type',
                ),
                const SizedBox(
                  height: 8.0,
                ),
                const RoundedCornerDropdown(
                  name: 'membership_type',
                  errorText: 'Please select a membership type',
                  items: [
                    DropdownMenuItem(child: Text('Test'), value: 'test'),
                    DropdownMenuItem(child: Text('Test2'), value: 'test2'),
                    DropdownMenuItem(child: Text('Test3'), value: 'test3'),
                  ],
                ),
                const SizedBox(
                  height: 8.0,
                ),
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
                    DropdownMenuItem(child: Text('Test'), value: 'test'),
                    DropdownMenuItem(child: Text('Test2'), value: 'test2'),
                    DropdownMenuItem(child: Text('Test3'), value: 'test3'),
                  ],
                ),
                const SizedBox(
                  height: 16.0,
                ),
                SizedBox(
                  width: const Size.fromHeight(40.0).width,
                  // height: 48.0,
                  child: RoundedButton(
                    buttonText: 'Submit',
                    onPressed: () {
                      // save data of the forms
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
