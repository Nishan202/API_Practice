import 'package:api_practice/model/users/company_coordinates_model.dart';

class CompanyAddressModel {
  String? address;
  String? city;
  String? country;
  dynamic postalCode;
  String? stateCode;
  CompanyCoordinatesModel? coordinates;

  CompanyAddressModel({required this.address, required this.city, required this.coordinates, required this.country, required this.postalCode, required this.stateCode});

  factory CompanyAddressModel.fromJson(Map<String, dynamic> json){
    return CompanyAddressModel(address: json['address'], city: json['city'], coordinates: CompanyCoordinatesModel.fromJson(json['coordinates']), country: json['country'], postalCode: json['postalCode'], stateCode: json['stateCode']);
  }
}