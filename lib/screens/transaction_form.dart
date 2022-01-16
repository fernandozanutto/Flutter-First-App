import 'package:bytebank/components/editor.dart';
import 'package:bytebank/models/transaction.dart';
import 'package:flutter/material.dart';

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
