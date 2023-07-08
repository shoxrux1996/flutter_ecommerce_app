import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'navbar_state.dart';

class NavbarCubit extends Cubit<NavbarState> {
  NavbarCubit() : super(const NavbarState());

  void setTab(int index) {
    switch (index) {
      case 0:
        emit(const NavbarState(item: NavbarItem.home));
      case 1:
        emit(const NavbarState(item: NavbarItem.cart));
      case 2:
        emit(const NavbarState(item: NavbarItem.profile));
    }
  }
}
