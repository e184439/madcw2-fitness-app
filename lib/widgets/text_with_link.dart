import 'package:flutter/material.dart';
import 'package:madcw2_fitness/util/app_theme.dart';

class TextWithLink extends StatelessWidget {
  const TextWithLink({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Text(
          'Don\'t have an account?',
          style: TextStyle(
            fontSize: 16.0,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(
          width: 8.0,
        ),
        Text(
          'Create account',
          style: TextStyle(
            fontSize: 16.0,
            fontWeight: FontWeight.w700,
            color: AppTheme.buttonColor,
          ),
        ),
      ],
    );
  }
}
