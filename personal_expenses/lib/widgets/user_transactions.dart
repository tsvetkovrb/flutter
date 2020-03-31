import 'package:flutter/material.dart';
import 'package:personal_expenses/model/transaction.dart';
import 'package:personal_expenses/widgets/new_transaction.dart';
import 'package:personal_expenses/widgets/transaction_list.dart';

class UserTransactions extends StatefulWidget {
  @override
  _UserTransactionsState createState() => _UserTransactionsState();
}

class _UserTransactionsState extends State<UserTransactions> {
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();

  final List<Transaction> _userTransactions = [
    Transaction(
      id: 't1',
      title: 'New Shoes',
      amount: 69.99,
      date: DateTime.now(),
    ),
    Transaction(
      id: 't2',
      title: 'New Phone',
      amount: 899,
      date: DateTime.now(),
    ),
  ];

  void _addTransaction(String transactionTitle, double transactionAmount) {
    final transaction = Transaction(
      amount: transactionAmount,
      date: DateTime.now(),
      id: DateTime.now().toString(),
      title: transactionTitle,
    );
    
    setState(() {
      _userTransactions.add(transaction);
    });
    _amountController.text = '';
    _titleController.text = '';
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        NewTransaction(
          addTransaction: _addTransaction,
        ),
        TransactionList(transactions: _userTransactions),
      ],
    );
  }
}
