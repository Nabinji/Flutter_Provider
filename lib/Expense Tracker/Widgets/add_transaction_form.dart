import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../Provider/transaction_provider.dart';

// The AddTransactionForm widget allows users to input transaction details
class AddTransactionForm extends StatefulWidget {
  const AddTransactionForm({super.key});

  @override
  _AddTransactionFormState createState() => _AddTransactionFormState();
}

// State class for AddTransactionForm
class _AddTransactionFormState extends State<AddTransactionForm> {
  // Controllers for text fields to capture user input
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();

  // Boolean to track if the transaction is income or expense
  bool _isIncome = true;

  // Method to handle form submission
  void _submitData() {
    // Retrieve title and amount from controllers
    final title = _titleController.text;
    final amount = double.tryParse(_amountController.text) ?? 0;

    // Validate input: title should not be empty and amount should be greater than zero
    if (title.isEmpty || amount <= 0) return;

    // Use the TransactionProvider to add the new transaction
    Provider.of<TransactionProvider>(context, listen: false)
        .addTransaction(title, amount, _isIncome);

    // Close the form after submission
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0), // Padding around the form
      child: Column(
        crossAxisAlignment:
            CrossAxisAlignment.stretch, // Stretch children to fill the width
        children: [
          // TextField for entering the transaction title
          TextField(
            controller: _titleController,
            decoration: const InputDecoration(
                labelText: 'Title'), // Label for the field
          ),
          // TextField for entering the transaction amount
          TextField(
            controller: _amountController,
            decoration: const InputDecoration(
                labelText: 'Amount'), // Label for the field
            keyboardType:
                TextInputType.number, // Numeric keyboard for amount input
          ),
          // Row containing switch to toggle between income and expense
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Income',
                style: TextStyle(
                  color: _isIncome == true
                      ? Colors.green
                      : Colors.black, // Change color based on state
                ),
              ),
              Switch(
                value:
                    _isIncome, // Current state of the switch (income/expense)
                onChanged: (val) {
                  setState(() {
                    _isIncome = val; // Update state when switch is toggled
                  });
                },
              ),
              Text(
                'Expense',
                style: TextStyle(
                  color: _isIncome == false
                      ? Colors.red
                      : Colors.black, // Change color based on state
                ),
              ),
            ],
          ),
          // Button to submit the transaction data
          ElevatedButton(
            onPressed: _submitData, // Call submit method on press
            child: const Text(
              'Add Transaction', // Button label
            ),
          ),
        ],
      ),
    );
  }
}
