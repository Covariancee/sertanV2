import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

import '../pages/category_page.dart';

var maskFormatter = MaskTextInputFormatter(
    mask: '+90 (###) ###-##-##',
    filter: {"#": RegExp(r'[0-9]')},
    type: MaskAutoCompletionType.lazy);

///phone number mask

TextEditingController phoneLoginController = TextEditingController();
TextEditingController passwordLoginController = TextEditingController();

///Text editing controller list

authLogin(context) {
  if (phoneLoginController.text == "+90 (555) 555-55-55" &&
      passwordLoginController.text == "123456") {
    Navigator.of(context).push(
        MaterialPageRoute(builder: (context) => const CategoryPageView()));
  } else {
    return showDialog<String>(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        content: const Text('Phone number and password does not match'),
        actions: <Widget>[
          TextButton(
            onPressed: () => Navigator.pop(context, 'Cancel'),
            child: const Text('Cancel'),
          ),
        ],
      ),
    );
  }
}

/// login validation

dynamic loginController = (context, formKey) {
  if (formKey.currentState!.validate()) {
    print(
        "ID: ${phoneLoginController.text} Password: ${passwordLoginController.text}");
    authLogin(context);
  }
};

///
