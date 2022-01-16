import 'package:bytebank/models/Transaction.dart';
import 'package:bytebank/screens/transaction_form.dart';
import 'package:bytebank/screens/transaction_item.dart';
import 'package:flutter/material.dart';

class TransactionList extends StatefulWidget {
  final List<Transaction> _list = List.empty(growable: true);

  @override
  State<StatefulWidget> createState() {
    return TransactionListState();
  }
}

class TransactionListState extends State<TransactionList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Transferências"),
        ),
        floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.add),
          onPressed: () {
            final future = Navigator.push<Transaction>(context,
                MaterialPageRoute(builder: (context) {
              return TransactionForm();
            }));

            future.then((receivedTransaction) {
              if (receivedTransaction != null) {
                setState(() {
                  widget._list.add(receivedTransaction);
                });
              }
            });
          },
        ),
        body: ListView.builder(
          itemCount: widget._list.length,
          itemBuilder: (context, index) {
            return TransactionItem(widget._list[index]);
          },
        ));
  }
}
