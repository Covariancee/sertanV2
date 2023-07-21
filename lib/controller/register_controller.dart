import 'dart:convert';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:sertan/models/user.dart';

import '../city_and_district_list.dart';
import '../pages/terms_page.dart';
import '../widgets/alert_dialog.dart';

TextEditingController nameController = TextEditingController();
TextEditingController surnameController = TextEditingController();
TextEditingController phoneRegisterController = TextEditingController();
TextEditingController emailController = TextEditingController();
TextEditingController passwordRegisterController = TextEditingController();

String name = nameController.text;
String surname = surnameController.text;
String phoneNumber = phoneRegisterController.text;
String email = emailController.text;
String password = passwordRegisterController.text;

dynamic isCurrentStateValid = (formKey, cityProvider) {
  if (formKey.currentState!.validate()) {
    print(
        "ID: ${phoneRegisterController.text} Name Surname: ${nameController.text} ${surnameController.text} Password: ${passwordRegisterController.text} City&District: ${cityProvider.selectedCity} ${cityProvider.selectedDistrict} Email: ${emailController.text}");
  }
};
dynamic isRegisterValid = (context, cityProvider) {
  if (cityProvider.isCitySelected == false ||
      cityProvider.isDistrictSelected == false) {
    alertDialog(context, 'city and district is required');
  } else if (cityProvider.isAccepted == false) {
    alertDialog(context, 'Terms error');
  } else {
    const String routeName = '/profile-page';

    Navigator.pushNamed(
      context,
      routeName,
      arguments: UserModel(
          nameSurname: "$name $surname",
          phoneNumber: phoneNumber,
          emailAddress: email,
          password: password),
    );
  }
};
var maskFormatter = MaskTextInputFormatter(
    mask: '+90 (###) ###-##-##',
    filter: {"#": RegExp(r'[0-9]')},
    type: MaskAutoCompletionType.lazy);

class ListGenerate {
  getCityAndDistrict(BuildContext context) async {
    final file =
        await rootBundle.loadString("assets/a.json");

    final json = jsonDecode(file);
   

   
    print(json); 
  }

  GenerateList(cityOrDistrict) {
    return List<Widget>.generate(cities.length, (index) {
      return Center(
        child: Text(
          cityOrDistrict[index],

          //districts[cityProvider.selectedCity]![index],
          style: const TextStyle(fontSize: 20),
        ),
      );
    });
  }
}

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
