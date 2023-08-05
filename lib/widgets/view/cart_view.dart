import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/models/models.dart';
import 'package:flutter_ecommerce_app/widgets/widgets.dart';

class CartView extends StatelessWidget {
  final Cart cart;

  const CartView({
    super.key,
    required this.cart,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 20.0,
        vertical: 10.0,
      ),
      child: Column(
        children: [
          Expanded(
            child: Column(
              children: [
                const SizedBox(
                  height: 10,
                ),
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border(
                        top: BorderSide(
                          color: Colors.black.withOpacity(0.1),
                        ),
                      ),
                    ),
                    child: ListView.builder(
                      itemCount: cart.items.length,
                      itemBuilder: (context, index) {
                        return CartProductCard(
                          item: cart.items[index],
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
          Column(
            children: [
              const Divider(thickness: 1),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40.0),
                child: Column(children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'SUBTOTAL',
                        style: Theme.of(context).textTheme.headlineSmall,
                      ),
                      Text(
                        '\$${cart.subtotalString}',
                        style: Theme.of(context).textTheme.headlineSmall,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'DELIVERY FEE',
                        style: Theme.of(context).textTheme.headlineSmall,
                      ),
                      Text(
                        '\$${cart.deliveryFeeString}',
                        style: Theme.of(context).textTheme.headlineSmall,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                ]),
              ),
              const Divider(thickness: 1),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40.0),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'TOTAL',
                          style: Theme.of(context).textTheme.headlineSmall,
                        ),
                        Text(
                          '\$${cart.totalString}',
                          style: Theme.of(context).textTheme.headlineSmall,
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.black,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          vertical: 10.0,
                        ),
                        child: Text(
                          'GO TO CHECHKOUT',
                          style: Theme.of(context)
                              .textTheme
                              .displaySmall!
                              .copyWith(
                                color: Colors.white,
                              ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
