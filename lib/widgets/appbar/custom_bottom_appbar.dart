import 'package:flutter/material.dart';

class CustomBottomAppBar extends StatelessWidget {
  final Widget widget;

  const CustomBottomAppBar({
    super.key,
    required this.widget,
  });

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
