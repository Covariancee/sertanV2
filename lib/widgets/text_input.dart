import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class DefaultInput extends StatefulWidget {
  const DefaultInput(
      {super.key,
      required this.controller,
      required this.validator,
      required this.inputText,
      this.keyboardType});
  final TextEditingController controller;
  final dynamic validator;
  final TextInputType? keyboardType;
  //final maskFormatters;
  final String inputText;

  @override
  State<DefaultInput> createState() => _DefaultInputState();
}

class _DefaultInputState extends State<DefaultInput> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      keyboardType: widget.keyboardType,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      validator: widget.validator,
      decoration: InputDecoration(
        label: Text(widget.inputText),
      ),
    );
  }
}

class PhoneInput extends StatefulWidget {
  const PhoneInput({
    super.key,
    required this.controller,
  });

  final TextEditingController controller;

  @override
  State<PhoneInput> createState() => _PhoneInputState();
}

class _PhoneInputState extends State<PhoneInput> {
  var maskFormatter = MaskTextInputFormatter(
      mask: '+90 (###) ###-##-##',
      filter: {"#": RegExp(r'[0-9]')},
      type: MaskAutoCompletionType.lazy);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: const TextStyle(color: Colors.white),
      controller: widget.controller,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter a valid phone number';
        }
        if (value.length != 19) {
          return 'too short';
        } else {
          return null;
        }
      },
      keyboardType: TextInputType.phone,
      inputFormatters: [maskFormatter],
      decoration: const InputDecoration(
          label: Text(
        'Phone Number',
      )),
    );
  }
}

class PasswordInput extends StatefulWidget {
  const PasswordInput(
      {super.key,
      required this.controller,
      required this.validator,
      required this.inputText,
      this.keyboardType});

  final TextEditingController controller;
  final dynamic validator;
  final TextInputType? keyboardType;
  final String inputText;

  @override
  State<PasswordInput> createState() => _PasswordInputState();
}

class _PasswordInputState extends State<PasswordInput> {
  bool _obscureText = true;
  void _toggleObscureText() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'cannot be empty';
        }
        if (value.length <= 5) {
          return 'must be longer than 6';
        }
        if (value.length >= 17) {
          return 'too long';
        }
        {
          return null;
        }
      },
      obscureText: _obscureText,
      decoration: InputDecoration(
          suffixIcon: IconButton(
              onPressed: _toggleObscureText,
              icon: const Icon(Icons.remove_red_eye)),
          label: const Text('Password')),
    );
  }
}
