import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'result_screen.dart';
import '../Provider/voting_provider.dart';

class VotingScreen extends StatelessWidget {
  const VotingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Accessing the VotingProvider instance to get candidates and handle voting logic.
    final votingProvider = Provider.of<VotingProvider>(context);

    return Scaffold(
      backgroundColor: Colors.blue[100],
      appBar: AppBar(
        title: const Text('Vote for a Candidate'),
        backgroundColor: Colors.blue[100],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              // Getting the number of candidates to build the list.
              itemCount: votingProvider.candidates.length,
              itemBuilder: (context, index) {
                // Accessing each candidate from the candidates list by index.
                final candidate = votingProvider.candidates[index];

                // Checks if the candidate was recently voted for to change the button color.
                final isVote =
                    votingProvider.selectedCandidateId == candidate.id;

                return ListTile(
                  title: Text(candidate.name),

                  // The voting button for each candidate.
                  trailing: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: isVote ? Colors.green : Colors.white,
                    ),
                    // Triggered when the "Vote" button is pressed.
                    onPressed: () {
                      // Calls vote function to increment vote.
                      votingProvider.vote(candidate.id);
                    },
                    child: Text(
                      'Vote',
                      style: TextStyle(
                        // Text color changes based on the vote status for better visibility.
                        color: isVote ? Colors.white : Colors.black,
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          // Button to navigate to the ResultScreen to view the voting results.
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const ResultScreen()),
              );
            },
            child: const Text('View Results'),
          ),
          const Spacer(),
          const Spacer(),
        ],
      ),
    );
  }
}
