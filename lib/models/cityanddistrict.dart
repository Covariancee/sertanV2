import 'dart:convert';

class Cities {
  Cities({
    required this.id,
    required this.city,
    required this.districts,
  });
    int id;
    String city;
    List<String> districts;

 factory Cities.fromJson(Map<String, dynamic> data) {
    final id = data["id"] as int;
    final city = data["city"] as String;
    final districts = (data["districts"] as List).map((e) => e.toString()).toList();
    return Cities(id: id, city: city, districts: districts);
  }
}
