class CityAndDistrict {
  List<Iller>? iller;

  CityAndDistrict({this.iller});

  CityAndDistrict.fromJson(Map<String, dynamic> json) {
    if (json['iller'] != null) {
      iller = <Iller>[];
      json['iller'].forEach((v) {
        iller!.add( Iller.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  Map<String, dynamic>();
    if (iller != null) {
      data['iller'] = iller!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Iller {
  String? ilAd;
  List<String>? ilceler;

  Iller({this.ilAd, this.ilceler});

  Iller.fromJson(Map<String, dynamic> json) {
    ilAd = json['il_ad'];
    ilceler = json['ilceler'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  Map<String, dynamic>();
    data['il_ad'] = ilAd;
    data['ilceler'] = ilceler;
    return data;
  }
}
