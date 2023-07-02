import 'package:flutter/material.dart';

class CustomNavBar extends StatelessWidget {
  final Widget widget;

  const CustomNavBar({
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
