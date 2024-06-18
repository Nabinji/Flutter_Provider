import 'package:flutter/material.dart';
import 'package:function_tree/function_tree.dart';

class CalculatorProvider extends ChangeNotifier {
  String _displayText = '0';

  String get displayText => _displayText;

  void setValue(String value) {
    if (_displayText == '0' && value != "=") {
      _displayText = value;
    } else {
      switch (value) {
        case "AC":
          _displayText = '0';
          break;
        case "x":
          _displayText += "*"; // Use * for multiplication in the expression
          break;
        case "=":
          compute();
          break;
        default:
          _displayText += value;
      }
    }
    notifyListeners();
  }

  void compute() {
    try {
      String expression = _displayText.replaceAll("x", "*");
      num result = expression.interpret();
      _displayText = result == result.toInt()
          ? result.toInt().toString()
          : result.toString();
    } catch (e) {
      _displayText = 'Error';
    }
    notifyListeners();
  }
}
