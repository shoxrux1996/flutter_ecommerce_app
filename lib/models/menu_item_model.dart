import 'package:equatable/equatable.dart';

class MenuItem extends Equatable {
  final int id;
  final String name;
  final List<MenuItem> children;

  const MenuItem({
    required this.id,
    required this.name,
    required this.children,
  });

  @override
  List<Object?> get props => [id, name, children];

  static List<MenuItem> items = const [
    MenuItem(
      id: 1,
      name: 'ARTWORK & MIRRORS',
      children: [
        MenuItem(
          id: 10,
          name: 'Artwork - Standard Frames',
          children: [],
        ),
      ],
    ),
    MenuItem(
      id: 2,
      name: 'BED COVERINGS',
      children: [
        MenuItem(
          id: 11,
          name: 'Pre-made Bedspreads',
          children: [],
        ),
      ],
    ),
    MenuItem(
      id: 3,
      name: 'BEDS & FRAMES',
      children: [],
    ),
    MenuItem(
      id: 4,
      name: 'EQUIPMENT',
      children: [
        MenuItem(
          id: 12,
          name: 'PTAC Units & Controllers',
          children: [],
        ),
        MenuItem(
          id: 13,
          name: 'TVs-DVDs- Accessories',
          children: [],
        ),
        MenuItem(
          id: 14,
          name: 'Refrigerators',
          children: [],
        ),
        MenuItem(
          id: 15,
          name: 'Microwaves',
          children: [],
        ),
        MenuItem(
          id: 16,
          name: 'Alarm Clocks',
          children: [],
        ),
      ],
    ),
    MenuItem(
      id: 5,
      name: 'FLOOR COVERINGS',
      children: [],
    ),
    MenuItem(
      id: 6,
      name: 'FURNITURE',
      children: [],
    ),
    MenuItem(
      id: 7,
      name: 'LIGHTING',
      children: [],
    ),
    MenuItem(
      id: 8,
      name: 'PUBLIC AREAS',
      children: [],
    ),
    MenuItem(
      id: 9,
      name: 'SEATING',
      children: [],
    ),
  ];

  factory MenuItem.menu() => MenuItem(
        id: 0,
        name: 'Root',
        children: MenuItem.items,
      );
}
