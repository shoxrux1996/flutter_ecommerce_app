import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ecommerce_app/blocs/navbar/navbar_cubit.dart';
import 'package:flutter_ecommerce_app/widgets/appbar/custom_bottom_appbar.dart';

class DefaultBottomAppBar extends StatelessWidget {
  const DefaultBottomAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CustomBottomAppBar(
      widget: BlocBuilder<NavbarCubit, NavbarState>(
        builder: (context, state) {
          var firstActive = state.index == 0;
          var secondActive = state.index == 1;
          var thirdActive = state.index == 2;
          return BottomNavigationBar(
              backgroundColor: Colors.black,
              currentIndex: 0,
              showSelectedLabels: false,
              showUnselectedLabels: false,
              items: [
                BottomNavigationBarItem(
                    icon: HomeNavbarItem(
                      active: firstActive,
                      iconData: Icons.home,
                    ),
                    label: 'Home'),
                BottomNavigationBarItem(
                  icon: HomeNavbarItem(
                    active: secondActive,
                    iconData: Icons.shopping_cart,
                  ),
                  label: 'Cart',
                ),
                BottomNavigationBarItem(
                  icon: HomeNavbarItem(
                    active: thirdActive,
                    iconData: Icons.person,
                  ),
                  label: 'Profile',
                ),
              ],
              onTap: (index) {
                context.read<NavbarCubit>().setTab(index);
              });
        },
      ),
    );
  }
}

class HomeNavbarItem extends StatelessWidget {
  final bool active;
  final IconData iconData;

  const HomeNavbarItem({
    super.key,
    required this.active,
    required this.iconData,
  });

  @override
  Widget build(BuildContext context) {
    var color = active ? Colors.white : Colors.transparent;
    return Column(
      children: [
        FractionallySizedBox(
          widthFactor: 0.5,
          child: Container(
            margin: const EdgeInsets.only(bottom: 4.0),
            height: 4,
            decoration: BoxDecoration(
              color: color,
              borderRadius: const BorderRadius.all(
                Radius.circular(12),
              ),
            ),
          ),
        ),
        Icon(
          iconData,
          color: Colors.white,
        ),
      ],
    );
  }
}
