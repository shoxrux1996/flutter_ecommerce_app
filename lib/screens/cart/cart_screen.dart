import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar.defaultAppBar(
        title: 'Cart',
      ),
      body: BlocBuilder<CartBloc, CartState>(
        builder: (context, state) {
          if (state is CartLoadingState) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is CartLoadedState) {
            return CartView(
              cart: state.cart,
            );
          } else {
            return const Text('Error');
          }
        },
      ),
      bottomNavigationBar: const DefaultBottomAppBar(),
    );
  }
}
