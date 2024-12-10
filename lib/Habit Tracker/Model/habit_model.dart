class Habit {
  final String id;
  final String title;
  bool isCompleted;

  Habit({
    required this.id,
    required this.title,
    this.isCompleted = false,
  });
}
