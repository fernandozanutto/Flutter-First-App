import 'package:flutter/material.dart';

void main() => runApp(
      MaterialApp(
        home: Scaffold(
          appBar: AppBar(
            title: const Text("Transferências"),
          ),
          floatingActionButton: FloatingActionButton(
            child: const Icon(Icons.add),
            onPressed: () => {},
          ),
          body: TransactionList()
        ),
      ),
    );


class TransactionList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TransactionItem(Transaction(123.00, 1234)),
        TransactionItem(Transaction(3.00, 124)),
        TransactionItem(Transaction(1203.00, 1234)),
        TransactionItem(Transaction(13.00, 123)),
        TransactionItem(Transaction(123.50, 234)),
      ],
    );
  }
}


class TransactionItem extends StatelessWidget {

  final Transaction transaction;

  TransactionItem(this.transaction);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 1.0,
      child: ListTile(
        title: Text(transaction.value.toString()),
        subtitle: Text(transaction.account.toString()),
        leading: const Icon(Icons.monetization_on),
      ),
    );
  }
}


class Transaction {
  final double value;
  final int account;

  Transaction(this.value, this.account);
}
