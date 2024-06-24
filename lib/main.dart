import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'Timer/coundown_timer.dart';
import 'Timer/provider/time_provider.dart';


void main() {
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) =>  TimerProvider(),
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: TimerPage(),
      ),
    );
  }
}










  // debugShowCheckedModeBanner: false,
          // themeMode: provider.themeState,
          // theme: ThemeData(brightness: Brightness.light),
          // darkTheme: ThemeData(
          //   iconTheme: IconThemeData(color:Colors.red),
          //   brightness: Brightness.dark,
          // ),