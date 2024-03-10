class Products {
  Products({
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
  late final Category category;
  
  Products.fromJson(Map<String, dynamic> json){
    id = json['id'];
    title = json['title'];
    price = json['price'];
    description = json['description'];
    images = List.castFrom<dynamic, String>(json['images']);
    creationAt = json['creationAt'];
    updatedAt = json['updatedAt'];
    category = Category.fromJson(json['category']);
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

class Category {
  Category({
    required this.id,
    required this.name,
    required this.image,
    required this.creationAt,
    required this.updatedAt,
  });
  late final int id;
  late final String name;
  late final String image;
  late final String creationAt;
  late final String updatedAt;
  
  Category.fromJson(Map<String, dynamic> json){
    id = json['id'];
    name = json['name'];
    image = json['image'];
    creationAt = json['creationAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['name'] = name;
    _data['image'] = image;
    _data['creationAt'] = creationAt;
    _data['updatedAt'] = updatedAt;
    return _data;
  }
}