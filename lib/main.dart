import 'package:flutter/material.dart';
import 'package:flutter_provider/Expense%20Tracker/Provider/transaction_provider.dart';
import 'package:flutter_provider/Expense%20Tracker/View/home_screen.dart';
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
      create: (context) => TransactionProvider(),
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: HomeScreen(),
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