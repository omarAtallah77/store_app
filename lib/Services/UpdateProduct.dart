import '../Models/product_Model.dart';
import '../helper/api.dart';

class UpdateProducate
{

  Future <ProductModel> updateProduct ({
    required String title ,
    required double price ,
    required String description ,
    required String category ,
    required String imageurl }) async {

    Map <String , dynamic> data = await Api().put(url: 'https://fakestoreapi.com/products' , body: {
      'title': title,
      'price': price ,
      'description': description,
      'image': imageurl ,
      'category': category

    } ,
        token: '30404220100438');
    return ProductModel.fromJson(data)  ;
  }
}