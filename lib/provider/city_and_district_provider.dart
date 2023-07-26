import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import '../city_and_district_list.dart';
import '../models/cityanddistrict.dart';
import '../models/user.dart';
import '../widgets/alert_dialog.dart';

class CityDistrictProvider with ChangeNotifier {
 List<Cities> cityDataList = [];
  CityDistrictProvider(){
    init();
  }
  void init() async{
     String file = await rootBundle.loadString("assets/products.json");
    List<dynamic> jsonData = jsonDecode(file);
    cityDataList = jsonData.map((data) => Cities.fromJson(data as Map<String, dynamic>)).toList();

    
  }

  TextEditingController nameController = TextEditingController();
  TextEditingController surnameController = TextEditingController();
  TextEditingController phoneRegisterController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordRegisterController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  String _selectedCity = "No city choosen";
  String _selectedDistrict = "No district choosen";
  bool _isAccepted = false;

  bool _isCitySelected = false;
  bool _isDistrictSelected = false;

  String get selectedCity => _selectedCity;
  get formKey => _formKey;

  String get selectedDistrict => _selectedDistrict;

  bool get isCitySelected => _isCitySelected;
  bool get isDistrictSelected => _isDistrictSelected;

  bool get isAccepted => _isAccepted;

  set setSelectedCity(String city) {
    _selectedCity = city;
    _isCitySelected = true;
    _isDistrictSelected = false;
    _selectedDistrict = "No district choosen";

    notifyListeners();
  }

  set setSelectedDistrict(String district) {
    _selectedDistrict = district;
    _isDistrictSelected = true;
    notifyListeners();
  }

  void termsAccepted(bool value) {
    if (_isAccepted = true) {
      _isAccepted = value;
    } else {
      _isAccepted = value;
    }
    notifyListeners();
  }

  // ignore: non_constant_identifier_names
  GenerateList(cityOrDistrict) async {
  

    return List<Widget>.generate(cityDataList.length, (index) {
      return Center(
        child: Text(
          cityDataList[index].city,

          //districts[cityProvider.selectedCity]![index],
          style: const TextStyle(fontSize: 20),
        ),
      );
    });
  }

  isCurrentStateValid(formKey, cityProvider) {
    if (formKey.currentState!.validate()) {
      print(
          "ID: ${phoneRegisterController.text} Name Surname: ${nameController.text} ${surnameController.text} Password: ${passwordRegisterController.text} City&District: $selectedCity $selectedDistrict Email: ${emailController.text}");
    }
  }

  isRegisterValid(context, cityProvider) {
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
            nameSurname: "${nameController.text} ${surnameController.text}",
            phoneNumber: phoneRegisterController.text,
            emailAddress: emailController.text,
            password: passwordRegisterController.text,
            city: selectedCity,
            distrtict: selectedDistrict),
      );
    }
  }

  var maskFormatter = MaskTextInputFormatter(
      mask: '+90 (###) ###-##-##',
      filter: {"#": RegExp(r'[0-9]')},
      type: MaskAutoCompletionType.lazy);
}
