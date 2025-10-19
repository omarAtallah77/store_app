import 'package:flutter/material.dart';
import 'package:storee_app/Models/product_Model.dart';
import 'package:storee_app/components/productcard.dart';

Map<int, ProductModel> FavouriteProducts = {};

class Favoriteproductsscreen extends StatelessWidget {
  const Favoriteproductsscreen({super.key});

  @override
  Widget build(BuildContext context) {
    final favList = FavouriteProducts.values.toList();

    return Scaffold(
      appBar: AppBar(title: const Text("Favorite Products")),
      body: GridView.builder(
        itemCount: favList.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 0.56,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
        itemBuilder: (context, index) {
          return ProductCard(product: favList[index]);
        },
      ),
    );
  }
}
