import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:madcw2_fitness/pages/common/menu_page.dart';
import 'package:madcw2_fitness/pages/member/member_home_page.dart';
import 'package:madcw2_fitness/pages/member/member_notifications.dart';
import 'package:madcw2_fitness/pages/member/my_profile_page.dart';
import 'package:madcw2_fitness/util/app_theme.dart';
import 'package:madcw2_fitness/widgets/ad_banner_slider.dart';
import 'package:madcw2_fitness/widgets/grid_button.dart';

class MemberDashboardPage extends StatefulWidget {
  const MemberDashboardPage({Key? key}) : super(key: key);

  @override
  State<MemberDashboardPage> createState() => _MemberDashboardPageState();
}

class _MemberDashboardPageState extends State<MemberDashboardPage> {
  int selectedIndex = 0;
  final titles = ['HOME', 'NOTIFICATIONS', 'MY PROFILE', 'MENU'];
  final pages = [
    const MemberHomePage(),
    const MemberNotifications(),
    const MyProfilePage(),
    const MenuPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          titles[selectedIndex],
          style: const TextStyle(
            fontWeight: FontWeight.w800,
            fontSize: 24.0,
          ),
        ),
      ),
      body: pages[selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: selectedIndex,
        backgroundColor: AppTheme.appBarColor,
        selectedItemColor: AppTheme.buttonColor,
        unselectedItemColor: Colors.white.withOpacity(.60),
        selectedFontSize: 14,
        unselectedFontSize: 14,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        onTap: (index) {
          setState(() {
            selectedIndex = index;
          });
        },
        items: [
          const BottomNavigationBarItem(
            label: '',
            icon: Icon(Icons.home),
          ),
          const BottomNavigationBarItem(
            label: '',
            icon: Icon(Icons.notifications_outlined),
          ),
          const BottomNavigationBarItem(
            label: '',
            icon: Icon(Icons.person_outline_rounded),
          ),
          const BottomNavigationBarItem(
            label: '',
            icon: Icon(Icons.grid_view),
          ),
        ],
      ),
    );
  }
}
