import 'package:api_practice/model/dimention_model.dart';
import 'package:api_practice/model/meta_model.dart';
import 'package:api_practice/model/reviews_model.dart';

class ProductModel {
  String? availabilityStatus;
  String? brand;
  String? category;
  String? description;
  double? discountPercentage;
  int? id;
  int? minimumOrderQuantity;
  double? price;
  double? rating;
  String? returnPolicy;
  String? shippingInformation;
  String? sku;
  int? stock;
  String? thumbnail;
  String? title;
  String? warrantyInformation;
  int? weight;
  List<String>? tags;
  List<ReviewsModel>? reviews;
  MetaModel? meta;
  List<String>? images;
  DimentionModel? dimensions;

  ProductModel({required this.availabilityStatus, required this.brand, required this.category, required this.description, required this.dimensions, required this.discountPercentage, required this.id, required this.images, required this.meta, required this.minimumOrderQuantity, required this.price, required this.rating, required this.returnPolicy, required this.reviews, required this.shippingInformation, required this.sku, required this.stock, required this.tags, required this.thumbnail, required this.title, required this.warrantyInformation, required this.weight});

  factory ProductModel.fromJson(Map<String, dynamic> json){

    // Reivews
    List<ReviewsModel> listReviews = [];
    for(Map<String, dynamic> eachReview in json['reviews']){
      ReviewsModel mReview = ReviewsModel.fromJson(eachReview);
      listReviews.add(mReview);
    }

    // Tags
    List<String> listTags = [];
    for(String eachTags in json['tags']){
      listTags.add(eachTags); 
    }

    // Images
    List<String> listImages = [];
    for(String eachImage in json['images']){
      listImages.add(eachImage);
    }

    return ProductModel(availabilityStatus: json['availabilityStatus'], brand: json['brand'], category: json['category'], description: json['description'], dimensions: DimentionModel.fromJson(json['dimensions']), discountPercentage: json['discountPercentage'], id: json['id'], images: listImages, meta: MetaModel.fromJson(json['meta']), minimumOrderQuantity: json['minimumOrderQuantity'], price: json['price'], rating: json['rating'], returnPolicy: json['returnPolicy'], reviews: listReviews, shippingInformation: json['shippingInformation'], sku: json['sku'], stock: json['stock'], tags: listTags, thumbnail: json['thumbnail'], title: json['title'], warrantyInformation: json['warrantyInformation'], weight: json['weight']);
  }
}