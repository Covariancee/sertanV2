import 'dart:convert';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import '../city_and_district_list.dart';
import 'package:sertan/pages/terms_page.dart';
import 'package:sertan/widgets/custom_cupertino_button.dart';

import '../city_and_district_list.dart';

import '../controller/validators.dart';
import '../provider/city_and_district_provider.dart';
import '../widgets/text_input.dart';
import '../widgets/text_span.dart';

class RegisterPageView extends StatefulWidget {
  RegisterPageView({
    super.key,
  });

  @override
  State<RegisterPageView> createState() => _RegisterPageViewState();
}

class _RegisterPageViewState extends State<RegisterPageView> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) {
        // var model = CategoryController();
        // model.init();
        return CityDistrictProvider();
      },
      child: Consumer<CityDistrictProvider>(builder: _buildBody),
    );
  }
}

Widget _buildBody(
    BuildContext context, CityDistrictProvider value, Widget? child) {
  final cityProvider = Provider.of<CityDistrictProvider>(context);
  bool visible = cityProvider.isCitySelected;
  return SafeArea(
    child: Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        height: double.infinity,
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/vtz_background.png"),
                fit: BoxFit.cover)),
        child: SingleChildScrollView(
          child: Form(
            key: cityProvider.formKey,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32),
              child: Stack(
                children: [
                  Column(mainAxisAlignment: MainAxisAlignment.center, children: [
                    SizedBox(
                        width: 200, child: Image.asset("assets/vtz_logo.png")),
                    DefaultInput(
                        controller: cityProvider.nameController,
                        validator: nameSurnameValidator,
                        inputText: "Name"),
                    DefaultInput(
                        controller: cityProvider.surnameController,
                        validator: nameSurnameValidator,
                        inputText: "Surname"),
                    PhoneInput(controller: cityProvider.phoneRegisterController),
                    DefaultInput(
                        controller: cityProvider.emailController,
                        keyboardType: TextInputType.emailAddress,
                        //maskFormatters: maskFormatter,
                        validator: emailValidator,
                        inputText: "E-mail"),
                    PasswordInput(
                        controller: cityProvider.passwordRegisterController,
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
                            generateListVar: districts[cityProvider.selectedCity],
                            setSelectedAny: (value) => cityProvider
                                    .setSelectedDistrict =
                                districts[cityProvider.selectedCity]![value])),
                    const SizedBox(height: 24),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Checkbox(
                            value: cityProvider.isAccepted,
                            onChanged: (value) {
                              cityProvider.termsAccepted(value!);
                            }),
                        const TermText(),
                      ],
                    ),
                    ElevatedButton(
                        onPressed: () {
                          cityProvider.isCurrentStateValid(
                              cityProvider.formKey, cityProvider);
                          cityProvider.isRegisterValid(context, cityProvider);
                        },
                        child: const Text("Register")),
                    ElevatedButton(
                        onPressed: () async{
                      
                            final file = await rootBundle
                                .loadString("assets/products.json");
  
                            final json = jsonDecode(file);
  
                            print(json);
                          },
                        
                        child: Text("data")),
                    TextButton(
                        onPressed: () {
                          Navigator.pushNamed(context, "/login-page");
                        },
                        child: const Text("Login"))
                  ]),
                ],
              ),
            ),
          ),
        ),
      ),
    ),
  );
}
