import 'package:flutter/material.dart';

Future<void> alertDialog(context, String alertText) async {
  return showDialog<void>(
    context: context,
    barrierDismissible: false, // user must tap button!
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text('Error '),
        content: Text(alertText),
        actions: <Widget>[
          TextButton(
            child: const Text('okay'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}
