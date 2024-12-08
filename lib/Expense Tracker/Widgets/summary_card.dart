import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../Provider/transaction_provider.dart';

class SummaryCard extends StatelessWidget {
  const SummaryCard({super.key});

  @override
  Widget build(BuildContext context) {
    final transactionProvider = Provider.of<TransactionProvider>(context);

    return Card(
      margin: const EdgeInsets.all(16),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const Text('Monthly Summary',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                    'Total Income: \$${transactionProvider.totalIncome.toStringAsFixed(2)}'),
                Text(
                    'Total Expense: \$${transactionProvider.totalExpense.toStringAsFixed(2)}'),
              ],
            ),
            const SizedBox(height: 10),
            Text(
              'Remaining Balance: \$${transactionProvider.remainingBalance.toStringAsFixed(2)}',
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
