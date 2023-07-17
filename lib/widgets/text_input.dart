import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class NameInput extends StatefulWidget {
  const NameInput({
    super.key,
    required this.controller,
  });

  final TextEditingController controller;

  @override
  State<NameInput> createState() => _NameInputState();
}

class _NameInputState extends State<NameInput> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'cannot be empty';
        }
        if (value.length <= 1) {
          return 'must be longer than 2';
        }
        if (value.length >= 17) {
          return 'too long';
        }
        {
          return null;
        }
      },
      decoration: const InputDecoration(
        label: Text('Name'),
      ),
    );
  }
}

class SurnameInput extends StatefulWidget {
  const SurnameInput({
    super.key,
    required this.controller,
  });

  final TextEditingController controller;

  @override
  State<SurnameInput> createState() => _SurnameInputState();
}

class _SurnameInputState extends State<SurnameInput> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'cannot be empty';
        }
        if (value.length <= 1) {
          return 'must be longer than 2';
        }
        if (value.length >= 17) {
          return 'too long';
        }
        {
          return null;
        }
      },
      decoration: const InputDecoration(
        label: Text('Surname'),
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
      style: const TextStyle(color: Colors.white),
      controller: widget.controller,
      validator: (value) {
        if (value == null || value.isEmpty || !_validateEmail(value)) {
          return 'Please enter a valid email';
        }
        if (value.length >= 35) {
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
