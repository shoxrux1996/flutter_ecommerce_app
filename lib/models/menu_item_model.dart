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
      name: 'Soft Drinks',
      children: [
        MenuItem(
          id: 10,
          name: 'Water',
          children: [],
        ),
        MenuItem(
          id: 10,
          name: 'Spirits',
          children: [],
        ),
        MenuItem(
          id: 10,
          name: 'Carbonated drinks',
          children: [],
        ),
        MenuItem(
          id: 10,
          name: 'Juice and plant drinks.',
          children: [],
        ),
        MenuItem(
          id: 10,
          name: 'Wine',
          children: [],
        ),
      ],
    ),
    MenuItem(
      id: 2,
      name: 'Smoothies',
      children: [
        MenuItem(
          id: 11,
          name: 'Water',
          children: [],
        ),
        MenuItem(
          id: 11,
          name: 'Spirits',
          children: [],
        ),
        MenuItem(
          id: 11,
          name: 'Carbonated drinks',
          children: [],
        ),
        MenuItem(
          id: 11,
          name: 'Juice and plant drinks.',
          children: [],
        ),
        MenuItem(
          id: 11,
          name: 'Wine',
          children: [],
        ),
        MenuItem(
          id: 11,
          name: 'Cider',
          children: [],
        ),
        MenuItem(
          id: 11,
          name: 'Beer',
          children: [],
        ),
      ],
    ),
    MenuItem(
      id: 3,
      name: 'Water',
      children: [],
    ),
    MenuItem(
      id: 4,
      name: 'Spirits',
      children: [],
    ),
    MenuItem(
      id: 5,
      name: 'Carbonated drinks',
      children: [],
    ),
    MenuItem(
      id: 6,
      name: 'Juice and plant drinks.',
      children: [],
    ),
    MenuItem(
      id: 7,
      name: 'Wine',
      children: [],
    ),
    MenuItem(
      id: 8,
      name: 'Cider',
      children: [],
    ),
    MenuItem(
      id: 9,
      name: 'Beer',
      children: [],
    ),
  ];
}
