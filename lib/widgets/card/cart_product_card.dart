import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ecommerce_app/blocs/cart/cart_bloc.dart';
import 'package:flutter_ecommerce_app/extensions/string/prepend_url.dart';
import 'package:flutter_ecommerce_app/models/models.dart';

class CartProductCard extends StatelessWidget {
  final CartItem item;

  const CartProductCard({
    Key? key,
    required this.item,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartBloc, CartState>(
      builder: (context, state) {
        if (state is CartLoadedState) {
          return Container(
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  color: Colors.black.withOpacity(0.1),
                ),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.only(bottom: 16.0, top: 16.0),
              child: Row(
                children: [
                  Image.network(
                    item.imageUrl.toUrl(),
                    width: 100,
                    height: 80,
                    fit: BoxFit.cover,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          item.name,
                          maxLines: 1,
                          style: Theme.of(context).textTheme.headlineSmall,
                        ),
                        Text(
                          '\$${item.price}',
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Row(
                    children: [
                      IconButton(
                        onPressed: () {
                          if (item.quantity > 1) {
                            context.read<CartBloc>().add(
                                  UpdateCartItemEvent(
                                    item: item,
                                    quantity: item.quantity - 1,
                                  ),
                                );
                          } else {
                            context.read<CartBloc>().add(
                                  RemoveProductFromCartEvent(item),
                                );
                          }
                        },
                        icon: const Icon(Icons.remove_circle),
                      ),
                      Text(
                        '${item.quantity}',
                        style: Theme.of(context).textTheme.headlineSmall,
                      ),
                      IconButton(
                        onPressed: () {
                          context.read<CartBloc>().add(
                                UpdateCartItemEvent(
                                  item: item,
                                  quantity: item.quantity + 1,
                                ),
                              );
                        },
                        icon: const Icon(Icons.add_circle),
                      ),
                    ],
                  )
                ],
              ),
            ),
          );
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
