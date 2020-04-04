import 'package:flutter/material.dart';

class NewTransaction extends StatefulWidget {
  final Function addTransaction;

  NewTransaction({this.addTransaction});

  @override
  _NewTransactionState createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final titleController = TextEditingController();
  final amountController = TextEditingController();

  void handleSubmit() {
    final enteredTitle = titleController.text;
    final enteredAmount = double.parse(amountController.text);

    if (enteredTitle.isNotEmpty && enteredAmount > 0) {
      widget.addTransaction(enteredTitle, enteredAmount);
      Navigator.of(context).pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: EdgeInsets.all(30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            TextField(
              controller: titleController,
              decoration: InputDecoration(labelText: 'Title'),
              onSubmitted: (_) => handleSubmit(),
            ),
            TextField(
              controller: amountController,
              keyboardType: TextInputType.numberWithOptions(decimal: true),
              decoration: InputDecoration(labelText: 'Amount'),
              onSubmitted: (_) => handleSubmit(),
            ),
            Container(
              height: 70,
              child: Row(
                children: <Widget>[
                  Text(
                    'No date picked!',
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                  FlatButton(
                    onPressed: () {},
                    child: Text(
                      'Pick date',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).primaryColor,
                        fontSize: 16,
                      ),
                    ),
                  )
                ],
              ),
            ),
            RaisedButton(
              color: Theme.of(context).accentColor,
              onPressed: handleSubmit,
              textColor: Theme.of(context).buttonColor,
              child: Text('Add transaction'),
            )
          ],
        ),
      ),
    );
  }
}
