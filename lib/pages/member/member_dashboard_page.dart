import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:madcw2_fitness/pages/my_profile_page.dart';
import 'package:madcw2_fitness/util/app_theme.dart';
import 'package:madcw2_fitness/widgets/ad_banner.dart';
import 'package:madcw2_fitness/widgets/ad_banner_slider.dart';
import 'package:madcw2_fitness/widgets/grid_button.dart';

class MemberDashboardPage extends StatefulWidget {
  const MemberDashboardPage({Key? key}) : super(key: key);

  @override
  State<MemberDashboardPage> createState() => _MemberDashboardPageState();
}

class _MemberDashboardPageState extends State<MemberDashboardPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'HOME',
          style: TextStyle(
            fontWeight: FontWeight.w800,
            fontSize: 24.0,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const AdBannerSlider(),
            const SizedBox(
              height: 24.0,
            ),
            Expanded(
              child: GridView.count(
                primary: false,
                padding: const EdgeInsets.all(20),
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                crossAxisCount: 2,
                children: <Widget>[
                  GridButton(
                    image: 'assets/images/schedule.png',
                    text: 'My Schedule',
                    onTap: () {},
                  ),
                  GridButton(
                    image: 'assets/images/man.png',
                    text: 'My Profile',
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) {
                          return const MyProfilePage();
                        },
                      ));
                    },
                  ),
                  GridButton(
                    image: 'assets/images/diet.png',
                    text: 'My Diet',
                    onTap: () {},
                  ),
                  GridButton(
                    image: 'assets/images/rising.png',
                    text: 'My Progress',
                    onTap: () {},
                  ),
                  GridButton(
                    image: 'assets/images/member-card.png',
                    text: 'My Membership',
                    onTap: () {},
                  ),
                  GridButton(
                    image: 'assets/images/user-guide 1.png',
                    text: 'Guide Book',
                    onTap: () {},
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: AppTheme.appBarColor,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white.withOpacity(.60),
        selectedFontSize: 14,
        unselectedFontSize: 14,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        onTap: (value) {
          // Respond to item press.
        },
        items: [
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
            icon: Icon(Icons.person_outline_rounded),
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
