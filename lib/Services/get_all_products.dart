import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:storee_app/Models/product_Model.dart';

import '../helper/api.dart';

class GetAllProducts {
  Future<List<ProductModel>> getAllProducts() async {
    String url = 'https://fakestoreapi.com/products';
    List<ProductModel> products = [];
    http.Response response = await Api().get(url: url);

    List data = jsonDecode(response.body);

    for (var product in data) {
      products.add(ProductModel.fromJson(product));
    }

    return products;
  }
}
