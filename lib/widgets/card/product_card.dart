import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ecommerce_app/blocs/cart/cart_bloc.dart';
import 'package:flutter_ecommerce_app/models/models.dart';
import 'package:flutter_ecommerce_app/screens/screens.dart';

class ProductCard extends StatelessWidget {
  final Product product;
  final double widthFactor;
  final double leftPosition;
  final bool isWishlist;

  const ProductCard({
    super.key,
    required this.product,
    this.widthFactor = 2.5,
    this.leftPosition = 5,
    this.isWishlist = false,
  });

  @override
  Widget build(BuildContext context) {
    final double widthValue = MediaQuery.of(context).size.width / widthFactor;

    return InkWell(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => ProductScreen(
              product: product,
            ),
          ),
        );
      },
      child: Stack(
        children: [
          Container(
            width: widthValue,
            height: 150,
            color: Colors.red,
            child: Image.network(
              product.imageUrl,
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
            top: 60,
            left: leftPosition,
            child: Container(
              width: widthValue - 5 - leftPosition,
              height: 80,
              decoration: BoxDecoration(
                color: Colors.black.withAlpha(50),
              ),
            ),
          ),
          Positioned(
            top: 65,
            left: leftPosition + 5,
            child: Container(
              width: widthValue - 15 - leftPosition,
              height: 70,
              decoration: const BoxDecoration(
                color: Colors.black,
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Expanded(
                      flex: 3,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            product.name,
                            style: Theme.of(context)
                                .textTheme
                                .headlineSmall!
                                .copyWith(color: Colors.white),
                          ),
                          Text(
                            '\$${product.price}',
                            style: Theme.of(context)
                                .textTheme
                                .headlineSmall!
                                .copyWith(color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: BlocBuilder<CartBloc, CartState>(
                        builder: (context, state) {
                          if (state is CartLoadedState) {
                            return IconButton(
                              icon: const Icon(Icons.add_circle),
                              onPressed: () {
                                context.read<CartBloc>().add(
                                      AddProductToCartEvent(
                                        product: product,
                                        quantity: 1,
                                      ),
                                    );
                              },
                              color: Colors.white,
                            );
                          } else {
                            return IconButton(
                              icon: const Icon(Icons.add_circle),
                              onPressed: () {},
                              color: Colors.white,
                            );
                          }
                        },
                      ),
                    ),
                    isWishlist
                        ? Expanded(
                            child: IconButton(
                              icon: const Icon(Icons.delete),
                              onPressed: () {},
                              color: Colors.white,
                            ),
                          )
                        : const SizedBox(),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}