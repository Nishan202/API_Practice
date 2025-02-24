class WeatherModel {
  String? description;
  String? icon;
  int? id;
  String? main;

  WeatherModel({required this.description, required this.icon, required this.id, required this.main});

  factory WeatherModel.fromJson(Map<String, dynamic> json){
    return WeatherModel(description: json['description'], icon: json['icon'], id: json['id'], main: json['main']);
  }
}