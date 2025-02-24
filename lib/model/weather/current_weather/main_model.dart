class MainModel {
  num? feels_like;
  int? grnd_level;
  num? humidity;
  int? pressure;
  int? sea_level;
  num? temp;
  num? temp_max;
  num? temp_min;

  MainModel({required this.feels_like, required this.grnd_level, required this.humidity, required this.pressure, required this.sea_level, required this.temp, required this.temp_max, required this.temp_min});

  factory MainModel.fromJson(Map<String, dynamic> json){
    return MainModel(feels_like: json['feels_like'], grnd_level: json['grnd_level'], humidity: json['humidity'], pressure: json['pressure'], sea_level: json['sea_level'], temp: json['temp'], temp_max: json['temp_max'], temp_min: json['temp_min']);
  }
}