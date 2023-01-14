import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:madcw2_fitness/pages/auth/login_page.dart';
import 'package:madcw2_fitness/pages/member/member_dashboard_page.dart';
import 'package:madcw2_fitness/pages/landing_page.dart';
import 'package:madcw2_fitness/util/app_theme.dart';

class FitnessApp extends StatelessWidget {
  const FitnessApp({Key? key}) : super(key: key);

  ThemeData _buildTheme(brightness) {
    var baseTheme = ThemeData(
      brightness: brightness,
      backgroundColor: AppTheme.primaryColor,
      appBarTheme: AppBarTheme(backgroundColor: AppTheme.appBarColor),
      primaryColor: Colors.green.shade900,
      scaffoldBackgroundColor: Color(0xFFF4F4F4),
    );

    return baseTheme.copyWith(
        textTheme: GoogleFonts.openSansTextTheme(baseTheme.textTheme));
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fitness App',
      theme: _buildTheme(Brightness.light),
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => const LandingPage(
              key: Key('landing-page'),
            ),
        '/login': (context) => const LoginPage(
              key: Key('login-page'),
            ),
        '/home': (context) => const MemberDashboardPage(
              key: Key('dashboard-page'),
            )
      },
    );
  }
}
