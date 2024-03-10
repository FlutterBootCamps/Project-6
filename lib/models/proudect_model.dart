class AllProduct {
  final int id;
  final String title;
  final double price;
  final String description;
  final List<String> images;
  final DateTime createdAt;
  final DateTime updatedAt;
  final CategoryModel categoryModel;

  AllProduct({
    required this.id,
    required this.title,
    required this.price,
    required this.description,
    required this.images,
    required this.createdAt,
    required this.updatedAt,
    required this.categoryModel,
  });

  factory AllProduct.fromJson(Map<String, dynamic> json) {
    return AllProduct(
      id: json['id'],
      title: json['title'],
      price: json['price'].toDouble(),
      description: json['description'],
      images: List<String>.from(json['images']),
      createdAt: DateTime.parse(json['creationAt']),
      updatedAt: DateTime.parse(json['updatedAt']),
      categoryModel: CategoryModel.fromJson(json['category']),
    );
  }
}

class CategoryModel {
  final int id;
  final String name;
  final String image;
  final DateTime createdAt;
  final DateTime updatedAt;

  CategoryModel({
    required this.id,
    required this.name,
    required this.image,
    required this.createdAt,
    required this.updatedAt,
  });

  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    return CategoryModel(
      id: json['id'],
      name: json['name'],
      image: json['image'],
      createdAt: DateTime.parse(json['creationAt']),
      updatedAt: DateTime.parse(json['updatedAt']),
    );
  }
}

