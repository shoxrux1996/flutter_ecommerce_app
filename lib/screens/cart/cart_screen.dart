import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ecommerce_app/screens/checkout/checkout_screen.dart';
import 'package:flutter_ecommerce_app/widgets/widgets.dart';
import 'package:flutter_ecommerce_app/blocs/cart/cart_bloc.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  static const String routeName = '/cart';

  static Route route() {
    return MaterialPageRoute(
      settings: const RouteSettings(name: routeName),
      builder: (_) => const CartScreen(),
    );
  }

  void _goToCheckout(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const CheckoutScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar.defaultAppBar(
        title: 'Cart',
      ),
      body: BlocBuilder<CartBloc, CartState>(
        builder: (blocContext, state) {
          if (state is CartLoadingState) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is CartLoadedState) {
            return CartView(
              cart: state.cart,
              goToCheckout: _goToCheckout,
            );
          } else {
            return const Text('Error');
          }
        },
      ),
      bottomNavigationBar: CustomBottomAppBar.defaultBottomAppBar(),
    );
  }
}
