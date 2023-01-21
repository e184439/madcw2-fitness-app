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
  final _personalDetailsFormKey = GlobalKey<FormBuilderState>();

  String step = 'personal';

  bool isEnrolledInGymBefore = false;
  bool isHasInjuredBefore = false;
  int bmi = 0;
  int height = 0;
  int weight = 0;

  /// calculate bmi form weight and height
  void calculateBMI() {
    if (height == 0 || weight == 0) bmi = 0;

    bmi = (weight / (height * height)).round();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: getPersonalInfoFragment(context),
    );
  }

  /// get personal info fragment
  Column getPersonalInfoFragment(BuildContext context) {
    return Column(
      children: [
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
                    DropdownMenuItem(value: 'test', child: Text('Test')),
                    DropdownMenuItem(value: 'test2', child: Text('Test2')),
                    DropdownMenuItem(value: 'test3', child: Text('Test3')),
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
                    DropdownMenuItem(value: 'male', child: Text('Male')),
                    DropdownMenuItem(value: 'female', child: Text('Female')),
                  ],
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
                  onChanged: (value) {
                    setState(() {
                      calculateBMI();
                    });
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
                const RoundedCornerTextField(
                  errorText: 'Please enter',
                  name: 'height',
                  textInputType: TextInputType.numberWithOptions(
                    signed: true,
                    decimal: false,
                  ),
                  isObscure: false,
                  hintText: 'Please enter',
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
                  child: const Text(
                    '0',
                    style: TextStyle(fontSize: 16.0),
                  ),
                ),

                // end add general info page items here
                const SizedBox(
                  height: 16.0,
                ),
                SizedBox(
                  width: const Size.fromHeight(40.0).width,
                  // height: 48.0,
                  child: RoundedButton(
                    buttonText: 'Submit',
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
