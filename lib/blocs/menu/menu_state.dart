part of 'menu_bloc.dart';

abstract class MenuState extends Equatable {
  const MenuState();

  @override
  List<Object> get props => [];
}

class MenuLoadingState extends MenuState {}

class MenuLoadedState extends MenuState {
  final MenuItem menuItem;

  const MenuLoadedState({
    required this.menuItem,
  });

  @override
  List<Object> get props => [menuItem];
}

class MenuErrorState extends MenuState {}
