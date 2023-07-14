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
  TextEditingController nameSurnameController = TextEditingController();
  TextEditingController phoneRegisterController = TextEditingController();
  TextEditingController emailRegisterController = TextEditingController();
  TextEditingController passwordRegisterController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final cityProvider = Provider.of<CityDistrictProvider>(context);
    //final functionProvider = Provider.of<FunctionProvider>(context);
    bool visible = cityProvider.isCitySelected;
    final userData = {
      "phoneNumber": phoneRegisterController.text,
      "password": passwordRegisterController.text
    };
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/vtz_background.png"),
                fit: BoxFit.cover)),
        child: Form(
          key: widget._formKey,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32),
            child: Stack(children: [
              Column(mainAxisAlignment: MainAxisAlignment.center, children: [
                SizedBox(width: 250, child: Image.asset("assets/vtz_logo.png")),
                NameSurnameInput(
                  inputText: 'Name',
                  controller: nameSurnameController,
                ),
                NameSurnameInput(
                  inputText: 'Surname',
                  controller: nameSurnameController,
                ),
                PhoneInput(
                  controller: phoneRegisterController,
                ),
                EmailInput(controller: emailRegisterController),
                PasswordInput(controller: passwordRegisterController),
                Padding(
                  padding: const EdgeInsets.only(top: 24),
                  child: CupertinoButton(
                    padding: EdgeInsets.fromLTRB(16, 0, 16, 0),
                    borderRadius: BorderRadius.circular(8.0),
                    color: Colors.blue,
                    onPressed: () =>
                        FunctionProvider(context: context).showPicker(),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          textAlign: TextAlign.start,
                          cityProvider.selectedCity,
                          style: const TextStyle(color: Colors.white),
                        ),
                        const Icon(
                          Icons.keyboard_arrow_down,
                          color: Colors.white,
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 24),
                Visibility(
                  visible: visible,
                  child: CupertinoButton(
                    padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
                    color: Colors.blue,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          cityProvider.selectedDistrict,
                          style: const TextStyle(color: Colors.white),
                        ),
                        Icon(Icons.keyboard_arrow_down)
                      ],
                    ),
                    onPressed: () =>
                        FunctionProvider(context: context).showPicker2(),
                  ),
                ),
                const SizedBox(height: 24),
                ElevatedButton(
                    onPressed: () {
                      if (widget._formKey.currentState!.validate()) {}
                    },
                    child: const Text("Register")),
                TextButton(
                    onPressed: () {
                      Navigator.of(context).pop(MaterialPageRoute(
                          builder: (context) => LoginPageView()));
                    },
                    child: const Text("Login"))
              ]),
            ]),
          ),
        ),
      ),
    );
  }
}
