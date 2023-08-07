import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ecommerce_app/blocs/blocs.dart';
import 'package:flutter_ecommerce_app/models/models.dart';
import 'package:flutter_ecommerce_app/widgets/widgets.dart';

class ProductScreen extends StatefulWidget {
  final int productId;

  const ProductScreen({
    super.key,
    required this.productId,
  });

  static const String routeName = '/product';

  static Route route({required int productId}) {
    return MaterialPageRoute(
      settings: const RouteSettings(name: routeName),
      builder: (_) => ProductScreen(
        productId: productId,
      ),
    );
  }

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  Map<String, List<ProductOption>> variants = {};
  Map<String, String> selectedOptions = {};

  @override
  void initState() {
    super.initState();
    SchedulerBinding.instance.addPostFrameCallback((_) {
      context.read<ProductBloc>().add(
            LoadProductEvent(
              productId: widget.productId,
            ),
          );
    });
  }

  Product get product =>
      (context.read<ProductBloc>().state as ProductLoadedState).product;

  List<Product> get items {
    return [...product.chidlren, product];
  }

  Product get selectedProduct {
    if (selectedOptions.isEmpty) {
      return items.first;
    }

    var filteredItems = items.firstWhere(
      (element) {
        var filteredOptions = element.options.where((element) {
          return selectedOptions[element.type] == element.name;
        });

        return filteredOptions.length == selectedOptions.length;
      },
      orElse: () => items.first,
    );

    return filteredItems;
  }

  bool isOptionDisabled(ProductOption option) {
    if (selectedOptions.isEmpty) {
      return false;
    }
    var combinedSelectedOptions = {...selectedOptions};

    combinedSelectedOptions[option.type] = option.name;

    return items.where(
      (element) {
        var filteredOptions = element.options.where((element) {
          return combinedSelectedOptions[element.type] == element.name;
        });

        return filteredOptions.length == combinedSelectedOptions.length;
      },
    ).isEmpty;
  }

  void updateSelectedOptions(String type, String title) {
    var newSelectedOptions = Map.of(selectedOptions);

    if (newSelectedOptions[type] == title) {
      newSelectedOptions.remove(type);
    } else {
      newSelectedOptions[type] = title;
    }

    setState(() {
      selectedOptions = newSelectedOptions;
    });
  }

  void updateOptions(String type, String title) {
    updateSelectedOptions(type, title);

    var newVariants = Map.of(variants).map(
      (String key, List<ProductOption> value) => MapEntry(
        key,
        List.of(value)
            .map(
              (e) => e.copyWith(
                selected: selectedOptions[e.type] == e.name,
                disabled: isOptionDisabled(e),
              ),
            )
            .toList(),
      ),
    );

    setState(() {
      variants = newVariants;
    });
  }

  void addToCart() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Product added to cart!'),
      ),
    );
    context.read<CartBloc>().add(
          AddProductToCartEvent(product: selectedProduct, quantity: 1),
        );
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProductBloc, ProductState>(
      listener: (context, state) {
        if (state is ProductLoadedState) {
          setState(() {
            variants = state.variants;
          });
        }
      },
      builder: (context, productState) {
        if (productState is ProductLoadingState) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (productState is ProductLoadedState) {
          return BlocBuilder<CartBloc, CartState>(
            builder: (context, cartState) {
              return ProductView(
                product: productState.product,
                selectedProduct: selectedProduct,
                variants: variants,
                updateOptions: updateOptions,
                addToCart: cartState is CartLoadedState ? addToCart : null,
              );
            },
          );
        } else {
          return const Center(
            child: Text('something went wrong'),
          );
        }
      },
    );
  }
}


// Padding(
//   padding: const EdgeInsets.symmetric(horizontal: 20.0),
//   child: ExpansionTile(
//     initiallyExpanded: true,
//     title: Text(
//       'Product Information',
//       style: Theme.of(context).textTheme.displaySmall,
//     ),
//     children: [
//       ListTile(
//         title: Text(
//           'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry, standard dummy text ever since the 1500s',
//           style: Theme.of(context).textTheme.bodyLarge,
//         ),
//       ),
//     ],
//   ),
// ),
// Padding(
//   padding: const EdgeInsets.symmetric(horizontal: 20.0),
//   child: ExpansionTile(
//     initiallyExpanded: true,
//     title: Text(
//       'Delivery Information',
//       style: Theme.of(context).textTheme.displaySmall,
//     ),
//     children: [
//       ListTile(
//         title: Text(
//           'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s',
//           style: Theme.of(context).textTheme.bodyLarge,
//         ),
//       ),
//     ],
//   ),
// ),
