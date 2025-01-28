class FoodProductModel {
  String id;
  String name;
  String category;
  String image;
  String description;
  double price;
  double oldPrice;
  int countInStock;
  FoodProductModel({
    required this.id,
    required this.name,
    required this.category,
    required this.image,
    required this.description,
    required this.price,
    required this.oldPrice,
    required this.countInStock,
  });
  factory FoodProductModel.fromJson(Map<String, dynamic> json) {
    return FoodProductModel(
      id: json['_id'],
      name: json['name'],
      category: json['category'],
      image: json['image'],
      description: json['description'],
      price: json['price'].toDouble(),
      oldPrice: json['oldPrice'].toDouble(),
      countInStock: json['countInStock'],
    );
  }
  Map<String, dynamic> toJson() {
    return {
      '_id':id,
      'name': name,
      'category': category,
      'image': image,
      'description': description,
      'price': price,
      'oldPrice': oldPrice,
      'countInStock': countInStock,
    };
  }
}
