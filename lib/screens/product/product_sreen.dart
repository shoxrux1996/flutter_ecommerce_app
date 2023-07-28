import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/extensions/string/prepend_url.dart';
import 'package:flutter_ecommerce_app/models/product/product_model.dart';
import 'package:flutter_ecommerce_app/widgets/widgets.dart';

class ProductScreen extends StatefulWidget {
  final Product product;

  const ProductScreen({
    super.key,
    required this.product,
  });

  static const String routeName = '/product';

  static Route route({required Product product}) {
    return MaterialPageRoute(
      settings: const RouteSettings(name: routeName),
      builder: (_) => ProductScreen(
        product: product,
      ),
    );
  }

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
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
                items: widget.product.allImages
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
                        widget.product.name,
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
                            '\$${widget.product.price}',
                            style: Theme.of(context).textTheme.displaySmall,
                          ),
                          if (widget.product.uomCode?.isNotEmpty ?? false) ...[
                            Text(
                              '/',
                              style: Theme.of(context).textTheme.titleMedium,
                            ),
                            Text(
                              '${widget.product.uomCode}',
                              style: Theme.of(context).textTheme.titleMedium,
                            ),
                          ],
                        ],
                      ),
                    ),
                  ),
                  Flexible(
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.black,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          vertical: 15.0,
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
                  SizedBox(
                    height: 30,
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10.0),
                          child: SectionTitle(
                            title: 'Color',
                            textStyle:
                                Theme.of(context).textTheme.headlineSmall,
                          ),
                        ),
                        Expanded(
                          child: ListView.builder(
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            itemCount: 5,
                            itemBuilder: (context, index) {
                              return const Padding(
                                padding: EdgeInsets.only(left: 5),
                                child: ProductVariantOptionButton(
                                  title: 'Dashing color Balance',
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Divider(),
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

class ProductVariantOptionButton extends StatelessWidget {
  final String title;

  const ProductVariantOptionButton({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.cyan,
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(5.0),
              child: Center(
                child: Text(title),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// Padding(
//   padding: const EdgeInsets.symmetric(horizontal: 20.0),
//   child: ExpansionTile(
//     initiallyExpanded: true,
//     title: Text(
//       'Product Information',
//       style: Theme.of(context).textTheme.displaySmall,
//     ),
//     children: [
//       ListTile(
//         title: Text(
//           'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry, standard dummy text ever since the 1500s',
//           style: Theme.of(context).textTheme.bodyLarge,
//         ),
//       ),
//     ],
//   ),
// ),
// Padding(
//   padding: const EdgeInsets.symmetric(horizontal: 20.0),
//   child: ExpansionTile(
//     initiallyExpanded: true,
//     title: Text(
//       'Delivery Information',
//       style: Theme.of(context).textTheme.displaySmall,
//     ),
//     children: [
//       ListTile(
//         title: Text(
//           'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s',
//           style: Theme.of(context).textTheme.bodyLarge,
//         ),
//       ),
//     ],
//   ),
// ),
