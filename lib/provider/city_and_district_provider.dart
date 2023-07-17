import 'package:flutter/material.dart';
import 'package:sertan/city_and_district_list.dart';

class CityDistrictProvider with ChangeNotifier {
  String _selectedCity = "No city choosen";
  String _selectedDistrict = "No district choosen";
  bool _isAccepted = false;
  bool _isCitySelected = false;

  String get selectedCity => _selectedCity;
  String get selectedDistrict => _selectedDistrict;
  bool get isAccepted => _isAccepted;
  bool get isCitySelected => _isCitySelected;

  set setSelectedCity(String city) {
    _selectedCity = city;
    if (_selectedCity == cities[0]) {
      _isCitySelected = false;
    } else {
      _isCitySelected = true;
    }

    notifyListeners();
  }

  set setSelectedDistrict(String district) {
    _selectedDistrict = district;

    notifyListeners();
  }

  void setAccepted(bool value) {
    if (_isAccepted = true) {
      _isAccepted = value;
      notifyListeners();
    } else if (_isAccepted = false) {
      _isAccepted = value;
      notifyListeners();
    }
  }

  
}
