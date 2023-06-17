import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/widgets/widgets.dart';

class CatalogScreen extends StatelessWidget {
  const CatalogScreen({super.key});

  static const String routeName = '/catalog';

  static Route route() {
    return MaterialPageRoute(
      settings: const RouteSettings(name: routeName),
      builder: (_) => const CatalogScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomAppBar(
        title: 'Catalog',
      ),
      bottomNavigationBar: CustomNavBar(),
    );
  }
}
