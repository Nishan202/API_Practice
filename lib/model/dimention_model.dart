class DimentionModel {
  double? depth;
  double? height;
  double? width;

  DimentionModel({required this.depth, required this.height, required this.width});

  factory DimentionModel.fromJson(Map<String, dynamic> json){
    return DimentionModel(depth: json['depth'], height: json['height'], width: json['width']);
  }
}