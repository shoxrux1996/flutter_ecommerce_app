import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/extensions/string/prepend_url.dart';
import 'package:flutter_ecommerce_app/models/models.dart';
import 'package:flutter_ecommerce_app/widgets/widgets.dart';

class ProductView extends StatelessWidget {
  final Product product;
  final Product selectedProduct;
  final Map<String, List<ProductOption>> variants;
  final Function(String, String) updateOptions;
  final Function()? addToCart;

  const ProductView({
    super.key,
    required this.product,
    required this.selectedProduct,
    required this.variants,
    required this.updateOptions,
    required this.addToCart,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar.defaultAppBar(
        title: 'Product',
      ),
      bottomNavigationBar: const DefaultBottomAppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: CarouselSlider(
                options: CarouselOptions(
                  aspectRatio: 1.5,
                  viewportFraction: 0.9,
                  enlargeCenterPage: true,
                  enlargeStrategy: CenterPageEnlargeStrategy.height,
                ),
                items: product.allImages
                    .map((e) => HeroCarouselProductCard(url: e.toUrl()))
                    .toList(),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Container(
                padding: const EdgeInsets.all(10.0),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.grey,
                    width: 5,
                  ),
                  color: Colors.black,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Expanded(
                      child: Text(
                        selectedProduct.name,
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context)
                            .textTheme
                            .headlineMedium!
                            .copyWith(
                              color: Colors.white,
                            ),
                        maxLines: 3,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20.0,
                vertical: 20.0,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                    child: Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Price: ',
                            style: Theme.of(context).textTheme.titleLarge,
                          ),
                          Text(
                            '\$${selectedProduct.price}',
                            style: Theme.of(context).textTheme.displaySmall,
                          ),
                          if (selectedProduct.uomCode?.isNotEmpty ?? false) ...[
                            Text(
                              '/',
                              style: Theme.of(context).textTheme.titleMedium,
                            ),
                            Text(
                              '${selectedProduct.uomCode}',
                              style: Theme.of(context).textTheme.titleMedium,
                            ),
                          ],
                        ],
                      ),
                    ),
                  ),
                  Flexible(
                    child: ElevatedButton(
                      onPressed: addToCart,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.black,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          vertical: 10.0,
                        ),
                        child: Text(
                          'ADD TO CART',
                          style: Theme.of(context)
                              .textTheme
                              .displaySmall!
                              .copyWith(
                                color: Colors.white,
                              ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                children: [
                  const SectionTitle(title: 'Options'),
                  const Divider(),
                  Column(
                    children: [
                      ...variants.entries
                          .map(
                            (e) => ProductOptionSelect(
                              title: e.key,
                              options: e.value,
                              updateOptions: updateOptions,
                            ),
                          )
                          .toList(),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      // HeroCarouselProductCard(product: product),
    );
  }
}
