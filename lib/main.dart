import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'Habit Tracker/Provider/habit_tracker_provider.dart';
import 'Habit Tracker/Screen/habit_list.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => HabitProvider()),
      ],
      child: MaterialApp(
        title: 'Habit Tracker',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const HabitListScreen(),
      ),
    ),
  );
}
