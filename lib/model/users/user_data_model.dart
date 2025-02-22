import 'package:api_practice/model/users/users_model.dart';

class UserDataModel {
  int? total;
  int? skip;
  int? limit;
  List<UsersModel>? users;

  UserDataModel({required this.limit, required this.skip, required this.total, required this.users});

  factory UserDataModel.fromJson(Map<String, dynamic> json){
    List<UsersModel> listUsers = [];

    for(Map<String, dynamic> eachUser in json['users']){
      UsersModel mProduct = UsersModel.fromJson(eachUser);
      listUsers.add(mProduct);
    }
    return UserDataModel(limit: json['limit'], skip: json['skip'], total: json['total'], users: listUsers);
  }
}