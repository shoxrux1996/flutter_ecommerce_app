import 'package:equatable/equatable.dart';

class ProductOption extends Equatable {
  final int id;
  final String? img;
  final String name;
  final String originalName;
  final String type;

  const ProductOption(this.id, this.img, this.name, this.originalName, this.type);

  @override
  List<Object?> get props => [id, img, name, originalName, type];
}
