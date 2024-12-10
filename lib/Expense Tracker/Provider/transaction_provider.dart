import 'package:flutter/material.dart';
import 'package:flutter_provider/Expense%20Tracker/Model/transaction.dart';

class TransactionProvider with ChangeNotifier {
  final List<Transaction> _transactions = [];

  List<Transaction> get transaction => _transactions;
  // for calcuationg the total income
  double get totalIncome => _transactions
      .where((tx) => tx.isIncome)
      .fold(0, (sum, tx) => sum + tx.amount);
  // for calcuationg the total expenses
  double get totalExpenses => _transactions
      .where((tx) => !tx.isIncome)
      .fold(0, (sum, tx) => sum + tx.amount);
  // for the remaining balance
  double get remainingBalance => totalIncome - totalExpenses;
  // method to add an new transation
  void addTransaction(String title, double amount, bool isIncome) {
    final newTransction = Transaction(
      id: DateTime.now().toString(),
      title: title,
      amount: amount,
      date: DateTime.now(),
      isIncome: isIncome,
    );
    _transactions.insert(0, newTransction);
    notifyListeners();
    // method to remove
  }
  // method to remove
  void removeTransaction(String id) {
    _transactions.removeWhere((tx) => tx.id == id);
    notifyListeners();
  }
}
