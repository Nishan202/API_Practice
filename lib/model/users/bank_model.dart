class BankModel {
  String? cardExpire;
  String? cardNumber;
  String? cardType;
  String? currency;
  String? iban;

  BankModel({required this.cardExpire, required this.cardNumber, required this.cardType, required this.currency, required this.iban});

  factory BankModel.fromJson(Map<String, dynamic> json){
    return BankModel(cardExpire: json['cardExpire'], cardNumber: json['cardNumber'], cardType: json['cardType'], currency: json['currency'], iban: json['iban']);
  }
}