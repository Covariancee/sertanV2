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
    TextEditingController phoneLoginController = TextEditingController();
    TextEditingController passwordLoginController = TextEditingController();

    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/vtz_background.png"),
                fit: BoxFit.cover)),
        child: Form(
          key: widget._formKey,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 35),
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              SizedBox(width: 250, child: Image.asset("assets/vtz_logo.png")),
              PhoneInput(controller: phoneLoginController),
              PasswordInput(controller: passwordLoginController),
              const SizedBox(height: 15),
              SizedBox(
                width: 145,
                child: ElevatedButton(
                    onPressed: () {
                      if (widget._formKey.currentState!.validate()) ;
                    },
                    child: const Text("Login")),
              ),
              TextButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => RegisterPageView()));
                  },
                  child: const Text(
                    "Register",
                    style: TextStyle(
                        color: Colors.white,
                        decoration: TextDecoration.underline),
                  ))
            ]),
          ),
        ),
      ),
    );
  }
}

// ignore: must_be_immutable
