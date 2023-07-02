import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/models/models.dart';

class HeroCarouselProductCard extends StatelessWidget {
  final Product product;

  const HeroCarouselProductCard({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: 5,
        vertical: 20,
      ),
      child: ClipRRect(
        borderRadius: const BorderRadius.all(
          Radius.circular(5.0),
        ),
        child: Stack(
          children: [
            Image.network(
              product.imageUrl,
              fit: BoxFit.cover,
              width: 1000.0,
            ),
          ],
        ),
      ),
    );
  }
}
