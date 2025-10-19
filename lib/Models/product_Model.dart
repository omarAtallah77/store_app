import 'package:storee_app/Models/ratingModel.dart';

class ProductModel {
  final String title;
  final String category;
  final String description;
  final String imageUrl;
  final double price;
  final int id;
  final RatingModel rating;

  const ProductModel({
    required this.title,
    required this.category,
    required this.description,
    required this.imageUrl,
    required this.price,
    required this.id,
    required this.rating,
  });
  factory ProductModel.fromJson(jsonData) {
    return ProductModel(
      title: jsonData['title'] as String,
      category: jsonData['category'] as String,
      description: jsonData['description'] as String,
      imageUrl: jsonData['image'] as String,
      price: (jsonData['price'] as num).toDouble(),
      id: jsonData['id'] as int,
      rating: RatingModel.fromJson(jsonData['rating']),
    );
  }
}
