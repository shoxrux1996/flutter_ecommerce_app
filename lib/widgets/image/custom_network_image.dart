import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CustomNetworkImage extends StatelessWidget {
  final String url;
  final Widget placeholder;
  final BoxFit fit;
  final double? width;
  final double? height;

  const CustomNetworkImage({
    super.key,
    required this.url,
    this.fit = BoxFit.cover,
    this.placeholder = const Placeholder(),
    this.width,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: url,
      width: width,
      height: height,
      fit: fit,
      placeholder: (context, url) => placeholder,
      errorWidget: (context, url, error) {
        return placeholder;
      },
    );
  }
}
