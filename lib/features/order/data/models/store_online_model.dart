class StoreOnlineModel {
  final String name;
  final String logoUrl;
  final String discount;

  StoreOnlineModel({
    required this.name,
    required this.logoUrl,
    required this.discount,
  });

  factory StoreOnlineModel.fromJson(Map<String, dynamic> json) {
    return StoreOnlineModel(
      name: json['name'] as String,
      logoUrl: json['logoUrl'] as String,
      discount: json['discount'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'logoUrl': logoUrl,
      'discount': discount,  // تحويل النسبة إلى JSON
    };
  }
}
