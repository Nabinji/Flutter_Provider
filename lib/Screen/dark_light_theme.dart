import 'package:flutter/material.dart';
import 'package:flutter_provider/Provider/change_them.dart';
import 'package:provider/provider.dart';

class DarkLightTheme extends StatefulWidget {
  const DarkLightTheme({super.key});

  @override
  _DarkLightThemeState createState() => _DarkLightThemeState();
}

class _DarkLightThemeState extends State<DarkLightTheme> {
  // Initial state for icon and color
  bool _isClicked = false;
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ThemeProvider>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: _isClicked ? Colors.blue : Colors.green,
        title: const Text("Change Theme"),
        actions: [
          IconButton(
            icon: Icon(
              _isClicked ? Icons.light_mode : Icons.dark_mode,
              color: _isClicked ? Colors.white : Colors.black,
            ),
            iconSize: 50.0,
            onPressed: () {
              provider.setTheme();
              setState(
                () {
                  _isClicked = !_isClicked;
                },
              );
            },
          ),
        ],
      ),
      body: const Center(
        child: Padding(
          padding: EdgeInsets.all(15.0),
          child: Column(
            children: [
              Text(
                  'Text and Icon color is also change. we have used Provider to mange the state.',
                  style: TextStyle(fontSize: 20)),
              Icon(
                Icons.favorite,
                size: 50,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
