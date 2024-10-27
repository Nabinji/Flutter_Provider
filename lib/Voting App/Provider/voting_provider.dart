import 'dart:async';
import 'package:flutter/material.dart';
import '../Model/model.dart';

class VotingProvider with ChangeNotifier {
  // List of candidates initialized with sample data.
  List<Candidate> _candidates = [
    Candidate(id: '1', name: 'Candidate 1'),
    Candidate(id: '2', name: 'Candidate 2'),
    Candidate(id: '3', name: 'Candidate 3'),
    Candidate(id: '4', name: 'Candidate 4'),
  ];

  // it's for to  Stores the ID of the selected candidate.
  String? selectedCandidateId;

  // Public getter for accessing the list of candidates.
  List<Candidate> get candidates => _candidates;

  // Function to add a vote to a candidate identified by candidateId.
  void vote(String candidateId) {
    // Map over the list and increment the vote count for the selected candidate.
    _candidates = _candidates.map((candidate) {
      if (candidate.id == candidateId) {
        candidate.votes += 1;
      }
      return candidate;
    }).toList();

    // Mark the candidate as selected (used to change button color temporarily).
    selectedCandidateId = candidateId;
    notifyListeners(); // Notify listeners (e.g., UI) of changes.

    // Reset selectedCandidateId after 1 second to change the button color back.
    Timer(const Duration(seconds: 1), () {
      selectedCandidateId = null;
      notifyListeners(); // Notify listeners to update the UI.
    });
  }

  // Getter to return the list of candidates with the highest votes (i.e., potential winners).
  List<Candidate> get winners {
    if (_candidates.isEmpty) return [];

    // Find the highest vote count among all candidates.
    int highestVotes =
        _candidates.map((c) => c.votes).reduce((a, b) => a > b ? a : b);

    // If all candidates have zero votes, return an empty list (no winners).
    if (highestVotes == 0) return [];

    // Return candidates with the highest vote count.
    List<Candidate> topCandidates =
        _candidates.where((c) => c.votes == highestVotes).toList();

    return topCandidates;
  }

  // Boolean to determine if there is a tie (i.e., more than one candidate has the highest votes).
  bool get isTie => winners.length > 1;
}
