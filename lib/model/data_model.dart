import 'package:api_practice/model/product_model.dart';

class DataModel {
  int? limit;
  int? skip;
  int? total;
  List<ProductModel>? products;

  DataModel({required this.limit, required this.products, required this.skip, required this.total});

  factory DataModel.fromJson(Map<String, dynamic> json){

    List<ProductModel> listProducts = [];

    for(Map<String, dynamic> eachProduct in json['products']){
      ProductModel mProduct = ProductModel.fromJson(eachProduct);
      listProducts.add(mProduct);
    }
    return DataModel(limit: json['limit'], products: listProducts, skip: json['skip'], total: json['total']);
  }
}