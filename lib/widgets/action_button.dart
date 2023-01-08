import 'package:flutter/material.dart';

class ActionButton extends StatelessWidget {
  const ActionButton({Key? key, required this.text, required this.onTap, required this.icon, required this.padding, required this.backgroundColor}) : super(key: key);

  final String text;
  final VoidCallback onTap;
  final IconData icon;
  final double padding;
  final Color backgroundColor;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.all(16.0),
        width: 200.0,
        height: 170.0,
        decoration: BoxDecoration(
          color: backgroundColor,
          border: Border.all(width: 2.0, color: Colors.black54),
          borderRadius: const BorderRadius.all(Radius.circular(16.0)),
        ),
        padding: EdgeInsets.all(padding),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Icon(
              icon,
              color: Colors.white,
              size: 81.0,
            ),
            Text(
              text,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 16.0,
              ),
            )
          ],
        ),
      ),
    );
  }
}
