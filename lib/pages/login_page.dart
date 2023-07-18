import 'package:flutter/material.dart';
import 'package:sertan/pages/category_page.dart';
import 'package:sertan/pages/register_page.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import '../controller/validators.dart';
import '../widgets/text_input.dart';

class LoginPageView extends StatefulWidget {
  LoginPageView({super.key});

  @override
  State<LoginPageView> createState() => _LoginPageViewState();
  final _formKey = GlobalKey<FormState>();
}

class _LoginPageViewState extends State<LoginPageView> {
  var maskFormatter = MaskTextInputFormatter(
      mask: '+90 (###) ###-##-##',
      filter: {"#": RegExp(r'[0-9]')},
      type: MaskAutoCompletionType.lazy);
  @override
  Widget build(BuildContext context) {
    TextEditingController phoneLoginController = TextEditingController();
    TextEditingController passwordLoginController = TextEditingController();
    authLogin() {
      if (phoneLoginController.text == "+90 (555) 555-55-55" &&
          passwordLoginController.text == "123456") {
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => CategoryPageView()));
      } else {
        return showDialog<String>(
            context: context,
            builder: (BuildContext context) => AlertDialog(
                    content:
                        const Text('Phone number and password does not match'),
                    actions: <Widget>[
                      TextButton(
                        onPressed: () => Navigator.pop(context, 'Cancel'),
                        child: const Text('Cancel'),
                      ),
                    ]));
      }
    }

    return Scaffold(
      body: Container(
        height: double.infinity,
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/vtz_background.png"),
                fit: BoxFit.cover)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SingleChildScrollView(
              child: Form(
                key: widget._formKey,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 35),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                            width: 250,
                            child: Image.asset("assets/vtz_logo.png")),
                        PhoneInput(controller: phoneLoginController),
                        DefaultInput(
                            controller: passwordLoginController,
                            validator: passwordValidator,
                            inputText: "Password"),
                        const SizedBox(height: 15),
                        SizedBox(
                          width: 145,
                          child: ElevatedButton(
                              onPressed: () {
                                if (widget._formKey.currentState!.validate()) {
                                  print(
                                      "ID: ${phoneLoginController.text} Password: ${passwordLoginController.text}");
                                  authLogin();
                                }
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
          ],
        ),
      ),
    );
  }
}

// ignore: must_be_immutable
