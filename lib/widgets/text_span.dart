import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../pages/terms_page.dart';

class TermText extends StatelessWidget {
  const TermText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        text: 'Accept ',
        style: TextStyle(fontSize: 15),
        children: <TextSpan>[
          TextSpan(
            text: 'user terms',
            style: TextStyle(color: Colors.blue),
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => const TermsPage()));
              },
          ),
        ],
      ),
    );
  }
}
