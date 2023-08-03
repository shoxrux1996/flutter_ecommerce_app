import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ecommerce_app/blocs/blocs.dart';
import 'package:flutter_ecommerce_app/config/app_router.dart';
import 'package:flutter_ecommerce_app/config/theme.dart';
import 'package:flutter_ecommerce_app/screens/screens.dart';
import 'package:flutter_ecommerce_app/simple_bloc_observer.dart';

void main() {
  Bloc.observer = const SimpleBlocObserver();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => NavbarCubit(),
        ),
        BlocProvider(
          create: (_) => WishlistBloc()..add(LoadWishlistEvent()),
        ),
        BlocProvider(
          create: (_) => CartBloc()..add(LoadCartEvent()),
        ),
        BlocProvider(
          create: (_) => MenuBloc()..add(LoadMenuEvent()),
        ),
        BlocProvider(
          create: (_) => SectionBloc()..add(LoadSectionEvent()),
        ),
        BlocProvider(
          create: (_) => ProductBloc(),
        ),
      ],
      child: MaterialApp(
        title: 'E-shop',
        theme: theme(),
        onGenerateRoute: AppRouter.onGenerateRoute,
        initialRoute: RootScreen.routeName,
      ),
    );
  }
}
