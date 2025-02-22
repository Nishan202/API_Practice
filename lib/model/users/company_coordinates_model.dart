class CompanyCoordinatesModel {
  int? lat;
  int? lng;

  CompanyCoordinatesModel({required this.lat, required this.lng});

  factory CompanyCoordinatesModel.fromJson(Map<String, dynamic> json){
    return CompanyCoordinatesModel(lat: json['lat'], lng: json['lng']);
  }
}