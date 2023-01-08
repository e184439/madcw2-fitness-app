import 'package:flutter/material.dart';

class RoundedCornerTag extends StatelessWidget {
  final Color tagColor;
  final Color textColor;
  final double fontSize;
  final String type;
  final double borderRadius;

  const RoundedCornerTag({
    Key? key,
    required this.tagColor,
    required this.type,
    required this.textColor,
    required this.fontSize,
    required this.borderRadius,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: tagColor,
        borderRadius: BorderRadius.all(
          Radius.circular(borderRadius),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(8.0, 4.0, 8.0, 4.0),
        child: Text(
          type,
          style: TextStyle(
            fontSize: fontSize,
            color: textColor,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
