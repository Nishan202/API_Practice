class ReviewsModel {
  String? comment;
  DateTime? date;
  int? rating;
  String? reviewerEmail;
  String? reviewerName;

  ReviewsModel({required this.comment, required this.date, required this.rating, required this.reviewerEmail, required this.reviewerName});

  factory ReviewsModel.fromJson(Map<String, dynamic> json){
    return ReviewsModel(comment: json['comment'], date: json['date'], rating: json['rating'], reviewerEmail: json['reviewerEmail'], reviewerName: json['reviewerName']);
  }
}