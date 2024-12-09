import 'package:flutter/material.dart';
import 'package:flutter_provider/Expense%20Tracker/Widgets/add_transaction.dart';
import 'package:flutter_provider/Expense%20Tracker/Widgets/summeart_card.dart';
import 'package:flutter_provider/Expense%20Tracker/Widgets/transaction_list.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Expense Trackert"),
      ),
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
            builder: (_) => const AddTransaction(),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
