import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ecommerce_app/blocs/navbar/navbar_cubit.dart';
import 'package:flutter_ecommerce_app/widgets/navbars/custom_navbar.dart';

class HomeNavBar extends StatelessWidget {
  const HomeNavBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CustomNavBar(
      widget: BlocBuilder<NavbarCubit, NavbarState>(
        builder: (context, state) {
          return BottomNavigationBar(
              backgroundColor: Colors.black,
              currentIndex: 0,
              showSelectedLabels: false,
              showUnselectedLabels: false,
              items: const [
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.home,
                    color: Colors.white,
                  ),
                  label: 'Home',
                ),
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.shopping_cart,
                    color: Colors.white,
                  ),
                  label: 'Cart',
                ),
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.person,
                    color: Colors.white,
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
