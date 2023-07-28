import 'package:flutter/material.dart';

class CustomAppBarTitle extends StatelessWidget {
  final String title;

  const CustomAppBarTitle({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      padding: const EdgeInsets.symmetric(
        horizontal: 20.0,
        vertical: 10.0,
      ),
      child: Text(
        title,
        overflow: TextOverflow.ellipsis,
        style: Theme.of(context).textTheme.displayMedium!.copyWith(
              color: Colors.white,
            ),
      ),
    );
  }
}
