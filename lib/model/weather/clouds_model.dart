class CloudsModel {
  num? all;

  CloudsModel({required this.all});

  factory CloudsModel.fromJson(Map<String, dynamic> json){
    return CloudsModel(all: json['all']);
  }
}