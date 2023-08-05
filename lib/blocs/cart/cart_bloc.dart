import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ecommerce_app/models/models.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc() : super(CartLoadingState()) {
    on<LoadCartEvent>(_onLoadCart);
    on<AddProductToCartEvent>(_addProductToCart);
    on<UpdateCartItemEvent>(_updateCartItem);
    on<RemoveProductFromCartEvent>(_removeProductFromCart);
  }

  void _onLoadCart(
    LoadCartEvent event,
    Emitter<CartState> emit,
  ) async {
    emit(CartLoadingState());
    try {
      await Future.delayed(
        const Duration(
          seconds: 1,
        ),
      );
      emit(const CartLoadedState());
    } on Exception {
      emit(CartErrorState());
    }
  }

  void _addProductToCart(
    AddProductToCartEvent event,
    Emitter<CartState> emit,
  ) async {
    final state = this.state;

    if (state is CartLoadedState) {
      try {
        emit(CartLoadingState());

        await Future.delayed(const Duration(seconds: 3));

        final int itemIndex = state.cart.items.indexWhere(
          (element) => element.id == '${event.product.id}',
        );

        List<CartItem> items = [];

        if (itemIndex >= 0) {
          items = List.from(state.cart.items);
          items[itemIndex] = CartItem.fromProduct(
            event.product,
            event.quantity + items[itemIndex].quantity,
          );
        } else {
          items = List.from(state.cart.items)
            ..add(
              CartItem.fromProduct(
                event.product,
                event.quantity,
              ),
            );
        }

        emit(
          CartLoadedState(
            cart: Cart(items: items),
          ),
        );
      } on Exception {
        emit(CartErrorState());
      }
    }
  }

  void _updateCartItem(
    UpdateCartItemEvent event,
    Emitter<CartState> emit,
  ) async {
    final state = this.state;
    if (state is CartLoadedState) {
      try {
        emit(CartLoadingState());

        final int itemIndex = state.cart.items.indexWhere(
          (element) => element.id == event.item.id,
        );

        List<CartItem> items = [];

        items = List.from(state.cart.items);

        items[itemIndex] = CartItem.fromItem(
          event.item,
          event.quantity,
        );

        emit(
          CartLoadedState(
            cart: Cart(items: items),
          ),
        );
      } on Exception {
        emit(CartErrorState());
      }
    }
  }

  void _removeProductFromCart(
    RemoveProductFromCartEvent event,
    Emitter<CartState> emit,
  ) {
    final state = this.state;
    if (state is CartLoadedState) {
      try {
        emit(
          CartLoadedState(
            cart: Cart(
              items: List.from(state.cart.items)..remove(event.item),
            ),
          ),
        );
      } on Exception {
        emit(CartErrorState());
      }
    }
  }
}
