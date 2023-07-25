import 'package:sertan/city_and_district_list.dart';

class CityModel {
  String? city;

  CityModel({
    this.city,
  });
  CityModel.fromJson(Map<String, dynamic> cities) {
    city = cities['cities'];
  }

  Map<String, dynamic> toJson() => {"cities": city};
}

var city = CityModel.fromJson(citiesJson);
