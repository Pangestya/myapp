class ProductModel {
  final String id;
  final String name;
  final int price;
  final String description;

  final String category;

  ProductModel({
    required this.id,
    required this.name,
    required this.price,
    required this.description,

    required this.category,
  });

  // Konversi dari Map ke model
  factory ProductModel.fromMap(Map<String, dynamic> map, String documentId) {
    return ProductModel(
      id: documentId,
      name: map['name'] ?? '',
      price: map['price'] ?? 0,
      description: map['description'] ?? '',

      category: map['category'] ?? '',
    );
  }

  // Konversi dari model ke Map
  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'price': price,
      'description': description,

      'category': category,
    };
  }
}
