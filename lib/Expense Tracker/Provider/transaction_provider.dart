import 'package:flutter/material.dart';
import '../Model/transaction.dart';

// The TransactionProvider class manages a list of transactions
// and provides functionalities to add, remove, and calculate totals.
class TransactionProvider with ChangeNotifier {
  // Private list to store all transactions
  final List<Transaction> _transactions = [];

  // Public getter to access the list of transactions
  List<Transaction> get transactions => _transactions;

  // Getter to calculate total income from the transactions
  double get totalIncome => _transactions
      .where((tx) => tx.isIncome) // Filter for income transactions
      .fold(0, (sum, tx) => sum + tx.amount); // Sum their amounts

  // Getter to calculate total expenses from the transactions
  double get totalExpense => _transactions
      .where((tx) => !tx.isIncome) // Filter for expense transactions
      .fold(0, (sum, tx) => sum + tx.amount); // Sum their amounts

  // Getter to calculate the remaining balance (income - expenses)
  double get remainingBalance => totalIncome - totalExpense;

  // Method to add a new transaction
  void addTransaction(String title, double amount, bool isIncome) {
    // Create a new transaction object with a unique ID and current date
    final newTransaction = Transaction(
      id: DateTime.now().toString(), // Unique ID based on timestamp
      title: title,
      amount: amount,
      date: DateTime.now(), // Current date/time for the transaction
      isIncome: isIncome, // Indicates if it's an income or expense
    );

    // Add the new transaction to the beginning of the list
    _transactions.insert(0, newTransaction);

    // Notify listeners that the data has changed, prompting UI updates
    notifyListeners();
  }

  // Method to remove a transaction by its unique ID
  void removeTransaction(String id) {
    // Remove the transaction with the matching ID from the list
    _transactions.removeWhere((tx) => tx.id == id);

    // Notify listeners that the data has changed, prompting UI updates
    notifyListeners();
  }
}
