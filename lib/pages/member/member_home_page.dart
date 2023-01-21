import 'package:flutter/material.dart';
import 'package:madcw2_fitness/pages/member/member_guide_page.dart';
import 'package:madcw2_fitness/pages/member/my_membership_plans_payment_page.dart';
import 'package:madcw2_fitness/pages/member/my_profile_page.dart';
import 'package:madcw2_fitness/pages/member/my_schedules_page.dart';
import 'package:madcw2_fitness/widgets/ad_banner_slider.dart';
import 'package:madcw2_fitness/widgets/grid_button.dart';

class MemberHomePage extends StatefulWidget {
  const MemberHomePage({super.key});

  @override
  State<MemberHomePage> createState() => _MemberHomePageState();
}

class _MemberHomePageState extends State<MemberHomePage> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const AdBannerSlider(),
            const SizedBox(
              height: 24.0,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GridButton(
                      image: 'assets/images/schedule.png',
                      text: 'My Schedule',
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => const MySchedulePage(),
                          ),
                        );
                      },
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
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GridButton(
                      image: 'assets/images/diet.png',
                      text: 'My Diet',
                      onTap: () {},
                    ),
                    GridButton(
                      image: 'assets/images/rising.png',
                      text: 'My Progress',
                      onTap: () {},
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GridButton(
                      image: 'assets/images/member-card.png',
                      text: 'My Membership',
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) =>
                                const MyMembershipPlansPaymentPage(),
                          ),
                        );
                      },
                    ),
                    GridButton(
                      image: 'assets/images/user-guide 1.png',
                      text: 'Guide Book',
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => const MemberGuidePage(),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
