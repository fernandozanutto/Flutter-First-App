import 'package:bytebank/models/Transaction.dart';
import 'package:bytebank/screens/transaction_form.dart';
import 'package:flutter/material.dart';

class TransactionList extends StatefulWidget {
  final List<Transaction> _list = List.empty(growable: true);

  TransactionList({Key? key}) : super(key: key);

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
            Navigator.push(
              context,
              MaterialPageRoute<Transaction>(builder: (context) {
                return TransactionForm();
              }),
            ).then((receivedTransaction) => updateList(receivedTransaction));
          },
        ),
        body: ListView.builder(
          itemCount: widget._list.length,
          itemBuilder: (context, index) {
            return TransactionItem(widget._list[index]);
          },
        ));
  }

  void updateList(Transaction? receivedTransaction) {
    if (receivedTransaction != null) {
      setState(() {
        widget._list.add(receivedTransaction);
      });
    }
  }
}

class TransactionItem extends StatelessWidget {
  final Transaction transaction;

  const TransactionItem(this.transaction);

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
