import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

class RoundedCornerDropdown extends StatelessWidget {
  final String name;
  final String errorText;
  final List<DropdownMenuItem> items;

  const RoundedCornerDropdown(
      {Key? key,
      required this.name,
      required this.errorText,
      required this.items})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FormBuilderDropdown(
      name: name,
      decoration: const InputDecoration(
        contentPadding: EdgeInsets.symmetric(
          vertical: 8.0,
          horizontal: 16.0,
        ),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(16.0))),
      ),
      validator: FormBuilderValidators.compose([
        FormBuilderValidators.required(errorText: errorText),
      ]),
      items: items,
    );
  }
}
