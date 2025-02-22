import 'package:api_practice/model/users/address_model.dart';
import 'package:api_practice/model/users/bank_model.dart';
import 'package:api_practice/model/users/company_model.dart';
import 'package:api_practice/model/users/crypto_model.dart';
import 'package:api_practice/model/users/hair_model.dart';

class UsersModel {
  int? id;
  String? firstName;
  String? lastName;
  String? maidenName;
  int? age;
  String? gender;
  String? email;
  int? phone;
  String? username;
  String? password;
  String? birthDate;
  String? image;
  String? bloodGroup;
  num? height;
  num? weight;
  String? eyeColor;
  String? ip;
  String? macAddress;
  String? university;
  String? ein;
  String? ssn;
  String? userAgentf;
  String? role;
  HairModel? hair;
  CryptoModel? crypto;
  CompanyModel? company;
  BankModel? bank;
  AddressModel? address;

  UsersModel({required this.address, required this.age, required this.bank, required this.birthDate, required this.bloodGroup, required this.company, required this.crypto, required this.ein, required this.email, required this.eyeColor, required this.firstName, required this.gender, required this.hair, required this.height, required this.id, required this.image, required this.ip, required this.lastName, required this.macAddress, required this.maidenName, required this.password, required this.phone, required this.role, required this.ssn, required this.university, required this.userAgentf, required this.username, required this.weight});

  factory UsersModel.fromJson(Map<String, dynamic> json){
    return UsersModel(address: AddressModel.fromJson(json['address']), age: json['age'], bank: BankModel.fromJson(json['bank']), birthDate: json['birthDate'], bloodGroup: json['bloodGroup'], company: CompanyModel.fromJson(json['company']), crypto: CryptoModel.fromJson(json['crypto']), ein: json['ein'], email: json['email'], eyeColor: json['eyeColor'], firstName: json['firstName'], gender: json['gender'], hair: HairModel.fromJson(json['hair']), height: json['height'], id: json['id'], image: json['image'], ip: json['ip'], lastName: json['lastName'], macAddress: json['macAddress'], maidenName: json['maidenName'], password: json['password'], phone: json['phone'], role: json['role'], ssn: json['ssn'], university: json['university'], userAgentf: json['userAgentf'], username: json['username'], weight: json['weight']);
  }
}