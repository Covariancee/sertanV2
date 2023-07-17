import 'package:flutter/material.dart';

class TermsPage extends StatelessWidget {
  const TermsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'READ THIS',
              style: TextStyle(color: Colors.black),
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text('accept'))
          ],
        ),
      ),
    );
  }
}
