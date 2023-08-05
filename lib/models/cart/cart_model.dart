import 'package:equatable/equatable.dart';
import 'package:flutter_ecommerce_app/models/models.dart';

class Cart extends Equatable {
  final List<CartItem> items;

  const Cart({this.items = const <CartItem>[]});

  int get totalItemsCount => items.fold(
        0,
        (previousValue, element) => previousValue + element.quantity,
      );

  double get subtotal => items.fold(
        0,
        (previousValue, element) =>
            previousValue + element.price * element.quantity,
      );

  double deliveryFee(subtotal) {
    if (subtotal >= 30.0) {
      return 0.0;
    } else {
      return 10.0;
    }
  }

  double total(subtotal, deliveryFee) {
    return subtotal + deliveryFee(subtotal);
  }

  String freeDelivery(subtotal) {
    if (subtotal >= 30) {
      return 'You have free delivery';
    } else {
      double missing = 30.0 - subtotal;
      return 'Add \$${missing.toStringAsFixed(2)} for FREE Delivery';
    }
  }

  String get subtotalString => subtotal.toStringAsFixed(2);

  String get totalString => total(subtotal, deliveryFee).toStringAsFixed(2);

  String get deliveryFeeString => deliveryFee(subtotal).toStringAsFixed(2);

  String get freeDeliveryString => freeDelivery(subtotal);

  @override
  List<Object?> get props => [items];
}
