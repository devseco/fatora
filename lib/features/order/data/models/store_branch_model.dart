class StoreBranchModel {
  final String name;
  final String logoUrl;
  final String discount;
  final String type; // إضافة هذا الحقل

  StoreBranchModel({
    required this.name,
    required this.logoUrl,
    required this.discount,
    required this.type, // إضافة هذا الحقل
  });

  factory StoreBranchModel.fromJson(Map<String, dynamic> json) {
    return StoreBranchModel(
      name: json['name'] as String,
      logoUrl: json['logoUrl'] as String,
      discount: json['discount'] as String,
      type: json['type'] as String, // قراءة النوع من JSON
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'logoUrl': logoUrl,
      'discount': discount,
      'type': type, // تحويل النوع إلى JSON
    };
  }
}
