import 'dart:async';

import 'package:flutter/material.dart';

class TimeProvider extends ChangeNotifier {
  int _remainingTime = 60; // default timer value in seconds
  int _initialTime = 60;
  Timer? _timer;
  bool _isRunning = false;

  int get remainingTime => _remainingTime;
  int get initialTime => _initialTime;
  bool get isRunning => _isRunning;

  // starts the timer and updates the remaining time every seconds.
  void startTimer() {
    if (_timer != null || _remainingTime == 0) return;
    _isRunning = true;
    _timer = Timer.periodic(
      const Duration(seconds: 1),
      (timer) {
        if (_remainingTime > 0) {
          _remainingTime--;
          notifyListeners();
        } else {
          _timer?.cancel();
          _timer = null;
          _remainingTime = _initialTime; // Reset to inital time when tiemr ends
          _isRunning = false;
          notifyListeners();
        }
      },
    );
  }

  // pause the timer.
  void pauseTimer() {
    _timer?.cancel();
    _timer = null;
    _isRunning = false;
    notifyListeners();
  }

  // // Reset the timer to the initial time.
  void resetTimer() {
    _timer?.cancel();
    _timer = null;
    _remainingTime = _initialTime;
    _isRunning = false;
    notifyListeners();
  }

  void setTime(int seconds) {
    _remainingTime = seconds;
    _initialTime = seconds;
    notifyListeners();
  }
}
