part of 'wishlist_bloc.dart';

abstract class WishlistEvent extends Equatable {
  const WishlistEvent();

  @override
  List<Object> get props => [];
}

class LoadWishlistEvent extends WishlistEvent {}

class AddProductToWishlistEvent extends WishlistEvent {
  final Product product;

  const AddProductToWishlistEvent(this.product);

  @override
  List<Object> get props => [product];
}

class RemoveProductFromWishlistEvent extends WishlistEvent {
  final Product product;

  const RemoveProductFromWishlistEvent(this.product);

  @override
  List<Object> get props => [product];
}
