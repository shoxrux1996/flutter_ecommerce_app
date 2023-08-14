import 'package:equatable/equatable.dart';

class Category extends Equatable {
  final String name;
  final String imageUrl;

  const Category({
    required this.name,
    required this.imageUrl,
  });

  @override
  List<Object?> get props => [name, imageUrl];

  static List<Category> categories = [
    const Category(
      name: 'Bed Coverings',
      imageUrl:
          '/storage/products/catalog/13_Linens/ValCal180Sheets.jpg', //https://unsplash.com/photos/5lZhD2qQ2SE
    ),
    const Category(
      name: 'Beds & frames',
      imageUrl:
          '/storage/products/January2023/Q0TPCzKRK3oj6AzFk4Wc.JPG', //https://unsplash.com/photos/m741tj4Cz7M
    ),
    const Category(
      name: 'Equipment',
      imageUrl:
          '/storage/products/July2023/n5GCWHcF8N587enb8s0Q.JPG', //https://unsplash.com/photos/7Zlds3gm7NU
    ),
  ];
}
