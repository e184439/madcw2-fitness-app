import 'package:flutter/material.dart';
import 'package:madcw2_fitness/util/app_theme.dart';

class StaffNotifications extends StatefulWidget {
  const StaffNotifications({super.key});

  @override
  State<StaffNotifications> createState() => _StaffNotificationsState();
}

class _StaffNotificationsState extends State<StaffNotifications> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(child: Text('staff notifications page')),
    );
  }
}
