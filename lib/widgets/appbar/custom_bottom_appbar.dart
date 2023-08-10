import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/widgets/widgets.dart';

class CustomBottomAppBar extends StatelessWidget {
  final Widget widget;
  final Color color;
  final double height;

  const CustomBottomAppBar({
    super.key,
    required this.widget,
    this.color = Colors.black,
    this.height = 70.0,
  });

  factory CustomBottomAppBar.defaultBottomAppBar() {
    return const CustomBottomAppBar(
      widget: HomeBottomAppBar(),
    );
  }

  factory CustomBottomAppBar.checkoutBottomAppBar({required double total}) {
    return CustomBottomAppBar(
      color: Colors.white,
      height: 100,
      widget: CheckoutBottomAppBar(
        total: total,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      color: color,
      child: SizedBox(
        height: height,
        child: widget,
      ),
    );
  }
}
