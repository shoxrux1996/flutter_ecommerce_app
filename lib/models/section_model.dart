import 'package:equatable/equatable.dart';
import 'package:flutter_ecommerce_app/models/models.dart';

class Section extends Equatable {
  final String name;
  final List<Product> products;
  final bool hasMore;
  final Map? params;

  const Section(this.name, this.products, this.hasMore, this.params);

  @override
  List<Object?> get props => [name, products, hasMore, params];

  static List<Section> sections = [
    Section(
      'RECOMMENDED',
      Product.products
        ..where(
          (product) => product.isRecommended,
        ),
      true,
      const {'category_id': 1},
    ),
    Section(
      'MOST POPULAR',
      Product.products
        ..where(
          (product) => product.isPopular,
        ),
      true,
      const {'category_id': 2},
    ),
    Section(
      'HOT PRODUCTS',
      Product.products
        ..shuffle()
        ..getRange(0, 4),
      false,
      const {'category_id': 2},
    ),
  ];
}
