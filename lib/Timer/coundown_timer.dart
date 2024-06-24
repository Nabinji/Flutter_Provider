import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

import 'provider/time_provider.dart';


class TimerPage extends StatelessWidget {
  const TimerPage({super.key});

  @override
  Widget build(BuildContext context) {
    final timerProvider = Provider.of<TimerProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Countdown Timer'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Stack(
            alignment: Alignment.center,
            children: [
              // progress indicator to display the time duration
              SizedBox(
                height: 280,
                width: 280,
                child: CircularProgressIndicator(
                  backgroundColor: Colors.black12,
                  value: timerProvider.initialTime > 0
                      ? timerProvider.remainingTime / timerProvider.initialTime
                      : 0,
                  strokeWidth: 8,
                ),
              ),
              // display the time
              GestureDetector(
                onTap: () => _showTimePicker(context, timerProvider),
                child: Text(
                  _formatTime(timerProvider.remainingTime),
                  style: const TextStyle(
                      fontSize: 48, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
          const SizedBox(height: 30),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              // play/paus icon
              GestureDetector(
                onTap: timerProvider.isRunning
                    ? timerProvider.pauseTimer
                    : timerProvider.startTimer,
                child: Container(
                  height: 50,
                  width: 50,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.blue,
                  ),
                  child: timerProvider.isRunning
                      ? const Icon(
                          Icons.pause,
                          size: 40,
                          color: Colors.white,
                        )
                      : const Icon(
                          Icons.play_arrow,
                          size: 40,
                          color: Colors.white,
                        ),
                ),
              ),
              const SizedBox(width: 20),
              // reste time icon
              GestureDetector(
                onTap: timerProvider.resetTimer,
                child: Container(
                  height: 50,
                  width: 50,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.blue,
                  ),
                  child: const Icon(
                    Icons.stop,
                    size: 35,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  // Displays the CupertinoTimerPicker to select the timer duration.
  void _showTimePicker(BuildContext context, TimerProvider timerProvider) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return SizedBox(
          height: 300,
          child: CupertinoTimerPicker(
            mode: CupertinoTimerPickerMode.hms,
            initialTimerDuration:
                Duration(seconds: timerProvider.remainingTime),
            onTimerDurationChanged: (Duration newDuration) {
              if (newDuration.inSeconds > 0) {
                timerProvider.setTime(newDuration.inSeconds);
              }
            },
          ),
        );
      },
    );
  }

  // Formats the remaining time into a readable string (HH:MM:SS).
  String _formatTime(int totalSeconds) {
    int hours = totalSeconds ~/ 3600;
    int minutes = (totalSeconds % 3600) ~/ 60;
    int seconds = totalSeconds % 60;

    return '${hours.toString().padLeft(2, '0')}:${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}';
  }
}
