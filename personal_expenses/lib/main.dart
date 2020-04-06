import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:personal_expenses/model/transaction.dart';
import 'package:personal_expenses/utils/theme.dart';
import 'package:personal_expenses/widgets/chart.dart';
import 'package:personal_expenses/widgets/new_transaction.dart';
import 'package:personal_expenses/widgets/transaction_list.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Personal expenses',
      theme: customTheme(),
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Transaction> _userTransactions = [
    Transaction(
      amount: 100,
      date: DateTime.now(),
      id: DateTime.now().toString(),
      title: "Test",
    ),
    Transaction(
      amount: 100,
      date: DateTime.now(),
      id: DateTime.now().toString(),
      title: "Test",
    ),
    Transaction(
      amount: 100,
      date: DateTime.now(),
      id: DateTime.now().toString(),
      title: "Test",
    ),
    Transaction(
      amount: 100,
      date: DateTime.now(),
      id: DateTime.now().toString(),
      title: "Test",
    ),
    Transaction(
      amount: 100,
      date: DateTime.now(),
      id: DateTime.now().toString(),
      title: "Test",
    ),
  ];
  bool _isChartShowing = false;

  List<Transaction> get _recentTransactions {
    return _userTransactions.where((tx) {
      return tx.date.isAfter(
        DateTime.now().subtract(
          Duration(days: 7),
        ),
      );
    }).toList();
  }

  void _addTransaction(
      String transactionTitle, double transactionAmount, DateTime pickedDate) {
    final transaction = Transaction(
      amount: transactionAmount,
      date: pickedDate,
      id: DateTime.now().toString(),
      title: transactionTitle,
    );

    setState(() {
      _userTransactions.add(transaction);
    });
  }

  void _deleteTransaction(String id) {
    setState(() {
      _userTransactions.removeWhere((transaction) => transaction.id == id);
    });
  }

  void _startAddNewTransaction(BuildContext ctx) {
    showModalBottomSheet(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      backgroundColor: Colors.white,
      context: ctx,
      builder: (_) {
        return NewTransaction(
          addTransaction: _addTransaction,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final isLandscape = mediaQuery.orientation == Orientation.landscape;
    final PreferredSizeWidget appBar = Platform.isIOS
        ? CupertinoNavigationBar(
            middle: Text('Personal expenses'),
            trailing: GestureDetector(
              onTap: () => _startAddNewTransaction(context),
              child: Icon(CupertinoIcons.add),
            ),
          )
        : AppBar(
            title: Text('Personal expenses'),
            actions: <Widget>[
              IconButton(
                icon: Icon(Icons.add),
                onPressed: () => _startAddNewTransaction(context),
              )
            ],
          );

    final txListContainer = Container(
      height: (mediaQuery.size.height -
              appBar.preferredSize.height -
              mediaQuery.padding.top) *
          0.7,
      child: TransactionList(
        transactions: _userTransactions,
        deleteTransaction: _deleteTransaction,
      ),
    );

    final appBody = SingleChildScrollView(
      child: SafeArea(
        child: Column(
          children: <Widget>[
            if (isLandscape)
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'Show chart',
                    style: Theme.of(context).textTheme.title,
                  ),
                  Switch.adaptive(
                    activeColor: Theme.of(context).accentColor,
                    value: _isChartShowing,
                    onChanged: (val) {
                      setState(() {
                        _isChartShowing = val;
                      });
                    },
                  )
                ],
              ),
            if (!isLandscape)
              Container(
                height: (mediaQuery.size.height -
                        appBar.preferredSize.height -
                        mediaQuery.padding.top) *
                    0.3,
                child: Chart(
                  recentTransactions: _recentTransactions,
                ),
              ),
            if (!isLandscape) txListContainer,
            if (isLandscape)
              _isChartShowing
                  ? Container(
                      height: (mediaQuery.size.height -
                              appBar.preferredSize.height -
                              mediaQuery.padding.top) *
                          0.7,
                      child: Chart(
                        recentTransactions: _recentTransactions,
                      ),
                    )
                  : txListContainer
          ],
        ),
      ),
    );

    return Platform.isIOS
        ? CupertinoPageScaffold(
            child: appBody,
            navigationBar: appBar,
          )
        : Scaffold(
            appBar: appBar,
            body: appBody,
            floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
            floatingActionButton: Platform.isIOS
                ? Container()
                : FloatingActionButton(
                    child: Icon(Icons.add),
                    onPressed: () => _startAddNewTransaction(context),
                  ),
          );
  }
}
