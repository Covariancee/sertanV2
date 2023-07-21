class CityAndDistrict {
  final istanbul;
  final ankara;
  final izmir;
  final bursa;

  CityAndDistrict({this.istanbul, this.ankara, this.izmir, this.bursa});

  CityAndDistrict.fromJson(Map<String, dynamic> json) {
    istanbul = json['0'];
    ankara = json['1'];
    izmir = json['2'];
    bursa = json['3'];
  }

  Map<String, dynamic> toJson() => {
        '0': istanbul,
        '1': ankara,
        '2': izmir,
        '3': bursa,
      };
}
