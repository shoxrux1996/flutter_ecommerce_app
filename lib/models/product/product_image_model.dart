import 'package:equatable/equatable.dart';

class ProductImage extends Equatable {
  final int id;
  final String src;

  const ProductImage(this.id, this.src);

  @override
  List<Object?> get props => [id, src];
}
