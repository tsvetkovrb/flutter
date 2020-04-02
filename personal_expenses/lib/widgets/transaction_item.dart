import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:personal_expenses/model/transaction.dart';

class TransactionItem extends StatelessWidget {
  final Transaction transaction;

  TransactionItem({this.transaction});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Row(
        children: <Widget>[
          Container(
            margin: EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 15,
            ),
            padding: EdgeInsets.all(10),
            child: Text(
              '\$${transaction.amount.toStringAsFixed(2)}',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
                color: Theme.of(context).primaryColor,
              ),
            ),
            decoration: BoxDecoration(
              border: Border.all(
                color: Theme.of(context).primaryColor,
                width: 2,
              ),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(bottom: 10),
                child: Text(
                  transaction.title,
                  style: Theme.of(context).textTheme.title
                ),
              ),
              Text(
                DateFormat.yMMMd().format(transaction.date),
                style: TextStyle(
                  color: Colors.grey,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
