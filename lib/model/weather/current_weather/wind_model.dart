class WindModel {
  int? deg;
  num? gust;
  num? speed;

  WindModel({required this.deg, required this.gust, required this.speed});

  factory WindModel.fromJson(Map<String, dynamic> json){
    return WindModel(deg: json['deg'], gust: json['gust'], speed: json['speed']);
  }
}