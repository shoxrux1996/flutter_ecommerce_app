part of 'navbar_cubit.dart';

class NavbarState extends Equatable {
  final int index;

  const NavbarState({this.index = 0});

  @override
  List<Object> get props => [index];
}
