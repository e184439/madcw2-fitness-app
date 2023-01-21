import 'package:flutter/material.dart';
import 'package:madcw2_fitness/widgets/rounded_button.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MenuPage extends StatefulWidget {
  const MenuPage({super.key});

  @override
  State<MenuPage> createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  String userType = '';

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
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Logged in as: ',
                        style: Theme.of(context).textTheme.headline6),
                    Text('$userType User',
                        style: Theme.of(context).textTheme.headline6),
                  ],
                ),
              ),
              getMenuTileContainer(
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    RoundedButton(
                        buttonText: 'Logout',
                        onPressed: () {},
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
