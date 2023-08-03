part of 'product_bloc.dart';

abstract class ProductEvent extends Equatable {
  const ProductEvent();

  @override
  List<Object> get props => [];
}

class LoadProductEvent extends ProductEvent {
  final int productId;

  const LoadProductEvent({required this.productId});

  @override
  List<Object> get props => [productId];
}

class UpdateProductSelectedEvent extends ProductEvent {
  final Map<String, String> selectedOptions;

  const UpdateProductSelectedEvent({
    required this.selectedOptions,
  });

  @override
  List<Object> get props => [selectedOptions];
}
