import 'package:flutter/material.dart';
import '../Widgets/add_transaction_form.dart';
import '../Widgets/summary_card.dart';
import '../Widgets/transaction_list.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Expense Tracker')),
      body: const Column(
        children: [
          SummaryCard(),
          Expanded(child: TransactionList()),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
            context: context,
            builder: (_) => const AddTransactionForm(),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
