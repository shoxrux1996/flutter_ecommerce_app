import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ecommerce_app/blocs/navbar/navbar_cubit.dart';

import 'package:flutter_ecommerce_app/screens/screens.dart';

class RootScreen extends StatelessWidget {
  const RootScreen({super.key});

  static const String routeName = '/';

  static Route route() {
    return MaterialPageRoute(
      settings: const RouteSettings(name: routeName),
      builder: (_) => const RootScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NavbarCubit, NavbarState>(
      builder: (context, state) {
        if (state.item == NavbarItem.home) {
          return const HomeScreen();
        } else if (state.item == NavbarItem.cart) {
          return const CartScreen();
        } else if (state.item == NavbarItem.profile) {
          return const ProfileScreen();
        }
        return const Placeholder();
      },
    );
  }
}
