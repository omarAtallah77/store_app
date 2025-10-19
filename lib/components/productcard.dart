import 'package:flutter/material.dart';
import 'package:storee_app/Models/product_Model.dart';
import 'package:storee_app/Screens/ProductPageInfo.dart';
import 'package:storee_app/Screens/favoriteProductsScreen.dart';

class ProductCard extends StatefulWidget {
  final ProductModel product;
  bool isFavorite = false;
  ProductCard({super.key, required this.product, this.isFavorite = false});

  @override
  State<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return Productpageinfo(model: widget.product);
            },
          ),
        );
      },
      child: Card(
        margin: const EdgeInsets.all(8),
        elevation: 3,
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Product Image
              Image.network(
                widget.product.imageUrl,
                height: 150,
                width: double.infinity,
                fit: BoxFit.contain,
                loadingBuilder: (context, child, loadingProgress) {
                  if (loadingProgress == null) return child;
                  return const Center(child: CircularProgressIndicator());
                },
                errorBuilder: (context, error, stackTrace) {
                  return const Center(child: Icon(Icons.broken_image));
                },
              ),

              const SizedBox(height: 10),

              // Product Title
              Text(
                widget.product.title,
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: Colors.grey[800],
                  overflow: TextOverflow.ellipsis,
                ),
                maxLines: 2,
              ),

              const SizedBox(height: 5),

              // Price and Favorite Button
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '\$${widget.product.price.toStringAsFixed(2)}',
                    style: const TextStyle(fontSize: 16, color: Colors.green),
                  ),

                  IconButton(
                    onPressed: () {
                      setState(() {
                        widget.isFavorite = !widget.isFavorite;

                        if (widget.isFavorite) {
                          FavouriteProducts[widget.product.id] = widget.product;
                        } else
                          FavouriteProducts.remove(widget.product.id);
                      });
                    },
                    icon: Icon(
                      widget.isFavorite
                          ? Icons.favorite
                          : Icons.favorite_border,
                      color: widget.isFavorite ? Colors.red : null,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
