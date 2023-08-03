part of 'product_bloc.dart';

abstract class ProductState extends Equatable {
  const ProductState();

  @override
  List<Object> get props => [];
}

class ProductLoadingState extends ProductState {
  @override
  List<Object> get props => [];
}

class ProductLoadedState extends ProductState {
  final Product product;
  final Map<String, List<ProductOption>> variants;

  const ProductLoadedState({
    required this.product,
    required this.variants,
  });

  @override
  List<Object> get props => [product, variants];
}

class ProductErrorState extends ProductState {}
