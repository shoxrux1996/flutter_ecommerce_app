import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ecommerce_app/blocs/navbar/navbar_cubit.dart';
import 'package:flutter_ecommerce_app/screens/screens.dart';

class RootScreen extends StatefulWidget {
  const RootScreen({super.key});

  static const String routeName = '/';

  static Route route() {
    return MaterialPageRoute(
      settings: const RouteSettings(name: routeName),
      builder: (_) => const RootScreen(),
    );
  }

  @override
  State<RootScreen> createState() => _RootScreenState();
}

class _RootScreenState extends State<RootScreen> {
  final _keys = [
    GlobalKey<NavigatorState>(),
    GlobalKey<NavigatorState>(),
    GlobalKey<NavigatorState>(),
  ];

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NavbarCubit, NavbarState>(
      builder: (context, state) {
        return IndexedStack(
          index: state.index,
          children: [
            _buildOffstageNavigator(
              state.index,
              0,
              _keys[0],
              const HomeScreen(),
            ),
            _buildOffstageNavigator(
              state.index,
              1,
              _keys[1],
              const CartScreen(),
            ),
            _buildOffstageNavigator(
              state.index,
              2,
              _keys[2],
              const ProfileScreen(),
            ),
          ],
        );
      },
    );
  }

  Widget _buildOffstageNavigator(
    int currentIndex,
    int index,
    Key key,
    Widget widget,
  ) {
    return Offstage(
      offstage: currentIndex != index,
      child: Navigator(
        key: key,
        initialRoute: RootScreen.routeName,
        onGenerateRoute: (settings) {
          return MaterialPageRoute(
            builder: (context) => widget,
          );
        },
      ),
    );
  }
}
