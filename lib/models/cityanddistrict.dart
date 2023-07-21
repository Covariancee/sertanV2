class CityModel {
  Map<String, String> city;

  CityModel({
    required this.city,
  });
  factory CityModel.fromJson(Map<String, dynamic> cities) =>
      CityModel(city: cities["cities"]);

  Map<String, dynamic> toJson() => {"cities": city};
}
