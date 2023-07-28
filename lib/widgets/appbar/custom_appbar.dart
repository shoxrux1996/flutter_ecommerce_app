import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/widgets/title/custom_appbar_title.dart';

class CustomAppBar extends StatelessWidget implements PreferredSize {
  final Widget? title;
  final Widget? leading;
  final List<Widget> actions;

  const CustomAppBar({
    super.key,
    this.title,
    this.leading,
    this.actions = const [],
  });

  factory CustomAppBar.defaultAppBar({
    required String title,
    Widget? leading,
    List<Widget> actions = const [],
  }) {
    return CustomAppBar(
      title: CustomAppBarTitle(
        title: title,
      ),
      leading: leading,
      actions: actions,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(50);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      title: title,
      iconTheme: const IconThemeData(
        color: Colors.black,
      ),
      actions: actions,
      leading: leading,
    );
  }

  @override
  Widget get child => throw UnimplementedError();
}
