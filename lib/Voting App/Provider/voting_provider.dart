import 'dart:async';
import 'package:flutter/material.dart';

import '../Model/model.dart';

class VotingProvider with ChangeNotifier {
  List<Candidate> _candidates = [
    Candidate(id: "1", name: "Candidate 1"),
    Candidate(id: "2", name: "Candidate 2"),
    Candidate(id: "3", name: "Candidate 3"),
    Candidate(id: "4", name: "Candidate 4"),
  ];
  String? selectedCandidateId;

  List<Candidate> get candidates => _candidates;

  void vote(String candidateId) {
    _candidates = _candidates.map((candidate) {
      if (candidate.id == candidateId) {
        candidate.votes += 1;
      }
      return candidate;
    }).toList();

    selectedCandidateId = candidateId;
    notifyListeners();
    Timer(const Duration(seconds: 1), () {
      selectedCandidateId = null;
      notifyListeners();
    });
  }

  List<Candidate> get winners {
    if (_candidates.isEmpty) return [];

    int highestVotes =
        _candidates.map((c) => c.votes).reduce((a, b) => a > b ? a : b);

    if (highestVotes == 0) return [];

    List<Candidate> topCandidates =
        _candidates.where((c) => c.votes == highestVotes).toList();

    return topCandidates;
  }

  bool get isTie => winners.length > 1;
}
