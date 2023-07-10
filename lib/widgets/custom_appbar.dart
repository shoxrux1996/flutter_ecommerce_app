import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/screens/screens.dart';

class CustomAppBar extends StatelessWidget implements PreferredSize {
  final String title;

  const CustomAppBar({
    super.key,
    required this.title,
  });

  @override
  Size get preferredSize => const Size.fromHeight(50);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      title: Container(
        color: Colors.black,
        padding: const EdgeInsets.symmetric(
          horizontal: 20.0,
          vertical: 10.0,
        ),
        child: Text(
          title,
          style: Theme.of(context).textTheme.displayMedium!.copyWith(
                color: Colors.white,
              ),
        ),
      ),
      iconTheme: const IconThemeData(
        color: Colors.black,
      ),
      actions: [
        IconButton(
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => const WishlistScreen(),
              ),
            );
          },
          icon: const Icon(Icons.favorite),
        )
      ],
    );
  }

  @override
  Widget get child => throw UnimplementedError();
}
