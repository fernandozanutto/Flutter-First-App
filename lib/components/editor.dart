import 'package:flutter/material.dart';

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
