import 'package:bytebank/screens/transaction_list.dart';
import 'package:flutter/material.dart';

void main() => runApp(ByteBankApp());

class ByteBankApp extends StatelessWidget {
  const ByteBankApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        appBarTheme: AppBarTheme(backgroundColor: Colors.green[900]),
        primaryColor: Colors.green[900],
        accentColor: Colors.blueAccent[700],
      ),
      home: TransactionList(),
    );
  }
}
