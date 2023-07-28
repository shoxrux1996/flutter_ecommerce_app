import 'package:flutter/material.dart';

class CustomNetworkImage extends StatelessWidget {
  final String url;
  final Widget placeholder;
  final double? width;

  const CustomNetworkImage({
    super.key,
    required this.url,
    this.placeholder = const Placeholder(),
    this.width,
  });

  @override
  Widget build(BuildContext context) {
    return Image.network(
      url,
      width: width,
      fit: BoxFit.cover,
      loadingBuilder: (context, child, loadingProgress) {
        if (loadingProgress == null) {
          return child;
        }

        return placeholder;
      },
      errorBuilder: (context, error, stackTrace) {
        return placeholder;
      },
    );
  }
}
