// set up the AlertDialog
import 'package:flutter/material.dart';

void showConfirmationDialog(
  BuildContext context,
  String title,
  String message,
  String confirmButtonText,
  String cancelButtonText,
  VoidCallback onConfirm,
  VoidCallback onCancel,
) {
// set up the buttons
  Widget cancelButton = TextButton(
    onPressed: onCancel,
    child: Text(cancelButtonText),
  );

  Widget continueButton = TextButton(
    onPressed: onConfirm,
    child: Text(
      confirmButtonText,
      style: const TextStyle(fontWeight: FontWeight.bold),
    ),
  );

  AlertDialog alert = AlertDialog(
    title: Text(title),
    content: Text(message),
    actions: [
      cancelButton,
      continueButton,
    ],
  );

  // show the dialog
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return alert;
    },
  );
}

void showMessageDialog(
  BuildContext context,
  String title,
  String message,
  String confirmButtonText,
  VoidCallback onConfirm,
) {
  Widget continueButton = TextButton(
    onPressed: onConfirm,
    child: Text(
      confirmButtonText,
      style: const TextStyle(fontWeight: FontWeight.bold),
    ),
  );

  AlertDialog alert = AlertDialog(
    title: Text(title),
    content: Text(message),
    actions: [
      continueButton,
    ],
  );

  // show the dialog
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return alert;
    },
  );
}
