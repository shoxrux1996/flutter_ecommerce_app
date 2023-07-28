import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/widgets/widgets.dart';

class HeroCarouselProductCard extends StatelessWidget {
  final String url;

  const HeroCarouselProductCard({super.key, required this.url});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: 5,
      ),
      child: ClipRRect(
        borderRadius: const BorderRadius.all(
          Radius.circular(5.0),
        ),
        child: Stack(
          fit: StackFit.expand,
          children: [
            CustomNetworkImage(
              url: url,
            ),
          ],
        ),
      ),
    );
  }
}
