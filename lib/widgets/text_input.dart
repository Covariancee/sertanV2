import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

// ignore: must_be_immutable
class NameSurnameInput extends StatefulWidget {
  NameSurnameInput({
    super.key,
    required this.inputText,
    required this.controller,
  });
  String inputText;
  final TextEditingController controller;

  @override
  State<NameSurnameInput> createState() => _NameSurnameInputState();
}

class _NameSurnameInputState extends State<NameSurnameInput> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter valid information';
        } else {
          return null;
        }
      },
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
      style: TextStyle(color: Colors.white),
      controller: widget.controller,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter a valid phone number';
        } else {
          return null;
        }
      },
      keyboardType: TextInputType.phone,
      inputFormatters: [maskFormatter],
      decoration: const InputDecoration(label: Text('Phone Number', )),
    );
  }
}

class EmailInput extends StatefulWidget {
  const EmailInput({
    super.key,
    required this.controller,
  });

  final TextEditingController controller;

  @override
  State<EmailInput> createState() => _EmailInputState();
}

class _EmailInputState extends State<EmailInput> {
  bool _validateEmail(String value) {
    // Regular expression for email validation
    final RegExp emailRegex = RegExp(
      r'^[\w-]+(\.[\w-]+)*@[a-zA-Z0-9-]+(\.[a-zA-Z0-9-]+)*(\.[a-zA-Z]{2,})$',
    );
    return emailRegex.hasMatch(value);
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: TextStyle(color: Colors.white),
      controller: widget.controller,
      validator: (value) {
        if (value == null || value.isEmpty || !_validateEmail(value)) {
          return 'Please enter a valid email';
        } else {
          return null;
        }
      },
      keyboardType: TextInputType.emailAddress,
      decoration: const InputDecoration(label: Text('Email')),
    );
  }
}

class PasswordInput extends StatefulWidget {
  const PasswordInput({
    super.key,
    required this.controller,
  });

  final TextEditingController controller;

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
          return 'Please enter a valid password';
        } else {
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
