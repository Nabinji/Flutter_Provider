import 'package:flutter/material.dart';
import '../Model/habit_model.dart';

// HabitProvider is a ChangeNotifier that manages the state of habits in the application.
class HabitProvider with ChangeNotifier {
  // Private list to hold all Habit objects.
  final List<Habit> _habits = [];

  // Getter to retrieve the list of habits.
  List<Habit> get habits => _habits;

  // Getter to retrieve the total number of habits.
  int get totalHabits => _habits.length;

  // Getter to calculate how many habits have been completed.
  int get completedHabits => _habits.where((habit) => habit.isCompleted).length;

  // Getter to calculate the percentage of completed habits.
  double get completionPercentage {
    // If there are no habits, return 0 to avoid division by zero.
    if (totalHabits == 0) return 0;
    // Calculate and return the completion percentage.
    return (completedHabits / totalHabits) * 100;
  }

  // Method to add a new habit.
  void addHabit(String title) {
    // Create a new Habit object with a unique ID and the provided title.
    final newHabit = Habit(
      id: DateTime.now().toString(), // Using current timestamp as a unique ID
      title: title,
    );
    // Add the new habit to the list of habits.
    _habits.add(newHabit);
    // Notify listeners that the state has changed, so UI can update accordingly.
    notifyListeners();
  }

  // Method to toggle the completion status of a habit by its ID.
  void toggleHabit(String id) {
    // Find the index of the habit with the given ID.
    final index = _habits.indexWhere((habit) => habit.id == id);
    if (index != -1) {
      // Check if the habit exists
      // Toggle the isCompleted property of the habit.
      _habits[index].isCompleted = !_habits[index].isCompleted;
      // Notify listeners about the change in state.
      notifyListeners();
    }
  }

  // Method to reset all habits' completion status to false.
  void resetHabits() {
    for (var habit in _habits) {
      habit.isCompleted = false; // Set each habit's completion status to false
    }
    // Notify listeners that all habits have been reset.
    notifyListeners();
  }
  // to delete the items
    void removeHabit(String id) {
    _habits.removeWhere((tx) => tx.id == id);
    notifyListeners();
  }
}
