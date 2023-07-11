import 'package:equatable/equatable.dart';
import 'package:flutter_ecommerce_app/models/product_model.dart';

class CartItem extends Equatable {
  final String id;
  final String name;
  final String imageUrl;
  final double price;
  final int quantity;

  const CartItem({
    required this.id,
    required this.name,
    required this.imageUrl,
    required this.price,
    required this.quantity,
  });

  @override
  List<Object?> get props => [
        id,
        name,
        imageUrl,
        price,
        quantity,
      ];

  factory CartItem.fromProduct(Product product, int quantity) => CartItem(
        id: product.id,
        name: product.name,
        imageUrl: product.imageUrl,
        price: product.price,
        quantity: quantity,
      );

  factory CartItem.fromItem(CartItem item, int quantity) => CartItem(
        id: item.id,
        name: item.name,
        imageUrl: item.imageUrl,
        price: item.price,
        quantity: quantity,
      );
}
