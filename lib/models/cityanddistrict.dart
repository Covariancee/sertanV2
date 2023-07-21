class City {
  String name;
  List<String> districts;

  City(this.name, this.districts);

  factory City.fromJson(Map<String, dynamic> json) {
    return City(
      json['cities'],
      List<String>.from(json['districts']),
    );
  }
  Map<String, dynamic>  toJson() => {
  'cities': name,
};
}

class District {
  Map<String, List<String>> data;

  District(this.data);

  factory District.fromJson(Map<String, dynamic> json) {
    return District(
      Map<String, List<String>>.from(json['districts']),
    );
  }
}
