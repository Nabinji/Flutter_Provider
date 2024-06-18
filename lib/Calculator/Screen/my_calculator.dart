import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_provider/Calculator/color.dart';
import 'package:provider/provider.dart';
import '../Provider/calculator_provider.dart';

class MyCalculator extends StatefulWidget {
  const MyCalculator({super.key});

  @override
  _MyCalculatorState createState() => _MyCalculatorState();
}

class _MyCalculatorState extends State<MyCalculator> {
  Map<String, bool> buttonStates = {};

  void handleTap(String btntxt) {
    setState(() {
      buttonStates[btntxt] = true;
    });

    Provider.of<CalculatorProvider>(context, listen: false).setValue(btntxt);

    Timer(const Duration(milliseconds: 350), () {
      setState(() {
        buttonStates[btntxt] = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<CalculatorProvider>(builder: (context, provider, _) {
      return Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Align(
                  alignment: Alignment.centerRight,
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Text(
                            provider.displayText,
                            textAlign: TextAlign.left,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 100,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    numSymbolButton(Colors.grey[350]!, 'AC', Colors.black),
                    numSymbolButton(Colors.grey[350]!, '+/-', Colors.black),
                    numSymbolButton(Colors.grey[350]!, '%', Colors.black),
                    numSymbolButton(symbolBgColor, '/', Colors.white),
                  ],
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    numSymbolButton(numberBgColor, '7', Colors.white),
                    numSymbolButton(numberBgColor, '8', Colors.white),
                    numSymbolButton(numberBgColor, '9', Colors.white),
                    numSymbolButton(symbolBgColor, 'x', Colors.white),
                  ],
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    numSymbolButton(numberBgColor, '4', Colors.white),
                    numSymbolButton(numberBgColor, '5', Colors.white),
                    numSymbolButton(numberBgColor, '6', Colors.white),
                    numSymbolButton(symbolBgColor, '-', Colors.white),
                  ],
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    numSymbolButton(numberBgColor, '1', Colors.white),
                    numSymbolButton(numberBgColor, '2', Colors.white),
                    numSymbolButton(numberBgColor, '3', Colors.white),
                    numSymbolButton(symbolBgColor, '+', Colors.white),
                  ],
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: numberBgColor,
                        padding: const EdgeInsets.fromLTRB(35, 14, 128, 14),
                        shape: const StadiumBorder(),
                      ),
                      onPressed: () => Provider.of<CalculatorProvider>(context,
                              listen: false)
                          .setValue("0"),
                      child: const Text(
                        '0',
                        style: TextStyle(fontSize: 35, color: Colors.white),
                      ),
                    ),
                    numSymbolButton(numberBgColor, '.', Colors.white),
                    numSymbolButton(symbolBgColor, '=', Colors.white),
                  ],
                ),
                const SizedBox(height: 10),
              ],
            ),
          ),
        ),
      );
    });
  }

  Widget numSymbolButton(
    Color btncolor,
    String btntxt,
    Color txtcolor,
  ) {
    bool isChange = buttonStates[btntxt] ?? false;

    return GestureDetector(
      onTap: () => handleTap(btntxt),
      child: Container(
        height: 80,
        width: 80,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: isChange ? Colors.white38 : btncolor,
        ),
        child: Center(
          child: Text(
            btntxt,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.bold,
              color: txtcolor,
            ),
          ),
        ),
      ),
    );
  }
}
