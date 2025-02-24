class SysModel {
  String? country;
  int? id;
  int? sunrise;
  int? sunset;
  int? type;

  SysModel({required this.country, required this.id, required this.sunrise, required this.sunset, required this.type});

  factory SysModel.fromJson(Map<String, dynamic> json){
    return SysModel(country: json['country'], id: json['id'], sunrise: json['sunrise'], sunset: json['sunset'], type: json['type']);
  }
}