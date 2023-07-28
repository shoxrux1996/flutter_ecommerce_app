import 'package:flutter/material.dart';

class CustomBox extends StatelessWidget {
  final Widget widget;

  const CustomBox({super.key, required this.widget});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: MediaQuery.of(context).size.width,
          height: 60,
          alignment: Alignment.bottomCenter,
          color: Colors.black.withAlpha(50),
        ),
        Container(
          padding: const EdgeInsets.all(5.0),
          margin: const EdgeInsets.all(5.0),
          width: MediaQuery.of(context).size.width - 10,
          height: 50,
          color: Colors.black,
          child: widget,
        ),
      ],
    );
  }
}
