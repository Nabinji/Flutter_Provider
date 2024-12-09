import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../Provider/transaction_provider.dart';

class TransactionList extends StatelessWidget {
  const TransactionList({super.key});

  @override
  Widget build(BuildContext context) {
    final transactionProvider = Provider.of<TransactionProvider>(context);

    return ListView.builder(
      itemCount: transactionProvider.transaction.length,
      itemBuilder: (ctx, index) {
        final tx = transactionProvider.transaction[index];
        return GestureDetector(
          onLongPress: () {
            transactionProvider.removeTransaction(tx.id);
          },
          child: ListTile(
            title: Text(tx.title),
            subtitle: Text(tx.date.toString()),
            trailing: Text(
              '\$${tx.amount.toStringAsFixed(2)}',
              style: TextStyle(
                color: tx.isIncome ? Colors.green : Colors.red,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        );
      },
    );
  }
}
