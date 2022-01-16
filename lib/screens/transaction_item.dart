import 'package:bytebank/models/Transaction.dart';
import 'package:flutter/material.dart';

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
