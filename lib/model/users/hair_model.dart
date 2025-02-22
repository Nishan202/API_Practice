class HairModel {
  String? color;
  String? type;

  HairModel({required this.color, required this.type});

  factory HairModel.fromJson(Map<String, dynamic> json){
    return HairModel(color: json['color'], type: json['type']);
  }
}