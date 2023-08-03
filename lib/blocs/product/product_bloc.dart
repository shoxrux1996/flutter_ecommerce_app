import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ecommerce_app/models/models.dart';

part 'product_event.dart';
part 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  ProductBloc() : super(ProductLoadingState()) {
    on<LoadProductEvent>(
      (event, emit) async {
        emit(ProductLoadingState());
        try {
          await Future.delayed(const Duration(seconds: 2));
          final Product product = Product.products[0];
          final Map<String, List<ProductOption>> variants =
              ProductOption.variants;
          emit(
            ProductLoadedState(
              product: product,
              variants: variants,
            ),
          );
        } catch (_) {
          emit(ProductErrorState());
        }
      },
    );
  }
}
