import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:storee_app/Models/product_Model.dart';
import 'package:storee_app/helper/api.dart';

class GetProductByCategory
{

  GetProductByCategory() ;

  Future <List<ProductModel>> getCategoryProduct({required String category_name}) async{
    String url = 'https://fakestoreapi.com/products/category/${category_name}';
    List <ProductModel> products = [] ;

     http.Response response = await Api().get(url: url) ;

        List data = jsonDecode(response.body);

        for (int product in data)
        {
          products.add(ProductModel.fromJson(data[product]));
        }
        return products ;



  }

}