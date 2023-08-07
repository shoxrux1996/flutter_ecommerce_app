import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ecommerce_app/blocs/blocs.dart';


class HomeBottomAppBar extends StatelessWidget {
  const HomeBottomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NavbarCubit, NavbarState>(
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
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: CartNavbarItem(
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

class CartNavbarItem extends StatelessWidget {
  final bool active;
  final IconData iconData;

  const CartNavbarItem({
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
        Stack(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 14.0),
              child: Icon(
                iconData,
                color: Colors.white,
              ),
            ),
            BlocBuilder<CartBloc, CartState>(
              buildWhen: (previous, current) =>
                  previous != current && current is CartLoadedState,
              builder: (context, state) {
                if (state is CartLoadedState) {
                  return Positioned(
                    top: 0,
                    right: 0,
                    child: Text(
                      state.cart.totalItemsCount.toString(),
                      style:
                          Theme.of(context).textTheme.headlineSmall!.copyWith(
                                color: Colors.white,
                              ),
                    ),
                  );
                }

                return Container();
              },
            ),
          ],
        ),
      ],
    );
  }
}
