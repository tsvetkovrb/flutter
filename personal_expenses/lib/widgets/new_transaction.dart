import 'package:flutter/material.dart';

class NewTransaction extends StatelessWidget {
  final TextEditingController titleController;
  final TextEditingController amountController;
  final Function addTransaction;

  NewTransaction(
      {this.titleController, this.amountController, this.addTransaction});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            TextField(
              controller: titleController,
              decoration: InputDecoration(labelText: 'Title'),
            ),
            TextField(
              controller: amountController,
              decoration: InputDecoration(labelText: 'Amount'),
            ),
            FlatButton(
              onPressed: addTransaction,
              textColor: Colors.blue,
              child: Text('Add transaction'),
            )
          ],
        ),
      ),
    );
  }
}
