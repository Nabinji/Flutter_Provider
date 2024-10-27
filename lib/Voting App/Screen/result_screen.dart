import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Provider/voting_provider.dart';


class ResultScreen extends StatelessWidget {
  const ResultScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Accessing the VotingProvider instance to get the results.
    final votingProvider = Provider.of<VotingProvider>(context);

    // Boolean that checks if there is a tie among the top candidates.
    final isTie = votingProvider.isTie;

    // List of candidates who have the highest votes (could be a tie or a single winner).
    final winners = votingProvider.winners;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Voting Results'),
        backgroundColor: Colors.white,
      ),
      body: Column(
        children: [
          // Expanded widget to fill available space with the ListView.
          Expanded(
            child: ListView.builder(
              // Getting the number of candidates to build the list.
              itemCount: votingProvider.candidates.length,
              itemBuilder: (context, index) {
                // Accessing each candidate from the candidates list by index.
                final candidate = votingProvider.candidates[index];

                // Check if the candidate is one of the winners to highlight them.
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
                  // Displaying the number of votes for the candidate
                  trailing: Text('Votes: ${candidate.votes}'),
                  // "Winner" or "Tied for Winner" based on the result.
                  subtitle: isWinner
                      ? Text(isTie ? 'Tied for Winner' : 'Winner')
                      : null,
                );
              },
            ),
          ),
          // Display a message if there is a tie among the top candidates.

          Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                isTie ? 'It\'s a tie!' : "Winner",
                style:  TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color:isTie ? Colors.red: Colors.green),
                textAlign: TextAlign.center,
              )),
          const Spacer(),
        ],
      ),
    );
  }
}
