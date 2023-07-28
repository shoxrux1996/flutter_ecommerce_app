import 'package:flutter/material.dart';

class SectionTitle extends StatelessWidget {
  final String title;
  final VoidCallback? onPressed;
  final TextStyle? textStyle;

  const SectionTitle({
    super.key,
    required this.title,
    this.onPressed,
    this.textStyle,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: textStyle ?? Theme.of(context).textTheme.displaySmall,
        ),
        if (onPressed != null)
          IconButton(
            iconSize: 32,
            onPressed: onPressed,
            icon: const Icon(Icons.more_horiz),
          ),
          
      ],
    );
  }
}
