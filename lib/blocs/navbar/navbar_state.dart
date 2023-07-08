part of 'navbar_cubit.dart';

class NavbarState extends Equatable {
  final NavbarItem item;

  const NavbarState({this.item = NavbarItem.home});

  @override
  List<Object> get props => [item];
}

enum NavbarItem { home, cart, profile }
