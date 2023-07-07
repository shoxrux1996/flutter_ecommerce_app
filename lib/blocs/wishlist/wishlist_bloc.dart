import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_ecommerce_app/models/models.dart';

part 'wishlist_event.dart';
part 'wishlist_state.dart';

class WishlistBloc extends Bloc<WishlistEvent, WishlistState> {
  WishlistBloc() : super(WishlistLoadingState()) {
    on<LoadWishlistEvent>(_onLoadWishlist);
    on<AddProductToWishlistEvent>(_onAddProductToWishlist);
    on<RemoveProductFromWishlistEvent>(_onRemoveProductFromWishlist);
  }

  void _onLoadWishlist(
    LoadWishlistEvent event,
    Emitter<WishlistState> emit,
  ) async {
    emit(WishlistLoadingState());
    try {
      await Future.delayed(const Duration(seconds: 1));
      emit(const WishlistLoadedState());
    } on Exception {
      emit(WishlistErrorState());
    }
  }

  void _onAddProductToWishlist(
    AddProductToWishlistEvent event,
    Emitter<WishlistState> emit,
  ) {
    final state = this.state;
    if (state is WishlistLoadedState) {
      try {
        emit(
          WishlistLoadedState(
            wishlist: Wishlist(
              products: List.from(state.wishlist.products)..add(event.product),
            ),
          ),
        );
      } on Exception {
        emit(
          WishlistErrorState(),
        );
      }
    }
  }

  void _onRemoveProductFromWishlist(
    RemoveProductFromWishlistEvent event,
    Emitter<WishlistState> emit,
  ) {
    final state = this.state;
    if (state is WishlistLoadedState) {
      try {
        emit(
          WishlistLoadedState(
            wishlist: Wishlist(
              products: List.from(state.wishlist.products)
                ..remove(event.product),
            ),
          ),
        );
      } on Exception {
        emit(
          WishlistErrorState(),
        );
      }
    }
  }
}
