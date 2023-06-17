import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/widgets/widgets.dart';

class ProductScreen extends StatelessWidget {
  const ProductScreen({super.key});

  static const String routeName = '/product';

  static Route route() {
    return MaterialPageRoute(
      settings: const RouteSettings(name: routeName),
      builder: (_) => const ProductScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomAppBar(
        title: 'Product',
      ),
      bottomNavigationBar: CustomNavBar(),
    );
  }
}
