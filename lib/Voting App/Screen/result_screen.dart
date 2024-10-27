import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Provider/voting_provider.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final votingProvider = Provider.of<VotingProvider>(context);
    final isTie = votingProvider.isTie;
    final winners = votingProvider.winners;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text("Voting Results"),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: votingProvider.candidates.length,
              itemBuilder: (context, index) {
                final candidate = votingProvider.candidates[index];
                final isWinner = winners.contains(candidate);
                return ListTile(
                  title: Text(
                    candidate.name,
                    style: TextStyle(
                      fontWeight:
                          isWinner ? FontWeight.bold : FontWeight.normal,
                      color: isWinner ? Colors.green : Colors.black,
                    ),
                  ),
                  trailing: Text("Votes: ${candidate.votes}"),
                  subtitle: isWinner
                      ? Text(isTie ? "Tie for Winner" : "Winner")
                      : null,
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Text(
              isTie ? "It's a tie!" : "",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color:  isTie? Colors.red: Colors.green 
              ),
            ),
          ),
          const Spacer(),
        ],
      ),
    );
  }
}
