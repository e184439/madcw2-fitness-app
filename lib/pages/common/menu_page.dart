import 'package:flutter/material.dart';
import 'package:madcw2_fitness/util/app_theme.dart';
import 'package:madcw2_fitness/widgets/rounded_button.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MenuPage extends StatefulWidget {
  const MenuPage({super.key});

  @override
  State<MenuPage> createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  String userType = '';
  String firstName = '';
  String lastName = '';

  void setUserType() async {
    // get isStaff and isInstructor from the SharedPreferences
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var isStaff = prefs.get('isStaff');
    var isInstructor = prefs.get('isInstructor');
    // check if instructor
    if (isInstructor.toString() == 'true') {
      setState(() {
        userType = 'Instructor';
      });
    } else if (isStaff.toString() == 'true') {
      setState(() {
        userType = 'Staff';
      });
    } else {
      setState(() {
        userType = 'Member';
      });
    }

    setState(() {
      firstName = prefs.getString('firstName') ?? 'Guest';
      lastName = prefs.getString('lastName') ?? '';
    });
  }

  @override
  void initState() {
    super.initState();
    setUserType();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              getMenuTileContainer(
                Text(
                  'Welcome $firstName $lastName!',
                  style: Theme.of(context).textTheme.headline6,
                ),
              ),
              getMenuTileContainer(
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Logged in as: ',
                      style: Theme.of(context).textTheme.headline6,
                    ),
                    Text(
                      userType,
                      style: Theme.of(context)
                          .textTheme
                          .headline6
                          ?.copyWith(color: AppTheme.appBarColor),
                    ),
                  ],
                ),
              ),
              getMenuTileContainer(
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    RoundedButton(
                        buttonText: 'Logout',
                        onPressed: () async {
                          // confirm to log out
                          await showDialog(
                            context: context,
                            builder: (context) => AlertDialog(
                              title: const Text('Confirm Logout'),
                              content: const Text(
                                  'Are you sure you want to log out?'),
                              actions: [
                                TextButton(
                                  onPressed: () async {
                                    Navigator.pop(context, true);
                                    // clear all saved preference items
                                    SharedPreferences prefs =
                                        await SharedPreferences.getInstance();
                                    prefs.clear();

                                    if (!mounted) return;

                                    // redirect to /
                                    Navigator.pushNamedAndRemoveUntil(
                                        context, '/', (route) => false);
                                  },
                                  child: const Text('Yes'),
                                ),
                                TextButton(
                                  onPressed: () =>
                                      Navigator.pop(context, false),
                                  child: const Text('No'),
                                ),
                              ],
                            ),
                          );
                        },
                        isDisabled: false)
                  ],
                ),
              ),
            ]),
      ),
    );
  }

  Container getMenuTileContainer(Widget child) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(8.0),
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(width: 1.0, color: Colors.black),
        ),
      ),
      child: child,
    );
  }
}
