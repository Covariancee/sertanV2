import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sertan/pages/login_page.dart';
import 'package:flutter/cupertino.dart';
import '../provider/city_and_district_provider.dart';
import '../widgets/text_input.dart';
import '../provider/function_provider.dart';

class RegisterPageView extends StatefulWidget {
  RegisterPageView({super.key});

  @override
  State<RegisterPageView> createState() => _RegisterPageViewState();
  final _formKey = GlobalKey<FormState>();
}

class _RegisterPageViewState extends State<RegisterPageView> {
  @override
  Widget build(BuildContext context) {
    final cityProvider = Provider.of<CityDistrictProvider>(context);
    final functionProvider = Provider.of<FunctionProvider>(context);

    return Scaffold(
      body: ListView(children: [
        Form(
          key: widget._formKey,
          child: Column(children: [
            RegisterInput(
              inputText: 'Name',
            ),
            RegisterInput(
              inputText: 'Surname',
            ),
            RegisterInput(
              inputText: 'Phone Number',
            ),
            RegisterInput(
              inputText: 'Email',
            ),
            RegisterInput(
              inputText: 'Password',
            ),
            CupertinoButton(
                onPressed:  () =>
                    FunctionProvider(context: context).showPicker(),
                child: Text(cityProvider.selectedCity)),
            CupertinoButton(
                child: Text(cityProvider.selectedDistrict), onPressed: () {}),
            ElevatedButton(onPressed: () {}, child: const Text("Register")),
            TextButton(
                onPressed: () async{
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => LoginPageView()));
                },
                child: const Text("Login"))
          ]),
        ),
      ]),
    );
  }
}
