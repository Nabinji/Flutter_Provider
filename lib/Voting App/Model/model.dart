class Candidate {
  final String id;
  final String name;
  int votes;

  Candidate({
    required this.id,
    required this.name,
    this.votes = 0,
  });
}
