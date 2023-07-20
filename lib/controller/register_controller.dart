import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:provider/provider.dart';
import 'package:sertan/models/cityanddistrict.dart';
import 'package:sertan/models/user.dart';
import '../city_and_district_list.dart';
import '../provider/city_and_district_provider.dart';
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
    final String routeName = '/profile-page';

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
  // ignore: non_constant_identifier_names
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
