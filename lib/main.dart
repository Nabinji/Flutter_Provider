import 'package:flutter/material.dart';
import 'package:flutter_provider/Voting%20App/Provider/voting_provider.dart';
import 'package:flutter_provider/Voting%20App/Screen/voting_screen.dart';
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

      create: (context) => VotingProvider(),
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: VotingScreen(),
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