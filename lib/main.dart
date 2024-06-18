import 'package:flutter/material.dart';
import 'package:flutter_provider/Calculator/Provider/calculator_provider.dart';
import 'package:flutter_provider/Calculator/Screen/my_calculator.dart';
import 'package:provider/provider.dart';


void main() {
  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => CalculatorProvider(),
      child: MaterialApp(
        theme: ThemeData.dark(),
        debugShowCheckedModeBanner: false,
        home: const MyCalculator(),
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