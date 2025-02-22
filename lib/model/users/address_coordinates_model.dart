class AddressCoordinatesModel {
  int? lat;
  int? lng;

  AddressCoordinatesModel({required this.lat, required this.lng});

  factory AddressCoordinatesModel.fromJson(Map<String, dynamic> json){
    return AddressCoordinatesModel(lat: json['lat'], lng: json['lng']);
  }
}