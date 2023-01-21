import 'package:flutter/material.dart';
import 'package:madcw2_fitness/pages/common/menu_page.dart';
import 'package:madcw2_fitness/pages/member/my_profile_page.dart';
import 'package:madcw2_fitness/pages/staff/add_members_page.dart';
import 'package:madcw2_fitness/pages/staff/staff_home_page.dart';
import 'package:madcw2_fitness/pages/staff/staff_notifications_page.dart';
import 'package:madcw2_fitness/util/app_theme.dart';

class StaffDashboardPage extends StatefulWidget {
  const StaffDashboardPage({Key? key}) : super(key: key);

  @override
  State<StaffDashboardPage> createState() => _StaffDashboardPageState();
}

class _StaffDashboardPageState extends State<StaffDashboardPage> {
  int selectedIndex = 0;
  final titles = ['HOME', 'NOTIFICATIONS', 'ADD MEMBERS', 'MENU'];
  final pages = [
    const StaffHome(),
    const StaffNotifications(),
    const AddMembersPage(),
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
        selectedIconTheme: const IconThemeData(size: 28),
        items: const [
          BottomNavigationBarItem(
            label: '',
            icon: Icon(Icons.home),
          ),
          BottomNavigationBarItem(
            label: '',
            icon: Icon(Icons.notifications_outlined),
          ),
          BottomNavigationBarItem(
            label: '',
            icon: Icon(Icons.person_add_alt_1_outlined),
          ),
          BottomNavigationBarItem(
            label: '',
            icon: Icon(Icons.grid_view),
          ),
        ],
      ),
    );
  }
}
