import 'package:api_practice/model/users/company_address_model.dart';

class CompanyModel {
  String? department;
  String? name;
  String? title;
  CompanyAddressModel? address;

  CompanyModel({required this.address, required this.department, required this.name, required this.title});

  factory CompanyModel.fromJson(Map<String, dynamic> json){
    return CompanyModel(address: CompanyAddressModel.fromJson(json['address']), department: json['department'], name: json['name'], title: json['title']);
  }
}