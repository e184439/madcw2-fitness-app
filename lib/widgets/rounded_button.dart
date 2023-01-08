import 'package:flutter/material.dart';

class RoundedButton extends StatefulWidget {
  final String buttonText;
  final VoidCallback onPressed;
  final Icon? icon;
  final bool isDisabled;

  const RoundedButton(
      {super.key,
      required this.buttonText,
      required this.onPressed,
      this.icon, required this.isDisabled});

  @override
  State<RoundedButton> createState() => _RoundedButtonState();
}

class _RoundedButtonState extends State<RoundedButton> {
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(32.0))),
      color: Theme.of(context).primaryColor,
      onPressed: (widget.isDisabled) ? null : widget.onPressed,
      padding: const EdgeInsets.all(16.0),
      disabledColor: Colors.grey,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            widget.buttonText,
            style: const TextStyle(fontSize: 18.0, color: Colors.white),
          ),
          const SizedBox(
            width: 8.0,
          ),
          widget.icon!,
        ],
      ),
    );
  }
}
