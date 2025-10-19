import 'package:storee_app/Models/product_Model.dart';
import 'package:storee_app/helper/api.dart';

class AddProduct {
  Future<ProductModel> addProduct({
    required String title,
    required double price,
    required String description,
    required String category,
    required String imageurl,
  }) async {
    Map<String, dynamic> data = await Api().post(
      url: 'https://fakestoreapi.com/products',
      body: {
        'title': title,
        'price': price,
        'description': description,
        'image': imageurl,
        'category': category,
      },
      token: '30404220100438',
    );
    return ProductModel.fromJson(data);
  }
}
