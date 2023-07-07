part of 'cart_bloc.dart';

abstract class CartState extends Equatable {
  const CartState();

  @override
  List<Object> get props => [];
}

final class CartLoadingState extends CartState {
  @override
  List<Object> get props => [];
}

class CartLoadedState extends CartState {
  final Cart cart;

  const CartLoadedState({this.cart = const Cart()});

  @override
  List<Object> get props => [cart];
}

final class CartErrorState extends CartState {
  @override
  List<Object> get props => [];
}
