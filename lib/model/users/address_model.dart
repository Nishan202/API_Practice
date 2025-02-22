import 'package:api_practice/model/users/address_coordinates_model.dart';

class AddressModel {
  String? address;
  String? city;
  String? country;
  dynamic postalCode;
  String? state;
  String? stateCode;
  AddressCoordinatesModel? coordinates;

  AddressModel({required this.address, required this.city, required this.country, required this.postalCode, required this.state, required this.stateCode, required this.coordinates});

  factory AddressModel.fromJson(Map<String, dynamic> json){
    return AddressModel(address: json['address'], city: json['city'], country: json['country'], postalCode: json['postalCode'], state: json['state'], stateCode: json['stateCode'], coordinates: AddressCoordinatesModel.fromJson(json['coordinates']));
  }
}