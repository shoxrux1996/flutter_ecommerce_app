import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/models/models.dart';
import 'package:flutter_ecommerce_app/widgets/widgets.dart';

class CatalogScreen extends StatelessWidget {
  static const String routeName = '/catalog';

  static Route route({String? title}) {
    return MaterialPageRoute(
      settings: const RouteSettings(name: routeName),
      builder: (_) => CatalogScreen(
        title: title,
      ),
    );
  }

  final String? title;

  const CatalogScreen({super.key, this.title});

  @override
  Widget build(BuildContext context) {
    final List<Product> categoryProducts = Product.products.toList();

    return Scaffold(
      appBar: CustomAppBar.defaultAppBar(
        title: title ?? '',
      ),
      bottomNavigationBar: CustomBottomAppBar.defaultBottomAppBar(),
      body: GridView.builder(
        padding: const EdgeInsets.symmetric(
          horizontal: 8.0,
          vertical: 16.0,
        ),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 1.15,
        ),
        itemCount: categoryProducts.length,
        itemBuilder: (context, index) {
          return Center(
            child: ProductCard(
              product: categoryProducts[index],
              widthFactor: 0.45,
            ),
          );
        },
      ),
    );
  }
}
