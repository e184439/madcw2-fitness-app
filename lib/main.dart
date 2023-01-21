import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:madcw2_fitness/fitness_app.dart';
import 'package:madcw2_fitness/models/bmi_history_result.dart';

Future<void> _initHive() async {
  await Hive.initFlutter();

  // Hive.registerAdapter(MyAdapter());
  await Hive.openBox<BMIHistoryResult>('bmi_history');
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await _initHive();

  runApp(const FitnessApp());
}
