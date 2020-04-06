import 'package:flutter/material.dart';
import 'package:personal_expenses/model/transaction.dart';
import 'package:personal_expenses/widgets/transaction_item.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  final Function deleteTransaction;

  TransactionList({this.transactions, this.deleteTransaction});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      child: transactions.isEmpty
          ? LayoutBuilder(
              builder: (ctx, constrains) {
                return Column(
                  children: <Widget>[
                    Text(
                      'No transactions yet!',
                      style: Theme.of(context).textTheme.title,
                    ),
                    SizedBox(
                      height: constrains.maxHeight * 0.15,
                    ),
                    Container(
                      height: constrains.maxHeight * 0.65,
                      child: Image.asset(
                        'assets/images/waiting.png',
                        fit: BoxFit.contain,
                      ),
                    ),
                  ],
                );
              },
            )
          : Padding(
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: ListView.builder(
                itemCount: transactions.length,
                itemBuilder: (context, index) {
                  return TransactionItem(
                    transaction: transactions[index],
                    deleteTransaction: deleteTransaction,
                  );
                },
              ),
            ),
    );
  }
}
