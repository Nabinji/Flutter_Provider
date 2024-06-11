import 'package:flutter/material.dart';
import 'package:flutter_provider/Provider/change_them.dart';
import 'package:provider/provider.dart';

import 'Screen/dark_light_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ThemeProvider(),
      builder: (context, child) {
        final provider = Provider.of<ThemeProvider>(context);
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          themeMode: provider.themeState,
          theme: ThemeData(
            brightness: Brightness.light,
          ),
          darkTheme: ThemeData(
            brightness: Brightness.dark,
            iconTheme: const IconThemeData(color: Colors.red),
          ),
          home: const DarkLightTheme(),
        );
      },
    );
  }
}
