import 'package:flutter/material.dart';

// ignore: must_be_immutable
class RegisterInput extends StatelessWidget {
  RegisterInput({super.key, required this.inputText});
  String inputText;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(label: Text(inputText)),
    );
  }
}
