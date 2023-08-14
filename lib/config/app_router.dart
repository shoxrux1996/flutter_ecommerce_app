import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/screens/screens.dart';
import 'package:flutter_ecommerce_app/widgets/widgets.dart';

class AppRouter {
  static Route onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RootScreen.routeName:
        return RootScreen.route();
      case CatalogScreen.routeName:
        return CatalogScreen.route(title: settings.arguments as String);
      case ProductScreen.routeName:
        return ProductScreen.route(productId: settings.arguments as int);
      case WishlistScreen.routeName:
        return WishlistScreen.route();
      default:
        return _errorRoute();
    }
  }

  static Route _errorRoute() {
    return MaterialPageRoute(
      settings: const RouteSettings(name: '/error'),
      builder: (_) => Scaffold(
        appBar: CustomAppBar.defaultAppBar(
          title: 'Error',
        ),
      ),
    );
  }
}
