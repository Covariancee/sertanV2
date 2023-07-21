import 'dart:convert';

class CityAndDistrict {
  final String city;
  final String district;

  CityAndDistrict({required this.city, required this.district});

  factory CityAndDistrict.fromJson(Map<String, dynamic> json) =>
      CityAndDistrict(city: json["il_ad"], district: json["ilceler"]);
}
