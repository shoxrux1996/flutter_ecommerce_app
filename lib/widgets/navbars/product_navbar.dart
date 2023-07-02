import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ecommerce_app/blocs/wishlist/wishlist_bloc.dart';
import 'package:flutter_ecommerce_app/models/product_model.dart';
import 'package:flutter_ecommerce_app/widgets/widgets.dart';

class ProductNavBar extends StatefulWidget {
  final Product product;
  const ProductNavBar({super.key, required this.product});

  @override
  State<ProductNavBar> createState() => _ProductNavBarState();
}

class _ProductNavBarState extends State<ProductNavBar> {
  @override
  Widget build(BuildContext context) {
    return CustomNavBar(
      widget: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          IconButton(
            onPressed: () {},
            color: Colors.white,
            icon: const Icon(Icons.share),
          ),
          BlocBuilder<WishlistBloc, WishlistState>(
            builder: (context, state) {
              if (state is WishlistLoading) {
                return const CircularProgressIndicator();
              } else if (state is WishlistLoaded) {
                // check product in wishlist
                return IconButton(
                  onPressed: () {
                    context.read<WishlistBloc>().add(
                          AddProductToWishlist(widget.product),
                        );

                    const snackbar = SnackBar(
                      content: Text('Added to the Wishlist'),
                    );

                    ScaffoldMessenger.of(context).showSnackBar(snackbar);
                  },
                  color: Colors.white,
                  icon: const Icon(Icons.favorite),
                );
              } else {
                return const Text('Something went wrong');
              }
            },
          ),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(backgroundColor: Colors.white),
            child: Text(
              'ADD TO CART',
              style: Theme.of(context).textTheme.displaySmall,
            ),
          )
        ],
      ),
    );
  }
}
