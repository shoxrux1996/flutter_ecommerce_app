import 'package:equatable/equatable.dart';
import 'package:flutter_ecommerce_app/models/models.dart';

class Product extends Equatable {
  final int id;
  final String slug;
  final String name;
  final String mainImage;
  final double price;
  final double originalPrice;
  final double? minPrice;
  final double? maxPrice;
  final String? uomCode;
  final List<Product> chidlren;
  final List<ProductImage> images;
  final List<ProductOption> options;

  const Product({
    required this.id,
    required this.slug,
    required this.name,
    required this.mainImage,
    required this.price,
    required this.originalPrice,
    this.minPrice,
    this.maxPrice,
    this.uomCode,
    this.chidlren = const [],
    this.images = const [],
    this.options = const [],
  });

  List<String> get allImages => images.map((e) => e.src).toList();

  @override
  List<Object?> get props => [id];

  @override
  String toString() {
    return 'Product #id:$id';
  }

  static List<Product> products = [
    const Product(
      id: 1,
      slug: 'val-cale-white-standard-pillow-case-2inhem42x34',
      name: 'Val Cale: White Standard Pillow Case, 2inHem,42x34',
      mainImage: "/storage/products/January2023/Q0TPCzKRK3oj6AzFk4Wc.JPG",
      price: 17.500000,
      originalPrice: 22.00,
      minPrice: 31.000000,
      maxPrice: 116.900000,
      uomCode: 'DZ',
      chidlren: [
        Product(
          id: 2,
          slug: 'val-cale-white-queen-long-flat-sheet-90x115',
          name: 'Val Cale: White Queen Long Flat Sheet, 90x115',
          mainImage: "products\\catalog\\13_Linens\\ValCal180Sheets.jpg",
          price: 116.900000,
          originalPrice: 0.00,
          minPrice: 0,
          maxPrice: 0,
          uomCode: 'DZ',
          chidlren: [],
          images: [],
          options: [
            ProductOption(
              id: 2,
              img: null,
              name: 'Dashing color Bliss',
              originalName: 'Dashing color Bliss',
              type: 'Color',
            ),
            ProductOption(
              id: 42,
              img: null,
              name: 'Non Directional Uph Fabric Giselle Hunter (apply RR)',
              originalName:
                  'Non Directional Uph Fabric Giselle Hunter (apply RR)',
              type: 'Fabric',
            ),
          ],
        ),
        Product(
          id: 3,
          slug: 'val-cale-white-queen-fitted-sheet-60x80x12',
          name: 'Val Cale: White Queen Fitted Sheet, 60x80x12',
          mainImage: "/storage/products/January2023/Q0TPCzKRK3oj6AzFk4Wc.JPG",
          price: 114.200000,
          originalPrice: 0,
          minPrice: 0,
          maxPrice: 0,
          uomCode: 'DZ',
          chidlren: [],
          images: [
            ProductImage(
              1,
              '/storage/products/January2023/Q0TPCzKRK3oj6AzFk4Wc.JPG',
            ),
            ProductImage(
              2,
              '/storage/products/July2023/nsLNVgWPR2rxuKEZ0TFC.JPG',
            ),
            ProductImage(
              3,
              '/storage/products/July2023/n5GCWHcF8N587enb8s0Q.JPG',
            ),
          ],
          options: [
            ProductOption(
              id: 1,
              img: null,
              name: 'Dashing color Balance',
              originalName: 'Dashing color Balance',
              type: 'Color',
            ),
            ProductOption(
              id: 41,
              img: null,
              name: 'Non Directional Uph Fabric Giselle Dove (apply RR)',
              originalName:
                  'Non Directional Uph Fabric Giselle Dove (apply RR)',
              type: 'Fabric',
            ),
          ],
        ),
      ],
      images: [
        ProductImage(
          1,
          '/storage/products/January2023/Q0TPCzKRK3oj6AzFk4Wc.JPG',
        ),
        ProductImage(
          2,
          '/storage/products/July2023/nsLNVgWPR2rxuKEZ0TFC.JPG',
        ),
        ProductImage(
          3,
          '/storage/products/July2023/n5GCWHcF8N587enb8s0Q.JPG',
        ),
      ],
      options: [
        ProductOption(
          id: 1,
          img: null,
          name: 'Dashing color Balance',
          originalName: 'Dashing color Balance',
          type: 'Color',
        ),
        ProductOption(
          id: 41,
          img: null,
          name: 'Non Directional Uph Fabric Giselle Dove (apply RR)',
          originalName: 'Non Directional Uph Fabric Giselle Dove (apply RR)',
          type: 'Fabric',
        ),
      ],
    ),
    const Product(
      id: 2,
      slug: 'val-cale-white-queen-long-flat-sheet-90x115',
      name: 'Val Cale: White Queen Long Flat Sheet, 90x115',
      mainImage: "/storage/products/catalog/13_Linens/ValCal180Sheets.jpg",
      price: 116.900000,
      originalPrice: 0.00,
      minPrice: 0,
      maxPrice: 0,
      uomCode: 'DZ',
      chidlren: [],
      images: [],
      options: [
        ProductOption(
          id: 2,
          img: null,
          name: 'Dashing color Bliss',
          originalName: 'Dashing color Bliss',
          type: 'Color',
        ),
        ProductOption(
          id: 42,
          img: null,
          name: 'Non Directional Uph Fabric Giselle Hunter (apply RR)',
          originalName: 'Non Directional Uph Fabric Giselle Hunter (apply RR)',
          type: 'Fabric',
        ),
      ],
    ),
    const Product(
      id: 3,
      slug: 'val-cale-white-queen-fitted-sheet-60x80x12',
      name: 'Val Cale: White Queen Fitted Sheet, 60x80x12',
      mainImage: "/storage/products/January2023/Q0TPCzKRK3oj6AzFk4Wc.JPG",
      price: 80.200000,
      originalPrice: 0,
      minPrice: 0,
      maxPrice: 0,
      uomCode: 'DZ',
      chidlren: [],
      images: [
        ProductImage(
          1,
          '/storage/products/January2023/Q0TPCzKRK3oj6AzFk4Wc.JPG',
        ),
        ProductImage(
          2,
          '/storage/products/July2023/nsLNVgWPR2rxuKEZ0TFC.JPG',
        ),
        ProductImage(
          3,
          '/storage/products/July2023/n5GCWHcF8N587enb8s0Q.JPG',
        ),
      ],
      options: [
        ProductOption(
          id: 1,
          img: null,
          name: 'Dashing color Balance',
          originalName: 'Dashing color Balance',
          type: 'Color',
        ),
        ProductOption(
          id: 41,
          img: null,
          name: 'Non Directional Uph Fabric Giselle Dove (apply RR)',
          originalName: 'Non Directional Uph Fabric Giselle Dove (apply RR)',
          type: 'Fabric',
        ),
      ],
    ),
    const Product(
      id: 4,
      slug: 'thomaston-unity-white-bath-towel-24x50-105-lbvpf',
      name: 'Thomaston Unity: White Bath Towel, 24x50, 10.5 lb,VPF',
      mainImage: "/storage/products\\catalog\\13_Linens\\UnityTowelsWhite.jpg",
      price: 100.000000,
      originalPrice: 32.0000,
      minPrice: null,
      maxPrice: null,
      uomCode: 'EA',
      chidlren: [],
      images: [],
      options: [],
    ),
  ];
}
