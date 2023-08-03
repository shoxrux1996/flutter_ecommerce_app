import 'package:equatable/equatable.dart';

class ProductOption extends Equatable {
  final int id;
  final String? img;
  final String name;
  final String originalName;
  final String type;
  final bool selected;
  final bool disabled;

  const ProductOption({
    required this.id,
    required this.img,
    required this.name,
    required this.originalName,
    required this.type,
    this.selected = false,
    this.disabled = false,
  });

  ProductOption copyWith({bool? selected, bool? disabled}) {
    return ProductOption(
      id: id,
      img: img,
      name: name,
      originalName: originalName,
      type: type,
      selected: selected ?? this.selected,
      disabled: disabled ?? this.selected,
    );
  }

  @override
  List<Object?> get props => [id, img, name, originalName, type];

  static Map<String, List<ProductOption>> variants = {
    'Color': const [
      ProductOption(
        id: 1,
        img: null,
        name: 'Dashing color Balance',
        originalName: 'Dashing color Balance',
        type: 'Color',
      ),
      ProductOption(
        id: 2,
        img: null,
        name: 'Dashing color Bliss',
        originalName: 'Dashing color Bliss',
        type: 'Color',
      ),
      ProductOption(
        id: 3,
        img: null,
        name: 'Dashing color Charisma',
        originalName: 'Dashing color Charisma',
        type: 'Color',
      ),
    ],
    'Fabric': const [
      ProductOption(
        id: 41,
        img: null,
        name: 'Non Directional Uph Fabric Giselle Dove (apply RR)',
        originalName: 'Non Directional Uph Fabric Giselle Dove (apply RR)',
        type: 'Fabric',
      ),
      ProductOption(
        id: 42,
        img: null,
        name: 'Non Directional Uph Fabric Giselle Hunter (apply RR)',
        originalName: 'Non Directional Uph Fabric Giselle Hunter (apply RR)',
        type: 'Fabric',
      ),
      ProductOption(
        id: 43,
        img: null,
        name: 'Non Directional Uph Fabric Giselle Navy (apply RR)',
        originalName: 'Non Directional Uph Fabric Giselle Navy (apply RR)',
        type: 'Fabric',
      ),
    ]
  };
}
