import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/widgets/navbars/custom_navbar.dart';

class GoToCheckoutNavBar extends StatelessWidget {
  const GoToCheckoutNavBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CustomNavBar(
      widget: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ElevatedButton(
            onPressed: () {
              Navigator.pushNamed(context, '/checkout');
            },
            style: ElevatedButton.styleFrom(backgroundColor: Colors.white),
            child: Text(
              'GO TO CHECKOUT',
              style: Theme.of(context).textTheme.displaySmall,
            ),
          )
        ],
      ),
    );
  }
}
