import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sertan/pages/login_page.dart';
import '../city_and_district_list.dart';
import 'package:sertan/pages/terms_page.dart';
import 'package:sertan/widgets/custom_cupertino_button.dart';
import '../controller/register_controller.dart';
import '../controller/validators.dart';
import '../provider/city_and_district_provider.dart';
import '../widgets/text_input.dart';

class RegisterPageView extends StatefulWidget {
  RegisterPageView({
    super.key,
  });

  @override
  State<RegisterPageView> createState() => _RegisterPageViewState();
  final _formKey = GlobalKey<FormState>();
}

class _RegisterPageViewState extends State<RegisterPageView> {
  @override
 

  Widget build(BuildContext context) {
    final cityProvider = Provider.of<CityDistrictProvider>(context);
    bool visible = cityProvider.isCitySelected;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        height: double.infinity,
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/vtz_background.png"),
                fit: BoxFit.cover)),
        child: SingleChildScrollView(
          child: Form(
            key: widget._formKey,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32),
              child: Stack(
                children: [
                  Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                            width: 200,
                            child: Image.asset("assets/vtz_logo.png")),
                        DefaultInput(
                            controller: nameController,
                            validator: nameSurnameValidator,
                            inputText: "Name"),
                        DefaultInput(
                            controller: surnameController,
                            validator: nameSurnameValidator,
                            inputText: "Surname"),
                        PhoneInput(controller: phoneRegisterController),
                        DefaultInput(
                            controller: emailController,
                            keyboardType: TextInputType.emailAddress,
                            //maskFormatters: maskFormatter,
                            validator: emailValidator,
                            inputText: "E-mail"),
                        DefaultInput(
                            controller: passwordRegisterController,
                            //maskFormatters: maskFormatter,
                            validator: passwordValidator,
                            inputText: "Password"),
                        Padding(
                          padding: const EdgeInsets.only(top: 24),
                          child: CustomCupertinoButton(
                              selectedAny: cityProvider.selectedCity,
                              generateListVar: cities,
                              setSelectedAny: (value) =>
                                  cityProvider.setSelectedCity = cities[value]),
                        ),
                        const SizedBox(height: 24),
                        Visibility(
                            visible: visible,
                            child: CustomCupertinoButton(
                                selectedAny: cityProvider.selectedDistrict,
                                generateListVar:
                                    districts[cityProvider.selectedCity],
                                setSelectedAny: (value) =>
                                    cityProvider.setSelectedDistrict =
                                        districts[cityProvider.selectedCity]![
                                            value])),
                        const SizedBox(height: 24),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Checkbox(
                                value: cityProvider.isAccepted,
                                onChanged: (value) {
                                  cityProvider.termsAccepted(value!);
                                }),
                            RichText(
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
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    const TermsPage()));
                                      },
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        ElevatedButton(
                            onPressed: () {
                              isCurrentStateValid(
                                  widget._formKey, cityProvider);
                              isRegisterValid(context, cityProvider);
                            },
                            child: const Text("Register")),
                            ElevatedButton(onPressed: () {
                              ListGenerate().getCityAndDistrict(context);
                            }, child: Text("data")),
                        TextButton(
                            onPressed: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => LoginPageView()));
                            },
                            child: const Text("Login"))
                      ]),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
