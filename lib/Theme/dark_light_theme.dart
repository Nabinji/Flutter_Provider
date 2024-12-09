import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'Provider/theme_provider.dart';

class DarkLightTheme extends StatefulWidget {
  const DarkLightTheme({super.key});

  @override
  _DarkLightThemeState createState() => _DarkLightThemeState();
}

class _DarkLightThemeState extends State<DarkLightTheme> {
  bool _isClicked = false;
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ThemeProvider>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: _isClicked? Colors.blue:Colors.green,
        title: const Text("Theme"),
        actions: [
          IconButton(
            onPressed: () {
              setState(() {
                _isClicked = !_isClicked;
              });
              provider.setTheme();
            },
            icon: Icon(
              _isClicked ? Icons.light_mode : Icons.dark_mode,
              color: _isClicked ? Colors.white : Colors.black,
              size: 40,
            ),
          ),
        ],
      ),
      body: const Center(
        child: Padding(
          padding: EdgeInsets.all(10.0),
          child: Column(
            children: [
              Text(
                "We have change the them of our app and at the same time we have also change the appbar, icon, and text color",
                style: TextStyle(fontSize: 20),
              ),
              Icon(Icons.favorite, size: 50),
            ],
          ),
        ),
      ),
    );
  }
}
