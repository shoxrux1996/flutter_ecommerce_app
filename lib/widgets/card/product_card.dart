import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/extensions/string/prepend_url.dart';
import 'package:flutter_ecommerce_app/models/models.dart';
import 'package:flutter_ecommerce_app/screens/screens.dart';
import 'package:flutter_ecommerce_app/widgets/widgets.dart';

class ProductCard extends StatelessWidget {
  final Product product;
  final double widthFactor;

  const ProductCard({
    super.key,
    required this.product,
    this.widthFactor = 0.4,
  });

  @override
  Widget build(BuildContext context) {
    final double widthValue = MediaQuery.of(context).size.width * widthFactor;

    return InkWell(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => ProductScreen(
              productId: product.id,
            ),
          ),
        );
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: SizedBox(
              width: widthValue,
              child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 0.0),
                  child: CustomNetworkImage(
                    url: product.mainImage.toUrl(),
                  )),
            ),
          ),
          SizedBox(
            width: widthValue,
            height: 70,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product.name,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context)
                        .textTheme
                        .titleMedium!
                        .copyWith(height: 1),
                    maxLines: 2,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      if (product.minPrice != product.maxPrice)
                        Text(
                          'From ',
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                      Text(
                        product.minPrice != null && product.minPrice! > 0
                            ? '\$${product.minPrice}'
                            : '\$${product.price}',
                        style: Theme.of(context).textTheme.headlineSmall,
                      ),
                      if (product.uomCode?.isNotEmpty ?? false)
                        Text(
                          ' / ${product.uomCode}',
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
