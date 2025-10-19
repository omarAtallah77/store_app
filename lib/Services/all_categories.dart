import 'dart:convert';

import 'package:http/http.dart' as http;

import '../helper/api.dart';

class GetAllCategories
{

  Future <List <dynamic>> GetCategories() async
  {
    String url =  'https://fakestoreapi.com/products/categories' ;
    http.Response response = await Api().get(url: url) ;

        List <dynamic> Categories  = jsonDecode(response.body);
        return Categories ;
      }


  }
