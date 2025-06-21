class PaymentMethodModel {
  final String name;
  final String image;

  PaymentMethodModel({
    required this.name,
    required this.image,
  });

  // Helper for an empty payment method
  factory PaymentMethodModel.empty() => PaymentMethodModel(name: '', image: '');

  // For loading from JSON (optional)
  factory PaymentMethodModel.fromJson(Map<String, dynamic> json) {
    return PaymentMethodModel(
      name: json['name'] ?? '',
      image: json['image'] ?? '',
    );
  }

  // For saving to JSON (optional)
  Map<String, dynamic> toJson() => {
        'name': name,
        'image': image,
      };
}