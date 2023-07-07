part of 'cart_bloc.dart';

abstract class CartEvent extends Equatable {
  const CartEvent();

  @override
  List<Object> get props => [];
}

final class LoadCartEvent extends CartEvent {}

final class AddProductToCartEvent extends CartEvent {
  final Product product;
  final int quantity;

  const AddProductToCartEvent({
    required this.product,
    required this.quantity,
  });

  @override
  List<Object> get props => [product, quantity];
}

final class UpdateCartItemEvent extends CartEvent {
  final CartItem item;
  final int quantity;

  const UpdateCartItemEvent({
    required this.item,
    required this.quantity,
  });

  @override
  List<Object> get props => [item, quantity];
}

class RemoveProductFromCartEvent extends CartEvent {
  final CartItem item;
  const RemoveProductFromCartEvent(this.item);

  @override
  List<Object> get props => [item];
}
