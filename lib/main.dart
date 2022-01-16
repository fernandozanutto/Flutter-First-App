import 'package:flutter/material.dart';

void main() => runApp(ByteBankApp());

class ByteBankApp extends StatelessWidget {
  const ByteBankApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: TransactionList(),
      ),
    );
  }
}

class TransactionForm extends StatelessWidget {
  TransactionForm({Key? key}) : super(key: key);

  final TextEditingController _controllerAccountNumber =
  TextEditingController();
  final TextEditingController _controllerValue = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Criando Transferência"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Editor("Número da conta",
                controller: _controllerAccountNumber, hint: "0000"),
            Editor("Valor",
                controller: _controllerValue,
                hint: "0.00",
                icon: Icons.monetization_on),
            ElevatedButton(
                onPressed: () => _createTransaction(context),
                child: const Text("Confirmar")),
          ],
        ),
      ),
    );
  }

  void _createTransaction(BuildContext context) {
    final value = double.tryParse(_controllerValue.text);
    final accountNumber = int.tryParse(_controllerAccountNumber.text);

    if (value != null && accountNumber != null) {
      final transaction = Transaction(value, accountNumber);

      Navigator.pop<Transaction>(context, transaction);
    }
  }
}

class Editor extends StatelessWidget {
  TextEditingController? controller;
  String label;
  String? hint;
  IconData? icon;

  Editor(this.label, {this.controller, this.hint, this.icon});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
      child: TextField(
        controller: controller,
        style: const TextStyle(fontSize: 24.0),
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
          labelText: label,
          hintText: hint,
          icon: icon != null ? Icon(icon) : null,
        ),
      ),
    );
  }
}

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
            final future = Navigator.push<Transaction>(
                context,
                MaterialPageRoute(builder: (context) {
                  return TransactionForm();
                })
            );

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
        )
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
