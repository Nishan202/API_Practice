class MetaModel {
  String? barcode;
  DateTime? createdAt;
  String? qrCode;
  DateTime? updatedAt;

  MetaModel({required this.barcode, required this.createdAt, required this.qrCode, required this.updatedAt});

  factory MetaModel.fromJson(Map<String, dynamic> json){
    return MetaModel(barcode: json['barcode'], createdAt: json['createdAt'], qrCode: json['qrCode'], updatedAt: json['updatedAt']);
  }
}