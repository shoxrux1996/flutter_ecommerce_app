import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/widgets/widgets.dart';

class CustomBottomAppBar extends StatelessWidget {
  final Widget widget;

  const CustomBottomAppBar({
    super.key,
    required this.widget,
  });

  factory CustomBottomAppBar.defaultBottomAppBar() {
    return const CustomBottomAppBar(
      widget: HomeBottomAppBar(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      color: Colors.black,
      child: SizedBox(
        height: 70,
        child: widget,
      ),
    );
  }
}
