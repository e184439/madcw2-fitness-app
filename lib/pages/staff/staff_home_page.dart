import 'package:flutter/material.dart';
import 'package:madcw2_fitness/util/app_theme.dart';
import 'package:madcw2_fitness/widgets/ad_banner_slider.dart';
import 'package:madcw2_fitness/widgets/grid_button.dart';

class StaffHome extends StatefulWidget {
  const StaffHome({super.key});

  @override
  State<StaffHome> createState() => _StaffHomeState();
}

class _StaffHomeState extends State<StaffHome> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AdBannerSlider(),
          SizedBox(
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
                  text: 'Member',
                  onTap: () {},
                ),
                GridButton(
                  image: 'assets/images/man.png',
                  text: 'Trainer',
                  onTap: () {},
                ),
                GridButton(
                  image: 'assets/images/diet.png',
                  text: 'Assign Trainer',
                  onTap: () {},
                ),
                GridButton(
                  image: 'assets/images/rising.png',
                  text: 'Calendar',
                  onTap: () {},
                ),
                GridButton(
                  image: 'assets/images/member-card.png',
                  text: 'Payment',
                  onTap: () {},
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
