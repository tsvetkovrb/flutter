import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NewTransaction extends StatefulWidget {
  final Function addTransaction;

  NewTransaction({this.addTransaction});

  @override
  _NewTransactionState createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();
  DateTime _pickedDate;

  void _handleSubmit() {
    final amountText = _amountController.text;
    if (amountText.isEmpty) {
      return;
    }
    final enteredAmount = double.parse(amountText);
    final enteredTitle = _titleController.text;

    if (enteredTitle.isNotEmpty && enteredAmount >= 0 && _pickedDate != null) {
      widget.addTransaction(enteredTitle, enteredAmount, _pickedDate);
      Navigator.of(context).pop();
    }
  }

  void _openDatePicker() async {
    final date = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2020),
      lastDate: DateTime.now(),
    );
    if (date != null) {
      setState(() {
        _pickedDate = date;
      });
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
              controller: _titleController,
              decoration: InputDecoration(labelText: 'Title'),
              onSubmitted: (_) => _handleSubmit(),
            ),
            TextField(
              controller: _amountController,
              keyboardType: TextInputType.numberWithOptions(decimal: true),
              decoration: InputDecoration(labelText: 'Amount'),
              onSubmitted: (_) => _handleSubmit(),
            ),
            Container(
              height: 70,
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: Text(
                      _pickedDate == null
                          ? 'No date picked!'
                          : 'Picked date: ${DateFormat.yMd().format(_pickedDate)}',
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                  ),
                  FlatButton(
                    onPressed: _openDatePicker,
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
              onPressed: _handleSubmit,
              textColor: Theme.of(context).buttonColor,
              child: Text('Add transaction'),
            )
          ],
        ),
      ),
    );
  }
}
