import 'package:flutter/material.dart';

class CityDistrictProvider with ChangeNotifier {
  String _selectedCity = "No city choosen";
  String _selectedDistrict = "No district choosen";
  bool _isCitySelected = false;

  String get selectedCity => _selectedCity;
  String get selectedDistrict => _selectedDistrict;
  bool get isCitySelected => _isCitySelected;

  set setSelectedCity(String city) {
    _selectedCity = city;
    _selectedDistrict = "";
    _isCitySelected = false;
    notifyListeners();
  }

  set setSelectedDistrict(String district) {
    _selectedDistrict = district;
    _isCitySelected = true;
    notifyListeners();
  }
}
