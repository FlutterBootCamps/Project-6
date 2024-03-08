import 'package:flutter_week6_day3_lab/models/category_model.dart';

class Product {
  Product({
    required this.id,
    required this.title,
    required this.price,
    required this.description,
    required this.images,
    required this.creationAt,
    required this.updatedAt,
    required this.category,
  });
  late final int id;
  late final String title;
  late final int price;
  late final String description;
  late final List<String> images;
  late final String creationAt;
  late final String updatedAt;
  late final ProductCategory category;
  
  Product.fromJson(Map<String, dynamic> json){
    id = json['id'];
    title = json['title'];
    price = json['price'];
    description = json['description'];
    images = List.castFrom<dynamic, String>(json['images']);
    creationAt = json['creationAt'];
    updatedAt = json['updatedAt'];
    category = ProductCategory.fromJson(json['category']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['title'] = title;
    _data['price'] = price;
    _data['description'] = description;
    _data['images'] = images;
    _data['creationAt'] = creationAt;
    _data['updatedAt'] = updatedAt;
    _data['category'] = category.toJson();
    return _data;
  }
}