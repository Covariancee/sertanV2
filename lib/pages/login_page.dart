import 'package:flutter/material.dart';
import 'package:sertan/pages/register_page.dart';
import '../widgets/text_input.dart';

class LoginPageView extends StatefulWidget {
  LoginPageView({super.key});

  @override
  State<LoginPageView> createState() => _LoginPageViewState();
  final _formKey = GlobalKey<FormState>();
}

class _LoginPageViewState extends State<LoginPageView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(children: [
        Form(
          key: widget._formKey,
          child: Column(children: [
            RegisterInput(
              inputText: 'Phone Number',
            ),
            RegisterInput(
              inputText: 'Password',
            ),
            ElevatedButton(onPressed: () {}, child: const Text("Login")),
            TextButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => RegisterPageView()));
                },
                child: const Text("Register"))
          ]),
        ),
      ]),
    );
  }
}

// ignore: must_be_immutable
