import 'package:flutter/material.dart';
import 'dart:async';

class TimerProvider extends ChangeNotifier {
  int _remainingTime = 60; // Default timer value in seconds
  int _initialTime = 60;
  Timer? _timer;
  bool _isRunning = false;

  int get remainingTime => _remainingTime;
  int get initialTime => _initialTime; // Getter for _initialTime
  bool get isRunning => _isRunning;

  // Starts the timer and updates the remaining time every second.
  void startTimer() {
    if (_timer != null || _remainingTime == 0) return;

    _isRunning = true;
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_remainingTime > 0) {
        _remainingTime--;
        notifyListeners();
      } else {
        _timer?.cancel();
        _timer = null;
        _remainingTime = _initialTime; // Reset to initial time when timer ends
        _isRunning = false;
        notifyListeners();
      }
    });
  }

  // Pauses the timer.
  void pauseTimer() {
    _timer?.cancel();
    _timer = null;
    _isRunning = false;
    notifyListeners();
  }

  // Resets the timer to the initial time.
  void resetTimer() {
    _timer?.cancel();
    _timer = null;
    _remainingTime = _initialTime;
    _isRunning = false;
    notifyListeners();
  }

  // Sets the timer to a specified number of seconds.
  void setTime(int seconds) {
    _remainingTime = seconds;
    _initialTime = seconds;
    notifyListeners();
  }
}
