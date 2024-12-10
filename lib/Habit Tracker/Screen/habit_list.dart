import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../Provider/habit_tracker_provider.dart';

// Main Habit List Screen widget
class HabitListScreen extends StatelessWidget {
  const HabitListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Access the HabitProvider instance to manage habits data and notify changes.
    final habitProvider = Provider.of<HabitProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Habit Tracker'), // Title for the app bar
        actions: [
          // A refresh button to reset all habits' completion status
          IconButton(
            icon: const Icon(Icons.refresh), // Refresh icon
            onPressed: () {
              // Call the resetHabits method in the HabitProvider
              // with `listen: false` to avoid rebuilding this widget
              Provider.of<HabitProvider>(context, listen: false).resetHabits();
            },
          ),
        ],
      ),
      body: Column(
        children: [
          // Progress Indicator Section
          Padding(
            padding:
                const EdgeInsets.all(16.0), // Add padding around the section
            child: Column(
              crossAxisAlignment:
                  CrossAxisAlignment.start, // Align items to the start
              children: [
                // Display the total completed habits out of total habits
                Text(
                  'Daily Progress: ${habitProvider.completedHabits}/${habitProvider.totalHabits} habits completed',
                  style: const TextStyle(
                      fontSize: 16), // Font size for readability
                ),
                const SizedBox(height: 8), // Add vertical spacing
                // Linear progress bar showing the percentage of habits completed
                LinearProgressIndicator(
                  value: habitProvider.totalHabits > 0
                      ? habitProvider.completedHabits /
                          habitProvider.totalHabits
                      : 0, // Avoid division by zero
                ),
                const SizedBox(height: 8), // Add vertical spacing
                // Display completion percentage, formatted to 1 decimal place
                Text(
                  'Completion Percentage: ${habitProvider.completionPercentage.toStringAsFixed(1)}%',
                  style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold), // Bold styling
                ),
              ],
            ),
          ),
          // Habit List Section
          Expanded(
            child: ListView.builder(
              itemCount:
                  habitProvider.habits.length, // Number of habits to display
              itemBuilder: (ctx, index) {
                // Get the habit at the current index
                final habit = habitProvider.habits[index];
                return GestureDetector(
                  //  transactionProvider.removeTransaction(tx.id);
                  onLongPress: () {
                    habitProvider.removeHabit(habit.id);
                  },
                  child: ListTile(
                    title: Text(habit.title), // Display the habit title
                    trailing: Checkbox(
                      // Checkbox to toggle habit completion status
                      value: habit.isCompleted, // Bind checkbox to habit status
                      onChanged: (_) {
                        // Call toggleHabit method to update the habit's status
                        habitProvider.toggleHabit(habit.id);
                      },
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
      // Floating Action Button to add new habits
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Show a dialog to input a new habit
          showDialog(
            context: context,
            builder: (ctx) {
              String newHabitTitle =
                  ''; // Variable to store the entered habit title
              return AlertDialog(
                title: const Text('Add Habit'), // Dialog title
                content: TextField(
                  // Input field for the habit title
                  onChanged: (value) =>
                      newHabitTitle = value, // Update variable on input
                  decoration: const InputDecoration(
                      hintText: 'Habit Title'), // Placeholder text
                ),
                actions: [
                  // Cancel button to close the dialog without adding a habit
                  TextButton(
                    onPressed: () => Navigator.of(ctx).pop(), // Close dialog
                    child: const Text('Cancel'),
                  ),
                  // Add button to create a new habit
                  TextButton(
                    onPressed: () {
                      // Check if input is not empty
                      if (newHabitTitle.isNotEmpty) {
                        habitProvider
                            .addHabit(newHabitTitle); // Add habit to the list
                        Navigator.of(ctx).pop(); // Close dialog
                      }
                    },
                    child: const Text('Add'), // Button text
                  ),
                ],
              );
            },
          );
        },
        child: const Icon(Icons.add), // Icon for the FAB
      ),
    );
  }
}
